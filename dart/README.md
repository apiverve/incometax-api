# Income Tax Brackets API - Dart/Flutter Client

Income Tax Brackets is a tool for retrieving US federal income tax bracket data by year. It returns tax rates, income ranges, and standard deductions for all filing statuses.

[![pub package](https://img.shields.io/pub/v/apiverve_incometax.svg)](https://pub.dev/packages/apiverve_incometax)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_incometax: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_incometax/apiverve_incometax.dart';

void main() async {
  final client = IncometaxClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'country': 'US',
      'year': 2024
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Income Tax Brackets API](https://apiverve.com/marketplace/incometax?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/incometax](https://docs.apiverve.com/ref/incometax?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
