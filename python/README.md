Income Tax Brackets API
============

Income Tax Brackets is a tool for retrieving US federal income tax bracket data by year. It returns tax rates, income ranges, and standard deductions for all filing statuses.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source=pypi&utm_medium=readme)

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

Before using the incometax API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient

# Initialize the client with your APIVerve API key
api = IncometaxAPIClient("[YOUR_API_KEY]")

query = { "country": "US", "year": 2024 }

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

The Income Tax Brackets API documentation is found here: [https://docs.apiverve.com/ref/incometax](https://docs.apiverve.com/ref/incometax?utm_source=pypi&utm_medium=readme).
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
query = { "country": "US", "year": 2024 }
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
          "max": 11925
        },
        {
          "rate": 0.12,
          "min": 11926,
          "max": 48475
        },
        {
          "rate": 0.22,
          "min": 48476,
          "max": 103350
        },
        {
          "rate": 0.24,
          "min": 103351,
          "max": 197300
        },
        {
          "rate": 0.32,
          "min": 197301,
          "max": 250525
        },
        {
          "rate": 0.35,
          "min": 250526,
          "max": 626350
        },
        {
          "rate": 0.37,
          "min": 626351,
          "max": 999999999
        }
      ],
      "married_filing_jointly": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 23850
        },
        {
          "rate": 0.12,
          "min": 23851,
          "max": 96950
        },
        {
          "rate": 0.22,
          "min": 96951,
          "max": 206700
        },
        {
          "rate": 0.24,
          "min": 206701,
          "max": 394600
        },
        {
          "rate": 0.32,
          "min": 394601,
          "max": 501050
        },
        {
          "rate": 0.35,
          "min": 501051,
          "max": 751600
        },
        {
          "rate": 0.37,
          "min": 751601,
          "max": 999999999
        }
      ],
      "married_filing_separately": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 11925
        },
        {
          "rate": 0.12,
          "min": 11926,
          "max": 48475
        },
        {
          "rate": 0.22,
          "min": 48476,
          "max": 103350
        },
        {
          "rate": 0.24,
          "min": 103351,
          "max": 197300
        },
        {
          "rate": 0.32,
          "min": 197301,
          "max": 250525
        },
        {
          "rate": 0.35,
          "min": 250526,
          "max": 375800
        },
        {
          "rate": 0.37,
          "min": 375801,
          "max": 999999999
        }
      ],
      "head_of_household": [
        {
          "rate": 0.1,
          "min": 0,
          "max": 17000
        },
        {
          "rate": 0.12,
          "min": 17001,
          "max": 64850
        },
        {
          "rate": 0.22,
          "min": 64851,
          "max": 103350
        },
        {
          "rate": 0.24,
          "min": 103351,
          "max": 197300
        },
        {
          "rate": 0.32,
          "min": 197301,
          "max": 250500
        },
        {
          "rate": 0.35,
          "min": 250501,
          "max": 626350
        },
        {
          "rate": 0.37,
          "min": 626351,
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
    "lastUpdated": "2026-02-05T04:00:00.000Z"
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

query = { "country": "US", "year": 2024 }

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

query = { "country": "US", "year": 2024 }

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

query = { "country": "US", "year": 2024 }

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

query = { "country": "US", "year": 2024 }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_incometaxbrackets.apiClient import IncometaxAPIClient

api = IncometaxAPIClient("[YOUR_API_KEY]")

try:
    query = { "country": "US", "year": 2024 }
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
