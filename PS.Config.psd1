@{
    RootModule           = 'PS.Config.psd1'
    ModuleVersion        = '0.7.1'
    GUID                 = '5EADD8B7-6E4B-40BE-8C80-B26A3434AEB4'
    Author               = 'Xenirvana'
    CompanyName          = 'Sierra Creative Workshop'
    Copyright            = 'Copyright (c) 2020-2021 Sierra Creative Studio. All rights reserved.'
    Description          = 'A PowerShell Module designed for working with PowerShell Data Files for Configuration of Scripts, Script Applications, and Modules.'
    CompatiblePSEditions = @('Core')
    FileList             = @('PS.Config.psm1', 'PS.Config.psd1', 'Import-Configuration.ps1', 'New-Configuration.ps1', 'Export-Configuration.ps1')
    # ModuleList           = @()
    # NestedModules        = @()
    FunctionsToExport    = @("New-Configuration", "Import-Configuration", "Export-Configuration")
    # CmdletsToExport      = @()
    VariablesToExport    = @()
    # AliasesToExport      = @()
    ScriptsToProcess     = @()
    TypesToProcess       = @()
    FormatsToProcess     = @()

    PrivateData          = @{
        PSData = @{
            Tags                       = @('powershell', 'core', 'posh', 'pwsh', 'psd1', 'configuration', 'data', 'file')
            LicenseUri                 = 'https://www.gnu.org/licenses/gpl-3.0.en.html'
            ProjectUri                 = 'https://github.com/SupernautSFX/PS.Config'
            IconUri                    = 'https://github.com/SupernautSFX/PoSh-PSD1-Configuration/blob/master/assets/psconfig.png'
            ReleaseNotes               = ''
            PreRelease                 = ''
            RequireLicenseAcceptance   = $false
            ExternalModuleDependencies = @()
            Extensions                 = @(
                @{
                    Module         = ''
                    MinimumVersion = ""
                    Details        = @{

                    }
                }
            )
        }
    }

    ExternalHelpUri      = ''
}
