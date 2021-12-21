###########################################################################
#  Make a zip archive including all binaries/assemblies and generated manifest (use 7zip, Windows built in or any other)
###########################################################################

param(
    [string]$ReleasePath
)

# Строгий режим выполнения скрипта
Set-StrictMode -Version Latest

# Включаем настройку при которой любая ошибка в скрипте приведет к его завершению
$ErrorActionPreference = "Stop";

Set-Location -Path $PSScriptRoot

7z a -t7z -mx9 -mmt=on `
    "$ReleasePath\Release.7z" `
    "$ReleasePath\*"