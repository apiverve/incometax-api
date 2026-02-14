# Income Tax Brackets API

Income Tax Brackets is a tool for retrieving US federal income tax bracket data by year. It returns tax rates, income ranges, and standard deductions for all filing statuses.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)
[![npm version](https://img.shields.io/npm/v/@apiverve/incometax.svg)](https://www.npmjs.com/package/@apiverve/incometax)

This is a Javascript Wrapper for the [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source=npm&utm_medium=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/incometax
```

Using yarn:
```shell
yarn add @apiverve/incometax
```

---

## Configuration

Before using the Income Tax Brackets API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=readme)

The Income Tax Brackets API documentation is found here: [https://docs.apiverve.com/ref/incometax](https://docs.apiverve.com/ref/incometax?utm_source=npm&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const incometaxAPI = require('@apiverve/incometax');
const api = new incometaxAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  country: "US",
  year: 2024
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  country: "US",
  year: 2024
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  country: "US",
  year: 2024
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=npm&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
