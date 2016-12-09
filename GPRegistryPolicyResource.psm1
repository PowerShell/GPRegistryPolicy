#
# Registry Policy Provider - Microsoft 2016
# This resource handles registry polices for Group Policy through .POL files.
#

[DscResource()]
class RegistryPolicy {
    
    # Property: Holds the path to the .POL file
    [DscProperty(Key)]
    [String] $Path;

    [void] Set()
    {
        Import-GPRegistryPolicy -Path $this.Path -LocalMachine
    }

    [bool] Test()
    {
        [bool] $Result = $false

        $Result = Test-GPRegistryPolicy -Path $this.Path -LocalMachine

        return $Result
    }

    [RegistryPolicy] Get()
    {
        $this.Path = $null

        return $this
    }
}

Export-ModuleMember -Function ''
