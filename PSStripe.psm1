Get-ChildItem "$PSScriptRoot/Functions" -Recurse -Include '*.ps1' | ForEach-Object {
  . $($_.FullName)
}
