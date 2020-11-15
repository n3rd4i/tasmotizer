$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fileName = [io.path]::GetFileName($url)
$basename = ([io.path]::GetFileNameWithoutExtension($fileName) -split "-")[0]
$ext = [io.path]::GetExtension($fileName)
$trimmed = [System.String]::Concat($basename, $ext)
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$(Join-Path $toolsDir $trimmed)"
  url           = 'https://github.com/tasmota/tasmotizer/releases/download/v1.1a/tasmotizer-1.1a.exe'
  checksum      = 'A41C2129960AFD3C044931DB75C88D3FE9A15E8995A86A7C65961F82B7DCFDF3'
  checksumType  = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
