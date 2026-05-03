param(
  [string]$OutDir = "mirror",
  [string]$Domain = "linear-chuo-shinkansen.jr-central.co.jp",
  [int]$Port = 8080
)

$ErrorActionPreference = "Stop"
$DocRoot = Join-Path (Resolve-Path $OutDir) $Domain

if (-not (Test-Path $DocRoot)) {
  Write-Error "未找到目录: $DocRoot。请先执行 mirror_site.ps1 抓取站点。"
}

Write-Host "Serving docroot: $DocRoot"
Write-Host "Open: http://127.0.0.1:$Port/yamanashi/route/"
Set-Location $DocRoot
python -m http.server $Port
