@{
    Root = 'c:\Users\cburditt\OneDrive - Novosad Hayes Associates\source\repos2\CommandRemoval\Remove-Command.ps1'
    OutputPath = 'c:\Users\cburditt\OneDrive - Novosad Hayes Associates\source\repos2\CommandRemoval\out'
    Package = @{
        Enabled = $true
        Obfuscate = $true
        HideConsoleWindow = $false
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.1'
        FileDescription = ''
        ProductName = ''
        ProductVersion = ''
        Copyright = ''
        RequireElevation = $false
        ApplicationIconPath = ''
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        