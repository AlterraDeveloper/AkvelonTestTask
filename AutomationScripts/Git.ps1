###########################################################################
#  Get code from Git repo to a local folder
###########################################################################

param(
   [string]$ProjectPath,
   [string]$GitProjectUrl
)

# Строгий режим выполнения скрипта
Set-StrictMode -Version Latest

# Включаем настройку при которой любая ошибка в скрипте приведет к его завершению
$ErrorActionPreference = "Stop";

Set-Location -Path $PSScriptRoot

$gitExePath = "%USERPROFILE%\AppData\Local\Programs\Git\cmd\git.exe";
if (-NOT (Test-Path "$gitExePath")) {
   Write-Error "Git not installed on this computer"
   exit 1
}

Set-Alias gitExe $gitExePath

if (-NOT (Test-Path "$ProjectPath\.git")) {
   gitExe clone $GitProjectUrl $ProjectPath
}
else {
   gitExe pull
}

