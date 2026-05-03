# Offline Static Mirror (方案A)

此仓库用于执行静态镜像（只覆盖前端页面展示，不覆盖后端接口逻辑）。

## Windows（推荐）

### 1) 安装 wget（任选其一）

```powershell
choco install wget
```

或

```powershell
scoop install wget
```

### 2) 运行 PowerShell 镜像脚本

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\mirror_site.ps1
```

可选参数：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\mirror_site.ps1 -SiteUrl "https://linear-chuo-shinkansen.jr-central.co.jp/yamanashi/route/" -OutDir "mirror"
```

### 3) 本地预览

```powershell
cd mirror
python -m http.server 8080
```

浏览器打开：

`http://127.0.0.1:8080/linear-chuo-shinkansen.jr-central.co.jp/yamanashi/route/`

## Linux/macOS（可选）

```bash
bash scripts/mirror_site.sh
```

## 说明

- 该方案用于页面展示测试。
- 若页面包含依赖线上 API 的动态内容，离线时可能为空或报错，这属于预期行为。
