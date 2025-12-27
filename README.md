# localaichinese
localai 国内镜像

此项目包含配置LocalAI使用国内镜像的脚本和配置文件，以提高在中国大陆的访问速度和稳定性。

## 项目特性

- 使用 Hugging Face 国内镜像 (hf-mirror.com) 加速模型下载
- 配置了 CPU 优化的 LocalAI 镜像
- 包含预配置的 deepseek-coder-6.7b 模型配置
- 支持 OpenAI 兼容的 API 接口

## 文件说明

- `start-localai.sh` - 启动LocalAI服务的脚本
- `download-deepseek-model.sh` - 从国内镜像下载模型的脚本
- `config/models/deepseek-r1-8b.yaml` - 模型配置文件
- `localai-domestic-mirror-setup.md` - 详细的配置说明文档

