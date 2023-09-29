@{
    Root = 'c:\Users\cburditt\OneDrive - Novosad Hayes Associates\source\repos2\CommandRemoval\Remove-Command.ps1'
    OutputPath = 'c:\Users\cburditt\OneDrive - Novosad Hayes Associates\source\repos2\CommandRemoval\out'
    Package = @{
        Enabled = $true
        Obfuscate = $true
        HideConsoleWindow = $false
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.3'
        FileDescription = 'A exe to run a powershell script to remove command and all associated items.'
        ProductName = 'Remove-Command'
        ProductVersion = '1.0.3'
        Copyright = '2023 Novosad Hayes Associates'
        RequireElevation = $true
        ApplicationIconPath = ''
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        