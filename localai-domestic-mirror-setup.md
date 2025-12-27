# LocalAI 国内镜像配置总结

## 配置变更

### 1. 模型下载脚本更新
- 文件: `/home/hotyuo/download-deepseek-model.sh`
- 变更: 添加了 Hugging Face 国内镜像支持 (`HF_ENDPOINT=https://hf-mirror.com`)
- 变更: 添加了 `--break-system-packages` 参数以处理系统包管理限制
- 变更: 添加了 Python 模块回退机制

### 2. LocalAI 启动脚本更新
- 文件: `/home/hotyuo/start-localai.sh`
- 变更: 使用 CPU 优化镜像 (`localai:latest-cpu`)
- 变更: 配置了 llama-cpp 后端

### 3. 模型配置
- 文件: `/home/hotyuo/localai-config/models/deepseek-r1-8b.yaml`
- 模型: `deepseek-coder-6.7b-instruct.Q5_K_M.gguf` (与下载脚本匹配)

## 当前状态

- 模型文件已成功下载: 4.7GB (`deepseek-coder-6.7b-instruct.Q5_K_M.gguf`)
- LocalAI 服务正在运行: http://localhost:8060
- API 端点正常: 
  - `/v1/models` - 返回模型列表
  - `/readyz` - 返回健康状态
- 模型已加载到内存中

## 使用说明

### 启动服务
```bash
/home/hotyuo/start-localai.sh
```

### 测试 API
```bash
curl http://localhost:8060/v1/models
```

### API 调用示例
```bash
curl -X POST http://localhost:8060/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "deepseek-r1-8b",
    "messages": [
      {
        "role": "user",
        "content": "你好"
      }
    ],
    "temperature": 0.7
  }'
```

## 注意事项

- 由于模型较大（4.7GB），首次加载可能需要几分钟
- 生成响应可能需要一些时间，根据问题复杂度而定
- 使用的是 deepseek-coder-6.7b 模型，作为 deepseek-r1-8b 的替代方案