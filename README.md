# ssfkyx 的个人网站

这个仓库既是**网站源码**，也是你的 **Obsidian 笔记库**。写笔记和发布网站是两件事，但不需要你分别操作。

- 网站地址：<https://ssfkyx.github.io>
- 写作工具：Obsidian（本地 App，免费）
- 网站生成器：Quartz 5
- 托管：GitHub Pages（免费）

---

## 它是怎么工作的

```text
Obsidian 里写笔记
      │  保存（Markdown 文件）
      ▼
Obsidian Git 插件每 5 分钟自动 commit + push
      │
      ▼
GitHub Actions 自动构建（npm ci + npx quartz build）
      │
      ▼
GitHub Pages 发布，1~2 分钟后网站更新
```

所以日常只需要：**打开 Obsidian → 写 → 等一两分钟自动上线**。不用碰命令行，也不用管 Markdown 语法。

---

## 第一次发布（只做一次）

前提：GitHub 账号 `ssfkyx`。

### 1. 新建仓库

1. 打开 <https://github.com/new>
2. **Repository name** 填：`ssfkyx.github.io`
   - 必须完全一致，这是 GitHub Pages「用户站」的规则，网址才是 `https://ssfkyx.github.io`
3. 选择 **Public**（免费账号的 Pages 只能从公开仓库发布）
4. **不要**勾选 README、.gitignore、license，保持空仓库
5. 点 **Create repository**

### 2. 把本地仓库推上去

在 `个人网页` 文件夹里执行（或者直接叫 DSH 帮你推）：

```bash
git push -u origin main
```

首次会弹出 GitHub 登录窗口（Git Credential Manager），登录 `ssfkyx` 账号即可。

### 3. 打开 GitHub Pages

1. 进入仓库的 **Settings** → **Pages**
2. **Build and deployment** → **Source** 选择 **GitHub Actions**
   - 不需要选分支；部署由 `.github/workflows/deploy.yml` 完成

### 4. 等网站上线

第一次构建大约 1~3 分钟，完成后访问：<https://ssfkyx.github.io>

---

## 平时怎么写

### 安装 Obsidian

官网下载：<https://obsidian.md>（个人使用免费）。

### 打开这个文件夹

Obsidian 启动页 → **打开本地仓库 / Open folder as vault** → 选择：

```text
C:\Users\skyai\Desktop\dsh\个人网页
```

第一次打开时：

1. 如果询问是否信任并启用插件，选择**启用**（否则 Obsidian Git 不工作）
2. 打开 **设置 → 第三方插件**，确认 **Git** 插件已启用
3. 打开 **设置 → Git**，确认 **Auto commit-and-sync interval**（自动提交并同步间隔）是 **5 分钟**（已经预配置好）
4. 首次同步时如果要求登录 GitHub，按提示登录 `ssfkyx`

### 新建与编辑笔记

- **新建笔记**：`Ctrl+N`，会自动建在 `content/` 文件夹里（否则网站不会发布它）
- **写标题**：默认用**文件名**作为标题；也可以在笔记最上面写 frontmatter 覆盖：

  ```yaml
  ---
  title: 我的标题
  date: 2026-10-26
  tags:
    - 读书
  ---
  ```

- **粘贴图片**：直接 `Ctrl+V`。图片会自动存进 `content/attachments/`，并显示在笔记里
- **链接其他笔记**：输入 `[[`，从列表里选
- **不想发布**：在 frontmatter 里加 `draft: true`
- **文件夹**：在 `content/` 里新建文件夹整理笔记，网站侧边栏会自动同步成目录

### 发布

- **自动**：Obsidian Git 每 5 分钟 commit + push 一次，之后网站自动更新
- **想立刻发布**：`Ctrl+P` 打开命令面板 → 执行 **Git: Commit-and-sync**
- 发布是否成功，可以在仓库的 **Actions** 页面看到（绿色 = 成功）

---

## 常用修改

