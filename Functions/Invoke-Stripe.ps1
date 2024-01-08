using namespace Microsoft.PowerShell.Commands
function Invoke-Stripe {
  [CmdletBinding()]
  param (
    [ValidateNotNullOrEmpty()]
    [Microsoft.PowerShell.Commands.WebRequestMethod]$Method = 'Get',

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Path,

    [hashtable]$Body = @{}
  )
  if ([string]::IsNullOrEmpty($env:STRIPE_ENDPOINT)) {
    Write-Error 'STRIPE_ENDPOINT environment variable is not set'
    exit 1
  }
  if ([string]::IsNullOrEmpty($env:STRIPE_API_KEY)) {
    Write-Error 'STRIPE_API_KEY environment variable is not set'
    exit 1
  }
  $builder = [System.UriBuilder]::new($env:STRIPE_ENDPOINT)
  $builder.Path = $Path.TrimEnd('/')
  $invokeparams = @{
    Authentication       = 'Bearer'
    Method               = $Method
    Uri                  = $builder.ToString()
    SkipCertificateCheck = $true
    Token                = $env:STRIPE_API_KEY | ConvertTo-SecureString -AsPlainText -Force
  }
  if ($Body.Count -gt 0) {
    $invokeparams.Body = $Body
  }
  $response = Invoke-WebRequest @invokeparams
  if ($response.Content.Length -gt 0) {
    $response.Content | ConvertFrom-Json -Depth 99 | Write-Output
  }
}
