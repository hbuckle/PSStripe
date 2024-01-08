@{
  RootModule         = 'PSStripe.psm1'
  ModuleVersion      = '1.0'
  PowerShellVersion  = '7.0'
  GUID               = '3624e74a-cb61-4add-bae2-a351208f472e'
  Author             = 'Henry Buckle'
  RequiredModules    = @(
    'Microsoft.PowerShell.Utility'
  )
  RequiredAssemblies = @()
  FunctionsToExport  = @(
    'Get-StripeBalance',
    'Get-StripeBalanceTransaction',
    'Get-StripeCustomer'
  )
}
