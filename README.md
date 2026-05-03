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

### 3) 启动本地预览（关键：从域名目录作为站点根目录）

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\serve_mirror.ps1 -Port 8080
```

浏览器打开：

`http://127.0.0.1:8080/yamanashi/route/`

> 不要打开 `http://127.0.0.1:8080/mirror/...` 这种路径；
> 该站点有大量以 `/yamanashi/...` 开头的绝对路径资源，请把 `mirror/linear-chuo-shinkansen.jr-central.co.jp` 作为 HTTP 根目录。

## Linux/macOS（可选）

```bash
bash scripts/mirror_site.sh
bash scripts/serve_mirror.sh mirror linear-chuo-shinkansen.jr-central.co.jp 8080
```

## 常见问题（你截图里的 404）

如果 Console 出现大量 `404 /yamanashi/...`：
- 原因：启动 `http.server` 的目录不对，导致资源去根路径找不到。
- 解决：使用本仓库新增的 `serve_mirror.ps1`（或 `serve_mirror.sh`）启动，它会自动切到正确根目录。

## 说明

- 该方案用于页面展示测试。
- 若页面包含依赖线上 API 的动态内容，离线时可能为空或报错，这属于预期行为。
