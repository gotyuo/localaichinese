# LocalAI 国内镜像配置项目

## 项目概述

此项目包含配置LocalAI使用国内镜像的脚本和配置文件，以提高在中国大陆的访问速度和稳定性。

## 项目结构

```
LocalAI-Chinese-Setup/
├── start-localai.sh              # 启动LocalAI服务的脚本（配置为使用国内镜像）
├── download-deepseek-model.sh    # 从国内镜像下载模型的脚本
├── config/models/
│   └── deepseek-r1-8b.yaml      # 模型配置文件
├── README.md                    # 项目说明
├── localai-domestic-mirror-setup.md  # 详细的配置说明文档
└── PUSH_TO_GITHUB.md            # 推送到GitHub的说明
```

## 功能特性

- 使用 Hugging Face 国内镜像 (hf-mirror.com) 加速模型下载
- 配置了 CPU 优化的 LocalAI 镜像
- 包含预配置的 deepseek-coder-6.7b 模型配置
- 支持 OpenAI 兼容的 API 接口

## 部署说明

1. 确保已安装 Docker 和 Docker Compose
2. 运行启动脚本: `./start-localai.sh`
3. 服务将在 http://localhost:8060 上运行
4. API 端点: `/v1/chat/completions`, `/v1/models` 等

## 推送到 GitHub

要将此项目推送到 GitHub，请按照以下步骤操作：

1. 在 GitHub 上创建新仓库
2. 在终端中运行以下命令（将 `<your-username>` 和 `<your-repo-name>` 替换为您的实际用户名和仓库名）：

```bash
git remote add origin https://github.com/<your-username>/<your-repo-name>.git
git branch -M main
git push -u origin main
```

## 许可证

您可以根据需要添加适当的许可证文件。