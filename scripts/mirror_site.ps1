param(
  [string]$SiteUrl = "https://linear-chuo-shinkansen.jr-central.co.jp/yamanashi/route/",
  [string]$OutDir = "mirror",
  [string]$Domain = "linear-chuo-shinkansen.jr-central.co.jp"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command wget.exe -ErrorAction SilentlyContinue)) {
  Write-Error "未找到 wget.exe。请先安装：choco install wget 或 scoop install wget"
}

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
Push-Location $OutDir
try {
  & wget.exe `
    --mirror `
    --convert-links `
    --adjust-extension `
    --page-requisites `
    --no-parent `
    --domains $Domain `
    --execute robots=off `
    $SiteUrl

  Write-Host "[OK] Mirror completed under: $((Get-Location).Path)\$Domain"
  Write-Host "Run local preview:"
  Write-Host "  cd $OutDir"
  Write-Host "  python -m http.server 8080"
  Write-Host "Then open: http://127.0.0.1:8080/$Domain/yamanashi/route/"
}
finally {
  Pop-Location
}
