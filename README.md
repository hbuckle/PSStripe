# PSStripe

A simple PowerShell wrapper around the [Stripe API](https://stripe.com/docs/api).

Tested using [stripe-mock](https://github.com/stripe/stripe-mock).

## Usage

```powershell
# to use the live API
$env:STRIPE_ENDPOINT = 'https://api.stripe.com'
# to use stripe-mock
$env:STRIPE_ENDPOINT = 'https://127.0.0.1:12112'

$env:STRIPE_API_KEY = 'sk_test_123'
Import-Module ./PSStripe.psd1
Get-StripeBalance
```
