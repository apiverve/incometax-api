// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     IncomeTaxBracketsData data = Converter.fromJsonString(jsonString);

package com.apiverve.incometax.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static IncomeTaxBracketsData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(IncomeTaxBracketsData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(IncomeTaxBracketsData.class);
        writer = mapper.writerFor(IncomeTaxBracketsData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// IncomeTaxBracketsData.java

package com.apiverve.incometax.data;

import com.fasterxml.jackson.annotation.*;
import java.time.OffsetDateTime;

public class IncomeTaxBracketsData {
    private long year;
    private String country;
    private String type;
    private Brackets brackets;
    private StandardDeduction standardDeduction;
    private OffsetDateTime lastUpdated;

    @JsonProperty("year")
    public long getYear() { return year; }
    @JsonProperty("year")
    public void setYear(long value) { this.year = value; }

    @JsonProperty("country")
    public String getCountry() { return country; }
    @JsonProperty("country")
    public void setCountry(String value) { this.country = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("brackets")
    public Brackets getBrackets() { return brackets; }
    @JsonProperty("brackets")
    public void setBrackets(Brackets value) { this.brackets = value; }

    @JsonProperty("standard_deduction")
    public StandardDeduction getStandardDeduction() { return standardDeduction; }
    @JsonProperty("standard_deduction")
    public void setStandardDeduction(StandardDeduction value) { this.standardDeduction = value; }

    @JsonProperty("lastUpdated")
    public OffsetDateTime getLastUpdated() { return lastUpdated; }
    @JsonProperty("lastUpdated")
    public void setLastUpdated(OffsetDateTime value) { this.lastUpdated = value; }
}

// Brackets.java

package com.apiverve.incometax.data;

import com.fasterxml.jackson.annotation.*;

public class Brackets {
    private HeadOfHousehold[] single;
    private HeadOfHousehold[] marriedFilingJointly;
    private HeadOfHousehold[] marriedFilingSeparately;
    private HeadOfHousehold[] headOfHousehold;

    @JsonProperty("single")
    public HeadOfHousehold[] getSingle() { return single; }
    @JsonProperty("single")
    public void setSingle(HeadOfHousehold[] value) { this.single = value; }

    @JsonProperty("married_filing_jointly")
    public HeadOfHousehold[] getMarriedFilingJointly() { return marriedFilingJointly; }
    @JsonProperty("married_filing_jointly")
    public void setMarriedFilingJointly(HeadOfHousehold[] value) { this.marriedFilingJointly = value; }

    @JsonProperty("married_filing_separately")
    public HeadOfHousehold[] getMarriedFilingSeparately() { return marriedFilingSeparately; }
    @JsonProperty("married_filing_separately")
    public void setMarriedFilingSeparately(HeadOfHousehold[] value) { this.marriedFilingSeparately = value; }

    @JsonProperty("head_of_household")
    public HeadOfHousehold[] getHeadOfHousehold() { return headOfHousehold; }
    @JsonProperty("head_of_household")
    public void setHeadOfHousehold(HeadOfHousehold[] value) { this.headOfHousehold = value; }
}

// HeadOfHousehold.java

package com.apiverve.incometax.data;

import com.fasterxml.jackson.annotation.*;

public class HeadOfHousehold {
    private double rate;
    private long min;
    private long max;

    @JsonProperty("rate")
    public double getRate() { return rate; }
    @JsonProperty("rate")
    public void setRate(double value) { this.rate = value; }

    @JsonProperty("min")
    public long getMin() { return min; }
    @JsonProperty("min")
    public void setMin(long value) { this.min = value; }

    @JsonProperty("max")
    public long getMax() { return max; }
    @JsonProperty("max")
    public void setMax(long value) { this.max = value; }
}

// StandardDeduction.java

package com.apiverve.incometax.data;

import com.fasterxml.jackson.annotation.*;

public class StandardDeduction {
    private long single;
    private long marriedFilingJointly;
    private long marriedFilingSeparately;
    private long headOfHousehold;

    @JsonProperty("single")
    public long getSingle() { return single; }
    @JsonProperty("single")
    public void setSingle(long value) { this.single = value; }

    @JsonProperty("married_filing_jointly")
    public long getMarriedFilingJointly() { return marriedFilingJointly; }
    @JsonProperty("married_filing_jointly")
    public void setMarriedFilingJointly(long value) { this.marriedFilingJointly = value; }

    @JsonProperty("married_filing_separately")
    public long getMarriedFilingSeparately() { return marriedFilingSeparately; }
    @JsonProperty("married_filing_separately")
    public void setMarriedFilingSeparately(long value) { this.marriedFilingSeparately = value; }

    @JsonProperty("head_of_household")
    public long getHeadOfHousehold() { return headOfHousehold; }
    @JsonProperty("head_of_household")
    public void setHeadOfHousehold(long value) { this.headOfHousehold = value; }
}