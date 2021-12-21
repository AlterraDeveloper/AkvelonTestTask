###########################################################################
#  Calculate output files hashes for all binaries/assemblies and make hash/files manifest (xml or json for example)
###########################################################################

param(
    [string]$ReleasePath
)

# Строгий режим выполнения скрипта
Set-StrictMode -Version Latest

# Включаем настройку при которой любая ошибка в скрипте приведет к его завершению
$ErrorActionPreference = "Stop";

Set-Location -Path $PSScriptRoot

$manifestData = @()
foreach ($file in Get-ChildItem -Path $ReleasePath) {
    $manifestData += Get-FileHash "$ReleasePath\$file"
}
$manifestData | ConvertTo-Json | Out-File -FilePath "$ReleasePath\manifest.json" -Force
