Income Tax Brackets API
============

Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses. Paid plans can query specific historical tax years back to 2000.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.IncomeTaxBrackets.svg)](https://www.nuget.org/packages/APIVerve.API.IncomeTaxBrackets)

This is a .NET wrapper for the [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.IncomeTaxBrackets
```

Using the Package Manager:
```
nuget install APIVerve.API.IncomeTaxBrackets
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.IncomeTaxBrackets
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.IncomeTaxBrackets"
5. Click on the APIVerve.API.IncomeTaxBrackets package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Income Tax Brackets API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.IncomeTaxBrackets;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new IncomeTaxBracketsQueryOptions {
            Country = "US",
            Year = 2024
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Income Tax Brackets API documentation is found here: [https://docs.apiverve.com/ref/incometax](https://docs.apiverve.com/ref/incometax?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Income Tax Brackets API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.IncomeTaxBrackets;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new IncomeTaxBracketsQueryOptions {
            Country = "US",
            Year = 2024
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.IncomeTaxBrackets;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new IncomeTaxBracketsQueryOptions {
            Country = "US",
            Year = 2024
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.IncomeTaxBrackets;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new IncomeTaxBracketsQueryOptions {
            Country = "US",
            Year = 2024
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.IncomeTaxBrackets;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new IncomeTaxBracketsQueryOptions {
            Country = "US",
            Year = 2024
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new IncomeTaxBracketsQueryOptions {
    Country = "US",
    Year = 2024
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new IncomeTaxBracketsQueryOptions {
    Country = "US",
    Year = 2024
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new IncomeTaxBracketsQueryOptions {
    Country = "US",
    Year = 2024
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new IncomeTaxBracketsQueryOptions {
    Country = "US",
    Year = 2024
};

using (var apiClient = new IncomeTaxBracketsAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "year": 2025,
    "country": "US",
    "type": "federal",
    "brackets": {
      "single": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 11924
        },
        {
          "rate": 0.12,
          "min": 11925,
          "max": 48474
        },
        {
          "rate": 0.22,
          "min": 48475,
          "max": 103349
        },
        {
          "rate": 0.24,
          "min": 103350,
          "max": 197299
        },
        {
          "rate": 0.32,
          "min": 197300,
          "max": 250524
        },
        {
          "rate": 0.35,
          "min": 250525,
          "max": 626349
        },
        {
          "rate": 0.37,
          "min": 626350,
          "max": 999999999
        }
      ],
      "married_filing_jointly": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 23849
        },
        {
          "rate": 0.12,
          "min": 23850,
          "max": 96949
        },
        {
          "rate": 0.22,
          "min": 96950,
          "max": 206699
        },
        {
          "rate": 0.24,
          "min": 206700,
          "max": 394599
        },
        {
          "rate": 0.32,
          "min": 394600,
          "max": 501049
        },
        {
          "rate": 0.35,
          "min": 501050,
          "max": 751599
        },
        {
          "rate": 0.37,
          "min": 751600,
          "max": 999999999
        }
      ],
      "married_filing_separately": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 11924
        },
        {
          "rate": 0.12,
          "min": 11925,
          "max": 48474
        },
        {
          "rate": 0.22,
          "min": 48475,
          "max": 103349
        },
        {
          "rate": 0.24,
          "min": 103350,
          "max": 197299
        },
        {
          "rate": 0.32,
          "min": 197300,
          "max": 250524
        },
        {
          "rate": 0.35,
          "min": 250525,
          "max": 375799
        },
        {
          "rate": 0.37,
          "min": 375800,
          "max": 999999999
        }
      ],
      "head_of_household": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 16999
        },
        {
          "rate": 0.12,
          "min": 17000,
          "max": 64849
        },
        {
          "rate": 0.22,
          "min": 64850,
          "max": 103349
        },
        {
          "rate": 0.24,
          "min": 103350,
          "max": 197299
        },
        {
          "rate": 0.32,
          "min": 197300,
          "max": 250499
        },
        {
          "rate": 0.35,
          "min": 250500,
          "max": 626349
        },
        {
          "rate": 0.37,
          "min": 626350,
          "max": 999999999
        }
      ]
    },
    "standard_deduction": {
      "single": 15000,
      "married_filing_jointly": 30000,
      "married_filing_separately": 15000,
      "head_of_household": 22500
    },
    "lastUpdated": "2026-02-07T06:02:41.898Z",
    "marriagePenalty": {
      "appliesFromRate": 0.37,
      "singleThreshold": 626350,
      "jointThreshold": 751600,
      "jointShortfall": 501100
    },
    "effectiveRateCurve": {
      "single": [
        {
          "income": 25000,
          "taxableIncome": 10000,
          "tax": 1000,
          "effectiveRate": 0.04,
          "marginalRate": 0.1
        },
        {
          "income": 50000,
          "taxableIncome": 35000,
          "tax": 3961.4,
          "effectiveRate": 0.0792,
          "marginalRate": 0.12
        },
        {
          "income": 100000,
          "taxableIncome": 85000,
          "tax": 13613.78,
          "effectiveRate": 0.1361,
          "marginalRate": 0.22
        },
        {
          "income": 250000,
          "taxableIncome": 235000,
          "tax": 52262.32,
          "effectiveRate": 0.209,
          "marginalRate": 0.32
        },
        {
          "income": 1000000,
          "taxableIncome": 985000,
          "tax": 321468.9,
          "effectiveRate": 0.3215,
          "marginalRate": 0.37
        }
      ],
      "married_filing_jointly": [
        {
          "income": 25000,
          "taxableIncome": 0,
          "tax": 0,
          "effectiveRate": 0,
          "marginalRate": 0.1
        },
        {
          "income": 50000,
          "taxableIncome": 20000,
          "tax": 2000,
          "effectiveRate": 0.04,
          "marginalRate": 0.1
        },
        {
          "income": 100000,
          "taxableIncome": 70000,
          "tax": 7922.9,
          "effectiveRate": 0.0792,
          "marginalRate": 0.12
        },
        {
          "income": 250000,
          "taxableIncome": 220000,
          "tax": 38493.56,
          "effectiveRate": 0.154,
          "marginalRate": 0.24
        },
        {
          "income": 1000000,
          "taxableIncome": 970000,
          "tax": 282961.15,
          "effectiveRate": 0.283,
          "marginalRate": 0.37
        }
      ],
      "married_filing_separately": [
        {
          "income": 25000,
          "taxableIncome": 10000,
          "tax": 1000,
          "effectiveRate": 0.04,
          "marginalRate": 0.1
        },
        {
          "income": 50000,
          "taxableIncome": 35000,
          "tax": 3961.4,
          "effectiveRate": 0.0792,
          "marginalRate": 0.12
        },
        {
          "income": 100000,
          "taxableIncome": 85000,
          "tax": 13613.78,
          "effectiveRate": 0.1361,
          "marginalRate": 0.22
        },
        {
          "income": 250000,
          "taxableIncome": 235000,
          "tax": 52262.32,
          "effectiveRate": 0.209,
          "marginalRate": 0.32
        },
        {
          "income": 1000000,
          "taxableIncome": 985000,
          "tax": 326479.9,
          "effectiveRate": 0.3265,
          "marginalRate": 0.37
        }
      ],
      "head_of_household": [
        {
          "income": 25000,
          "taxableIncome": 2500,
          "tax": 250,
          "effectiveRate": 0.01,
          "marginalRate": 0.1
        },
        {
          "income": 50000,
          "taxableIncome": 27500,
          "tax": 2959.9,
          "effectiveRate": 0.0592,
          "marginalRate": 0.12
        },
        {
          "income": 100000,
          "taxableIncome": 77500,
          "tax": 10224.78,
          "effectiveRate": 0.1022,
          "marginalRate": 0.22
        },
        {
          "income": 250000,
          "taxableIncome": 227500,
          "tax": 48123.32,
          "effectiveRate": 0.1925,
          "marginalRate": 0.32
        },
        {
          "income": 1000000,
          "taxableIncome": 977500,
          "tax": 316955.65,
          "effectiveRate": 0.317,
          "marginalRate": 0.37
        }
      ]
    },
    "changes": {
      "versusYear": 2024,
      "indexingPercent": 2.794,
      "bracketShifts": {
        "single": [
          {
            "rate": 0.12,
            "from": 11600,
            "to": 11925,
            "shiftPercent": 2.802
          },
          {
            "rate": 0.22,
            "from": 47150,
            "to": 48475,
            "shiftPercent": 2.81
          },
          {
            "rate": 0.24,
            "from": 100525,
            "to": 103350,
            "shiftPercent": 2.81
          },
          {
            "rate": 0.32,
            "from": 191950,
            "to": 197300,
            "shiftPercent": 2.787
          },
          {
            "rate": 0.35,
            "from": 243725,
            "to": 250525,
            "shiftPercent": 2.79
          },
          {
            "rate": 0.37,
            "from": 609350,
            "to": 626350,
            "shiftPercent": 2.79
          }
        ],
        "married_filing_jointly": [
          {
            "rate": 0.12,
            "from": 23200,
            "to": 23850,
            "shiftPercent": 2.802
          },
          {
            "rate": 0.22,
            "from": 94300,
            "to": 96950,
            "shiftPercent": 2.81
          },
          {
            "rate": 0.24,
            "from": 201050,
            "to": 206700,
            "shiftPercent": 2.81
          },
          {
            "rate": 0.32,
            "from": 383900,
            "to": 394600,
            "shiftPercent": 2.787
          },
          {
            "rate": 0.35,
            "from": 487450,
            "to": 501050,
            "shiftPercent": 2.79
          },
          {
            "rate": 0.37,
            "from": 731200,
            "to": 751600,
            "shiftPercent": 2.79
          }
        ],
        "married_filing_separately": [
          {
            "rate": 0.12,
            "from": 11600,
            "to": 11925,
            "shiftPercent": 2.802
          },
          {
            "rate": 0.22,
            "from": 47150,
            "to": 48475,
            "shiftPercent": 2.81
          },
          {
            "rate": 0.24,
            "from": 100525,
            "to": 103350,
            "shiftPercent": 2.81
          },
          {
            "rate": 0.32,
            "from": 191950,
            "to": 197300,
            "shiftPercent": 2.787
          },
          {
            "rate": 0.35,
            "from": 243725,
            "to": 250525,
            "shiftPercent": 2.79
          },
          {
            "rate": 0.37,
            "from": 365600,
            "to": 375800,
            "shiftPercent": 2.79
          }
        ],
        "head_of_household": [
          {
            "rate": 0.12,
            "from": 16550,
            "to": 17000,
            "shiftPercent": 2.719
          },
          {
            "rate": 0.22,
            "from": 63100,
            "to": 64850,
            "shiftPercent": 2.773
          },
          {
            "rate": 0.24,
            "from": 100500,
            "to": 103350,
            "shiftPercent": 2.836
          },
          {
            "rate": 0.32,
            "from": 191950,
            "to": 197300,
            "shiftPercent": 2.787
          },
          {
            "rate": 0.35,
            "from": 243700,
            "to": 250500,
            "shiftPercent": 2.79
          },
          {
            "rate": 0.37,
            "from": 609350,
            "to": 626350,
            "shiftPercent": 2.79
          }
        ]
      },
      "standardDeduction": {
        "single": {
          "from": 14600,
          "to": 15000,
          "change": 400,
          "changePercent": 2.74
        },
        "married_filing_jointly": {
          "from": 29200,
          "to": 30000,
          "change": 800,
          "changePercent": 2.74
        },
        "married_filing_separately": {
          "from": 14600,
          "to": 15000,
          "change": 400,
          "changePercent": 2.74
        },
        "head_of_household": {
          "from": 21900,
          "to": 22500,
          "change": 600,
          "changePercent": 2.74
        }
      }
    }
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
