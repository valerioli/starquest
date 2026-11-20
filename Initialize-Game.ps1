$ErrorActionPreference = 'Stop'

$project = Join-Path $PSScriptRoot 'Game'
$projectVersion = Join-Path $project 'ProjectSettings\ProjectVersion.txt'
$manifest = Join-Path $project 'Packages\manifest.json'

if (Test-Path -LiteralPath $project) {
    if ((Test-Path -LiteralPath $projectVersion -PathType Leaf) -and
        (Test-Path -LiteralPath $manifest -PathType Leaf)) {
        $packages = (Get-Content -LiteralPath $manifest -Raw | ConvertFrom-Json).dependencies
        if ($packages.'com.bytedance.pico.spatialadapter') {
            Write-Output "Unity Spatial project already exists at $project."
            return
        }
    }

    throw "The existing path is not a recognized Unity Spatial project: $project"
}

$toolchain = Join-Path $PSScriptRoot '.toolchain'
$cli = Join-Path $toolchain 'node_modules\.bin\pico-cli.cmd'

& npm.cmd install --prefix $toolchain --save-exact --no-audit --no-fund '@picoxr/pico-cli@0.7.0'
if ($LASTEXITCODE -ne 0) { throw 'PICO CLI installation failed.' }

& $cli project create --sdk-type unity --mode picospatial --dir $project
if ($LASTEXITCODE -ne 0) { throw 'PICO Unity Spatial project creation failed.' }

$settingsPath = Join-Path $project 'ProjectSettings\ProjectSettings.asset'
$settings = [IO.File]::ReadAllText($settingsPath)
$settings = $settings -replace '(?m)^  productName: [^\r\n]+', '  productName: StarQuest'
$settings = $settings -replace '(?m)^    Android: com\.pico\.spatial\.template(?=\r?$)', '    Android: com.starquest.prototype'
[IO.File]::WriteAllText($settingsPath, $settings, [Text.UTF8Encoding]::new($false))
