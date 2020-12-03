$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$(Join-Path $toolsDir 'tasmotizer.exe')"
  url           = 'https://github.com/tasmota/tasmotizer/releases/download/v.1.2/tasmotizer-1.2.exe'
  checksum      = '445362b51bf855f62f9af7bb8362c8b27c7bc1ceb1dc88fd41a72de19b779969'
  checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs -GetOriginalFileName
