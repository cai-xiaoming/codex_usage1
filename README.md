# Offline Static Mirror (方案A)

此仓库用于执行静态镜像（只覆盖前端页面展示，不覆盖后端接口逻辑）。

## 1) 运行镜像脚本

```bash
bash scripts/mirror_site.sh
```

可选参数：

```bash
bash scripts/mirror_site.sh <站点URL> <输出目录>
```

默认值：
- URL: `https://linear-chuo-shinkansen.jr-central.co.jp/yamanashi/route/`
- 输出目录: `mirror`

## 2) 本地预览

```bash
cd mirror
python3 -m http.server 8080
```

浏览器打开：

`http://127.0.0.1:8080/linear-chuo-shinkansen.jr-central.co.jp/yamanashi/route/`

## 3) 说明

- 该方案用于页面展示测试。
- 若页面包含依赖线上 API 的动态内容，离线时可能为空或报错，这属于预期行为。
