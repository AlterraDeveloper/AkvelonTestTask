###########################################################################
#  Modify project setting to enable debug symbols in release configuration of the projects
###########################################################################

param(
    [string]$ProjectPath
)

# Строгий режим выполнения скрипта
Set-StrictMode -Version Latest

# Включаем настройку при которой любая ошибка в скрипте приведет к его завершению
# $ErrorActionPreference = "Stop";

Set-Location -Path $PSScriptRoot

$csProjectFiles = Get-Item -Path "$ProjectPath\*\*.csproj"
$cppProjectFiles = Get-Item -Path "$ProjectPath\*\*.vcxproj"

# Write-Output $csProjectFiles
# Write-Output $cppProjectFiles

foreach ($csProjectFile in $csProjectFiles) {
    
    $xml = New-Object XML
    $xml.Load($csProjectFile)

    foreach ($propertyGroupNode in $xml.Project.PropertyGroup) {

        if (-not $propertyGroupNode.HasAttribute('Condition')) { continue; }

        $propertyGroupCondition = $propertyGroupNode | Select-Object -Property Condition

        if ($propertyGroupCondition -notlike "*Release*") { continue; }
        
        if ($null -eq $propertyGroupNode | Select-Object -Property DebugSymbols) {
            $debugSymbolsNode = $xml.CreateElement("DebugSymbols", $xml.Project.NamespaceURI)
            $propertyGroupNode.AppendChild($debugSymbolsNode)
        }
        $propertyGroupNode.DebugSymbols = "TRUE"
    }
    $xml.Save($csProjectFile)
}