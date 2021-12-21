###########################################################################
#  Copy resulted pdbs into a separate folder called Symbols in the same release location, saving original folder hierarchy
###########################################################################

param(
    [string]$ReleasePath
)

# Строгий режим выполнения скрипта
Set-StrictMode -Version Latest

# Включаем настройку при которой любая ошибка в скрипте приведет к его завершению
$ErrorActionPreference = "Stop";

Set-Location -Path $PSScriptRoot

$symbolsPath = "$ReleasePath\Symbols" 

New-Item $symbolsPath -ItemType Directory -Force

Copy-Item "$ReleasePath\*.pdb" -Destination $symbolsPath 
