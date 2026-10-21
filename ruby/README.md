# Income Tax Brackets API - Ruby Gem

Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses. Paid plans can query specific historical tax years back to 2000.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_incometax'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_incometax
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_incometax'

# Initialize the client
client = APIVerve::Incometax::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  country: "US",
  year: 2024
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ country: "US", year: 2024 })
  puts response["data"]
rescue APIVerve::Incometax::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Incometax::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Incometax::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/incometax?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/incometax?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/incometax?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
