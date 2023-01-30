$portable_tools_path = "C:\Portable Program Files"

Write-Host "Jump starting environment..."

New-Item -Type Directory $portable_tools_path
winget install --id RubyInstallerTeam.RubyWithDevKit.3.2
winget install --id gerardog.gsudo
winget install --id Git.Git

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
[System.Environment]::GetEnvironmentVariable("Path", "User")

Set-Location $portable_tools_path
git clone "C:\Portable Program Files\RefrEnv"
[System.Environment]::SetEnvironmentVariable("Path", "$(
    [System.Environment]::GetEnvironmentVariable(
        "Path",
        [System.EnvironmentVariableTarget]::Machine)
    );$((Get-Location).Path)\RefrEnv"
    , [System.EnvironmentVariableTarget]::Machine)

Write-Host "Environment setted up!" -ForegroundColor Green
