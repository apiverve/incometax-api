// Package incometax provides a Go client for the Income Tax Brackets API.
//
// For more information, visit: https://apiverve.com/marketplace/incometax?utm_source=go&utm_medium=readme
package incometax

import (
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

// ValidationRule defines validation constraints for a parameter.
type ValidationRule struct {
	Type      string
	Required  bool
	Min       *float64
	Max       *float64
	MinLength *int
	MaxLength *int
	Format    string
	Enum      []string
}

// ValidationError represents a parameter validation error.
type ValidationError struct {
	Errors []string
}

func (e *ValidationError) Error() string {
	return "Validation failed: " + strings.Join(e.Errors, "; ")
}

// Helper functions for pointers
func float64Ptr(v float64) *float64 { return &v }
func intPtr(v int) *int             { return &v }

// Format validation patterns
var formatPatterns = map[string]*regexp.Regexp{
	"email":    regexp.MustCompile(`^[^\s@]+@[^\s@]+\.[^\s@]+$`),
	"url":      regexp.MustCompile(`^https?://.+`),
	"ip":       regexp.MustCompile(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`),
	"date":     regexp.MustCompile(`^\d{4}-\d{2}-\d{2}$`),
	"hexColor": regexp.MustCompile(`^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$`),
}

// Request contains the parameters for the Income Tax Brackets API.
//
// Parameters:
//   - country (required): string - The country code (currently only 'US' is supported) [minLength: 2, maxLength: 2]
//   - year: integer - The tax year to retrieve brackets for. Defaults to the previous year. [min: 2000, max: 2030]
type Request struct {
	Country string `json:"country"` // Required
	Year int `json:"year,omitempty"` // Optional
}

// ToQueryParams converts the request struct to a map of query parameters.
// Only non-zero values are included.
func (r *Request) ToQueryParams() map[string]string {
	params := make(map[string]string)
	if r == nil {
		return params
	}

	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		// Get the json tag for the field name
		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		// Handle tags like `json:"name,omitempty"`
		jsonName := strings.Split(jsonTag, ",")[0]
		if jsonName == "-" {
			continue
		}

		// Skip zero values
		if field.IsZero() {
			continue
		}

		// Convert to string
		params[jsonName] = fmt.Sprintf("%v", field.Interface())
	}

	return params
}

// Validate checks the request parameters against validation rules.
// Returns a ValidationError if validation fails, nil otherwise.
func (r *Request) Validate() error {
	rules := map[string]ValidationRule{
		"country": {Type: "string", Required: true, MinLength: intPtr(2), MaxLength: intPtr(2)},
		"year": {Type: "integer", Required: false, Min: float64Ptr(2000), Max: float64Ptr(2030)},
	}

	if len(rules) == 0 {
		return nil
	}

	var errors []string
	v := reflect.ValueOf(*r)
	t := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldType := t.Field(i)

		jsonTag := fieldType.Tag.Get("json")
		if jsonTag == "" {
			continue
		}
		jsonName := strings.Split(jsonTag, ",")[0]

		rule, exists := rules[jsonName]
		if !exists {
			continue
		}

		// Check required
		if rule.Required && field.IsZero() {
			errors = append(errors, fmt.Sprintf("Required parameter [%s] is missing", jsonName))
			continue
		}

		if field.IsZero() {
			continue
		}

		// Type-specific validation
		switch rule.Type {
		case "integer", "number":
			var numVal float64
			switch field.Kind() {
			case reflect.Int, reflect.Int64:
				numVal = float64(field.Int())
			case reflect.Float64:
				numVal = field.Float()
			}
			if rule.Min != nil && numVal < *rule.Min {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %v", jsonName, *rule.Min))
			}
			if rule.Max != nil && numVal > *rule.Max {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %v", jsonName, *rule.Max))
			}

		case "string":
			strVal := field.String()
			if rule.MinLength != nil && len(strVal) < *rule.MinLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at least %d characters", jsonName, *rule.MinLength))
			}
			if rule.MaxLength != nil && len(strVal) > *rule.MaxLength {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be at most %d characters", jsonName, *rule.MaxLength))
			}
			if rule.Format != "" {
				if pattern, ok := formatPatterns[rule.Format]; ok {
					if !pattern.MatchString(strVal) {
						errors = append(errors, fmt.Sprintf("Parameter [%s] must be a valid %s", jsonName, rule.Format))
					}
				}
			}
		}

		// Enum validation
		if len(rule.Enum) > 0 {
			strVal := fmt.Sprintf("%v", field.Interface())
			found := false
			for _, enumVal := range rule.Enum {
				if strVal == enumVal {
					found = true
					break
				}
			}
			if !found {
				errors = append(errors, fmt.Sprintf("Parameter [%s] must be one of: %s", jsonName, strings.Join(rule.Enum, ", ")))
			}
		}
	}

	if len(errors) > 0 {
		return &ValidationError{Errors: errors}
	}
	return nil
}

// ResponseData contains the data returned by the Income Tax Brackets API.
type ResponseData struct {
	Year int `json:"year"`
	Country string `json:"country"`
	Type string `json:"type"`
	Brackets BracketsData `json:"brackets"`
	StandardDeduction StandardDeductionData `json:"standard_deduction"`
	LastUpdated string `json:"lastUpdated"`
}

// BracketsData represents the brackets object.
type BracketsData struct {
	Single []SingleItem `json:"single"`
	MarriedFilingJointly []MarriedFilingJointlyItem `json:"married_filing_jointly"`
	MarriedFilingSeparately []MarriedFilingSeparatelyItem `json:"married_filing_separately"`
	HeadOfHousehold []HeadOfHouseholdItem `json:"head_of_household"`
}

// SingleItem represents an item in the Single array.
type SingleItem struct {
	Rate float64 `json:"rate"`
	Min int `json:"min"`
	Max int `json:"max"`
}

// MarriedFilingJointlyItem represents an item in the MarriedFilingJointly array.
type MarriedFilingJointlyItem struct {
	Rate float64 `json:"rate"`
	Min int `json:"min"`
	Max int `json:"max"`
}

// MarriedFilingSeparatelyItem represents an item in the MarriedFilingSeparately array.
type MarriedFilingSeparatelyItem struct {
	Rate float64 `json:"rate"`
	Min int `json:"min"`
	Max int `json:"max"`
}

// HeadOfHouseholdItem represents an item in the HeadOfHousehold array.
type HeadOfHouseholdItem struct {
	Rate float64 `json:"rate"`
	Min int `json:"min"`
	Max int `json:"max"`
}

// StandardDeductionData represents the standard_deduction object.
type StandardDeductionData struct {
	Single int `json:"single"`
	MarriedFilingJointly int `json:"married_filing_jointly"`
	MarriedFilingSeparately int `json:"married_filing_separately"`
	HeadOfHousehold int `json:"head_of_household"`
}
