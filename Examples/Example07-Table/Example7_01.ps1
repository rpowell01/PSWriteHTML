﻿Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
)

$DataTable2 = @(
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
)

$RootDSE = Get-ADRootDSE
$TranslatedRootDSE = [ordered] @{ }
foreach ($Key in $RootDSE.PSObject.Properties.Name) {
    $TranslatedRootDSE["$Key"] = $RootDSE.$Key -join ', '
}

New-HTML {
    New-HTMLTable -DataTable $DataTable2 -Title 'Test1' # Title will be used for filename when using export

    New-HTMLTable -DataTable $DataTable1 -HideButtons

    #New-HTMLTable -DataTable $TranslatedRootDSE
} -ShowHTML -FilePath $PSScriptRoot\Example7_01.html -Online