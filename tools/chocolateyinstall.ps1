$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://mosquitto.org/files/binary/win32/mosquitto-1.6.9-install-windows-x86.exe'
$url64      = 'https://mosquitto.org/files/binary/win64/mosquitto-1.6.9-install-windows-x64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  softwareName  = 'mosquitto*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # Checksums are now required as of 0.10.0.
  # To determine checksums, you can get that from the original site if provided. 
  # You can also use checksum.exe (choco install checksum) and use it 
  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '4073c95e36db576cde6e34d9ac503c351b1f0ed83a7d8631d5dd87b6a2f90765'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = 'dcdfe445dcb35bea0d62e7f7fc0ff9946da5122e5fefca7f9e0dae179c7a6665'
  checksumType64= 'sha256' #default is checksumType

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'           # NSIS
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
#Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
## If you are making your own internal packages (organizations), you can embed the installer or 
## put on internal file share and use the following instead (you'll need to add $file to the above)
#Install-ChocolateyInstallPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-install-package
