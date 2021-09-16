#region Loading Functions/Classes

<# TRY {
    $script:SETTINGS = (Get-Content (Join-Path $PSScriptRoot 'Settings.jsonc') | ConvertFrom-Json)
}
CATCH {
    Write-Error -Message "Failed to load Settings.jsonc"
}
#>

# $CLASSES = @(Get-ChildItem -Path $PSScriptRoot\src\Classes -Recurse -Filter "*.ps1") | Sort-Object Name
$PRIVATE = @(Get-ChildItem -Path $PSScriptRoot\src\Private -Recurse -Filter "*.ps1") | Sort-Object Name
$PUBLIC = @(Get-ChildItem -Path $PSScriptRoot\src\Public -Recurse -Filter "*.ps1") | Sort-Object Name
$Script:CONFIGURATION = @(Get-ChildItem -Path $PSScriptRoot\.config -Recurse -Filter "*.ps1") | Sort-Object Name

<# ForEach ($Class in $CLASSES) {
    TRY {
        . $Class.FullName
        Write-Verbose -Message ("Successfully loaded Class File {0}" -F $Class.FullName)
    } CATCH {
        Write-Error -Message ("Failure to load Class File {0}: {1}" -F $Class.FullName, $_)
    }
} #>

ForEach ($Function in $PRIVATE) {
    TRY {
        . $Function.FullName
        Write-Verbose -Message ("Successfully loaded Internal Function/Script {0}" -F $Function.FullName)
    }
    CATCH {
        Write-Error -Message ("Failure to load Internal Function/Script {0}: {1}" -F $Function.FullName, $_)
    }
}

ForEach ($Function in $PUBLIC) {
    TRY {
        . $File.FullName
        Write-Verbose -Message ("Successfully loaded Public Function {0}" -F $Function.FullName)
    }
    CATCH {
        Write-Error -Message ("Failure to load Public Function {0}: {1}" -F $Function.FullName, $_)
    }
}

ForEach ($ConfigScript in $Script:CONFIGURATION) {
    TRY {
        . $ConfigScript.FullName
        Write-Verbose -Message ("Successfully loaded Module Configuration Script {0}" -F $ConfigScript.FullName)
    }
    CATCH {
        Write-Error -Message ("Failure to load Module Configuration Script {0}: {1}" -F $ConfigScript.FullName, $_)
    }
}

Export-ModuleMember -Function $PUBLIC.BaseName

#endregion