| 想改什么 | 改哪里 |
| --- | --- |
| 站点标题 | `quartz.config.yaml` → `pageTitle` |
| 主题颜色、字体 | `quartz.config.yaml` → `theme` |
| 首页 | `content/index.md` |
| 关于页 | `content/关于我.md` |
| 删掉示例笔记 | 删除 `content/写作示例.md` 和 `content/attachments/example-image.png` |
| 浏览器标签图标（favicon） | 替换 `quartz/static/icon.png`（正方形 PNG） |
| 分享卡片图 | 替换 `quartz/static/og-image.png`（1200×630） |
| 细节样式 | `quartz/styles/custom.scss` |

改完保存 → 等自动同步 → 网站在 1~2 分钟后更新。

---

## 公式和表格（留的后门）

默认界面里不显示公式和表格按钮，但完全支持，需要时直接在 Obsidian 里写：

- 行内公式：`$e^{i\pi} + 1 = 0$`
- 块公式（`$$` 各占一行）：

  ```markdown
  $$
  \int_{-\infty}^{\infty} e^{-x^2}\,dx = \sqrt{\pi}
  $$
  ```

- 表格：用 `|` 分隔，Obsidian 里也可以直接粘贴表格

写错了也不影响网站，只有正确的语法才会被渲染。

---

## 本地预览（可选）

需要安装 [Node.js](https://nodejs.org/) 22 或更高版本。在 `个人网页` 文件夹里执行：

```bash
npm ci
npx quartz build --serve
```

然后浏览器打开 <http://localhost:8080>。改笔记时页面会自动刷新（预览只在本机，不改变线上网站）。

---

## 以后想换自己的域名

1. 买域名（约 ¥70–100/年）
2. DNS 里加一条 `CNAME` 记录，指向 `ssfkyx.github.io`
3. 仓库 **Settings → Pages → Custom domain** 填域名，勾选 **Enforce HTTPS**
4. 把 `quartz.config.yaml` 里的 `baseUrl` 改成新域名（不带 `https://`）

GitHub 会自动把旧链接重定向到新域名，外链一般不会失效。

---

## 目录结构

```text
个人网页/
├─ content/                    ← 你的笔记都在这里（Obsidian 里看到的就是它）
│  ├─ index.md                ← 首页
│  ├─ 关于我.md                ← 关于页
│  ├─ 写作示例.md              ← 示例，可以删
│  └─ attachments/            ← 粘贴的图片自动存到这里
├─ quartz.config.yaml          ← 站点配置（标题、域名、颜色、插件）
├─ quartz/                     ← 网站生成器源码（不用改）
├─ .obsidian/                  ← Obsidian 设置、主题、Git 插件（已配好）
├─ .github/workflows/deploy.yml ← 自动部署配置
└─ package.json                ← 依赖清单
```

---

## 常见问题

**网站打不开 / 404**

1. 仓库 **Settings → Pages → Source** 是否选了 **GitHub Actions**
2. 仓库 **Actions** 里最新一次 deploy 是否成功（红色 = 失败，点进去看报错）
3. 仓库名是否严格是 `ssfkyx.github.io`

**Obsidian Git 提示登录或推送失败**

- 按提示登录 GitHub 即可；也可以在终端里 `git push` 一次，让系统记住凭据
- 网络不稳定时会失败，下次自动同步会重试

**图片不显示**

- 确认图片在 `content/attachments/` 里
- 笔记里的链接应是 `![[文件名.png]]` 这种形式
- 不要在 Obsidian 里手动把图片移到仓库外

**换了电脑 / 想备份**

仓库本身就是完整备份。新电脑上 `git clone` 后，用 Obsidian 打开文件夹即可继续写。

**手机上写**

Obsidian 有手机 App，但 Obsidian Git 的手机端不稳定。建议手机端用 Obsidian 官方同步（付费）或用其他同步工具，电脑端负责发布。

**重新安装依赖 / 卡住**

删除 `node_modules` 后重新 `npm ci` 即可。网站内容与依赖无关，不会丢。
