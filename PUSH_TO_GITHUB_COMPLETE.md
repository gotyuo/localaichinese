# 推送代码到GitHub仓库

您需要先在GitHub上创建仓库，然后才能推送代码。

## 步骤1：在GitHub上创建仓库

1. 访问 https://github.com 并登录您的账户
2. 点击右上角的 "+" 号，选择 "New repository"
3. 在仓库名称字段输入: `localaichinese`
4. 选择 "Public" 或 "Private"（建议Public）
5. **不要** 勾选 "Initialize this repository with a README"
6. **不要** 添加 .gitignore 或 license
7. 点击 "Create repository" 按钮

## 步骤2：将本地代码推送到新创建的仓库

仓库创建完成后，运行以下命令：

```bash
cd /home/hotyuo/LocalAI-Chinese-Setup
git remote add origin https://github.com/gotyuo/localaichinese.git
git branch -M main
git push -u origin main
```

## 可能遇到的问题和解决方案

### 1. 如果遇到权限错误
您可能需要配置GitHub访问令牌：
- 访问 https://github.com/settings/tokens
- 点击 "Generate new token" -> "Generate new token (classic)"
- 选择适当的权限（至少需要 repo 权限）
- 复制生成的令牌
- 在推送时使用令牌作为密码，或配置git凭证存储

### 2. 如果遇到网络连接问题
尝试使用SSH方式（需要先配置SSH密钥）：
```bash
git remote set-url origin git@github.com:gotyuo/localaichinese.git
git push -u origin main
```

### 3. 验证推送成功
推送完成后，访问 https://github.com/gotyuo/localaichinese 应该能看到您的代码

## 仓库内容

推送成功后，您的GitHub仓库将包含：
- LocalAI配置文件
- 国内镜像下载脚本
- 启动脚本
- 配置文档