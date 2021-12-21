###########################################################################
#  Build code in release configuration with any build engine/script (msbuild for example)
###########################################################################

param(
    [string]$SolutionPath
)

# Строгий режим выполнения скрипта
Set-StrictMode -Version Latest

# Включаем настройку при которой любая ошибка в скрипте приведет к его завершению
$ErrorActionPreference = "Stop";

Set-Location -Path $PSScriptRoot

#Restore NuGet packages
# & path_to_\NuGet.exe restore $SolutionPath

#build solution
& "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe" `
    $SolutionPath `
    /t:Build `
    /p:Configuration=Release `
    /p:OutputPath=C:\Code\AkvelonTestTask\Release

