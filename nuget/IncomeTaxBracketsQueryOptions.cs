using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.IncomeTaxBrackets
{
    /// <summary>
    /// Query options for the Income Tax Brackets API
    /// </summary>
    public class IncomeTaxBracketsQueryOptions
    {
        /// <summary>
        /// The country code (currently only 'US' is supported)
        /// </summary>
        [JsonProperty("country")]
        public string Country { get; set; }

        /// <summary>
        /// The tax year to retrieve brackets for. Defaults to the previous year.
        /// </summary>
        [JsonProperty("year")]
        public int? Year { get; set; }

        /// <summary>
        /// Two-letter US state code (or DC) to add that state's income tax brackets, standard deduction and personal exemption. States with no wage income tax return hasIncomeTax false. State tables start at 2023; a later year not yet published uses the latest edition.
        /// </summary>
        [JsonProperty("state")]
        public string State { get; set; }
    }
}
