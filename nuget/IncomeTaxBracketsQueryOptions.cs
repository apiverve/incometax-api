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
        public string Year { get; set; }
    }
}
