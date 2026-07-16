# Income Tax Brackets API - PHP Package

Income Tax Brackets is a tool for retrieving US federal income tax bracket data by year. It returns tax rates, income ranges, and standard deductions for all filing statuses.

## Installation

Install via Composer:

```bash
composer require apiverve/incometax
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Incometax\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'country' => 'US',
    'year' => 2024
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Incometax\Client;
use APIVerve\Incometax\Exceptions\APIException;
use APIVerve\Incometax\Exceptions\ValidationException;

try {
    $response = $client->execute(['country' => 'US', 'year' => 2024]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/incometax?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/incometax?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/incometax?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
