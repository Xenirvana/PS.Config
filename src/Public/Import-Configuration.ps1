function Import-Configuration {
    <#
        .SYNOPSIS
            Loads all *.psd1 Configuration Files and Imports settings.

        .DESCRIPTION
            Loads and Initializes *.psd1 Configuration File(s) for Scripts/Modules.
 
        .PARAMETER ConfigRoot
            Specifies the path to a directory containing the relevant *.psd1 Configuration file(s).

        .EXAMPLE
            PS C:\> Import-Configuration -ConfigRoot "C:\lib\powershell\config"

        .LINK
            https://github.com/SupernautSFX/PS.Config

        .NOTES
            Filename: 'Import-Configuration.ps1'
            Version: 0.5.0
            Author: N.W.P.
            CreatedOn: 09/14/21
    #>

    [CmdletBinding()]

    param(
        [Parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "Specify the Root Directory containing your configuration file(s)."
        )]
        [String]$ConfigRoot
    )

    BEGIN {
        Write-Verbose "[+] [SETUP]: Loading Configuration Files & Settings..."
        $ConfigFiles = Get-ChildItem $ConfigRoot -Include *.psd1 -Recurse 
        $Config = New-Object hashtable
    }

    PROCESS {
        ForEach ($ConfigFile in $ConfigFiles) {
            TRY {
                $BaseName = $ConfigFile.Name.Split('.')[0]
                $Config.BaseName = (Import-PowerShellDataFile -Path $ConfigFile.FullName)
            }

            CATCH {
                Write-Error -Message "Failed to Import or Convert PowerShell Data File: $($ConfigFile.FullName): $_" -ErrorId "LOAD-ERROR-01"
                EXIT
            }
        }
    }

    END {
        Write-Verbose "[+] [SETUP]: Finished Loading Configuration."
    }
}