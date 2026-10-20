# [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses. Paid plans can query specific historical tax years back to 2000.

The Income Tax Brackets API provides a simple, reliable way to integrate income tax brackets functionality into your applications. Built for developers who need production-ready income tax brackets capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/incometax?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/incometax?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/incometax)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.IncomeTaxBrackets)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-incometax/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_incometax)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/incometax)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_incometax)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callIncomeTaxBracketsAPI() {
    try {
        const params = new URLSearchParams({
            country: 'US'
        });

        const response = await fetch(`https://api.apiverve.com/v1/incometax?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callIncomeTaxBracketsAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/incometax?country=US" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/incometax
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/incometax) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.IncomeTaxBrackets
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.IncomeTaxBrackets) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-incometax
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-incometax/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_incometax
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_incometax) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/incometax
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/incometax) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_incometax
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_incometax) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:incometax-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/incometax-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/incometax](https://docs.apiverve.com/ref/incometax)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Income Tax Brackets API is commonly used for:

- **Web Applications** - Add income tax brackets features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with income tax brackets capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Income Tax Brackets API:

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

## Support & Community

- 🏠 **API Home**: [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
