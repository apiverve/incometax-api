Income Tax Brackets API
============

Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses. Paid plans can query specific historical tax years back to 2000.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-incometaxbrackets.svg)](https://pypi.org/project/apiverve-incometaxbrackets/)

This is a Python wrapper for the [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-incometaxbrackets
```

Using `pip3`:

```bash
pip3 install apiverve-incometaxbrackets
```

---

## Configuration

Before using the Income Tax Brackets API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient

# Initialize the client with your APIVerve API key
api = IncometaxAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "year": 2024
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Income Tax Brackets API documentation is found here: [https://docs.apiverve.com/ref/incometax](https://docs.apiverve.com/ref/incometax?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient

# Initialize the client with your APIVerve API key
api = IncometaxAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "country": "US",
    "year": 2024
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `IncometaxAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient, IncometaxAPIClientError

api = IncometaxAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "year": 2024
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except IncometaxAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient, IncometaxAPIClientError

api = IncometaxAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "year": 2024
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except IncometaxAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient, IncometaxAPIClientError

query = {
    "country": "US",
    "year": 2024
}

# Using context manager ensures proper cleanup
with IncometaxAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except IncometaxAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient

# Enable debug mode
api = IncometaxAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "country": "US",
    "year": 2024
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient

api = IncometaxAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "year": 2024
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
