function Get-StripeBalance {
  [OutputType([System.Management.Automation.PSCustomObject])]
  [CmdletBinding()]
  param ()
  Invoke-Stripe -Path 'v1/balance'
}
