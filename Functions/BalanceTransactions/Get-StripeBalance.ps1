function Get-StripeBalanceTransaction {
  [OutputType([System.Management.Automation.PSCustomObject])]
  [CmdletBinding(DefaultParameterSetName = 'List')]
  param (
    [Parameter(Mandatory = $true, ParameterSetName = 'Id')]
    [string]$Id,

    [Parameter(ParameterSetName = 'List')]
    [int]$Limit = 10
  )
  if ($PSCmdlet.ParameterSetName -eq 'List') {
    Invoke-Stripe -Path 'v1/balance_transactions' -Body @{limit = $Limit} | Select-Object -ExpandProperty 'data'
  }
  else {
    Invoke-Stripe -Path "v1/balance_transactions/${Id}"
  }
}
