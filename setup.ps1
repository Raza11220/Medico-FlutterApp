$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw 'Flutter is not on PATH. Open a VS Code terminal where flutter --version works.'
}
# Generate native platform files using the Flutter version installed on THIS PC.
# Existing Dart code and assets are never overwritten.
$tempProject = Join-Path ([System.IO.Path]::GetTempPath()) ('medico-ui-' + [Guid]::NewGuid().ToString('N'))
try {
  flutter create --project-name medico --org com.medico.uidemo --platforms=android,web --no-pub $tempProject
  if ($LASTEXITCODE -ne 0) { throw 'Platform generation failed.' }
  foreach ($platform in @('android', 'web')) {
    $target = Join-Path $PSScriptRoot $platform
    if (Test-Path $target) { Remove-Item $target -Recurse -Force }
    Copy-Item (Join-Path $tempProject $platform) $target -Recurse
  }
  flutter pub get
  if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' }
  Write-Host 'Medico is ready. Start your emulator, then run: flutter run' -ForegroundColor Green
} finally {
  if (Test-Path $tempProject) { Remove-Item $tempProject -Recurse -Force }
}
