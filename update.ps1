import-module au

$domain   = 'https://github.com'
$releases = "$domain/tasmota/tasmotizer/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
  $regex   = 'tasmotizer-\d+.\d+(.\d+)?.exe$'
  $sublink     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
  $url = ($domain, $sublink) -join ''
  $token = $url -split 'tasmotizer-' | select -First 1 -Skip 1 #3
  $version = $token -split '.exe' | select -Last 1 -Skip 1 #3
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
