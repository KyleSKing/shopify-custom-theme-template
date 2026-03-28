# 🚀 GitHub Actions Shopify同步配置指南

## 📋 GitHub Actions工作流已创建

### ✅ 已创建的文件
```
.github/workflows/shopify-sync.yml  # Shopify主题同步工作流
```

### 🎯 工作流功能
这个GitHub Actions工作流提供以下功能：

1. **自动同步**: 当代码推送到main/master分支时，自动同步到Shopify
2. **语法检查**: 验证Liquid、JSON、CSS和JavaScript语法
3. **结构验证**: 确保主题结构完整
4. **部署报告**: 生成详细的部署统计报告
5. **安全认证**: 使用GitHub Secrets存储Shopify认证信息

## 🔧 GitHub Secrets配置

### 步骤1：获取Shopify认证信息
1. **Shopify Store URL**: 你的商店URL（例如：your-store.myshopify.com）
2. **Shopify Password**: 商店管理员密码或API密钥密码
3. **Shopify Theme ID**: 目标主题的ID（可选）

### 步骤2：设置GitHub Secrets
在GitHub仓库中：
1. 访问 `Settings` → `Secrets and variables` → `Actions`
2. 点击 `New repository secret`
3. 添加以下secret：

| Secret名称 | 值 | 备注 |
|------------|----|------|
| `SHOPIFY_STORE_URL` | your-store.myshopify.com | 商店URL |
| `SHOPIFY_PASSWORD` | 你的管理员密码 | API密钥密码 |
| `SHOPIFY_THEME_ID` | 主题ID | 可选，如：123456789 |

## 🛠️ 工作流触发条件

### 自动触发
```yaml
on:
  push:
    branches:
      - main
      - master
  pull_request:
    branches:
      - main
      - master
```

### 工作流步骤
1. **代码检出**: 从GitHub获取最新代码
2. **环境设置**: 安装Node.js和Shopify CLI
3. **依赖安装**: 安装项目依赖（如果有）
4. **结构验证**: 验证Shopify主题结构完整性
5. **语法检查**: 检查Liquid、JSON等语法
6. **主题推送**: 自动推送到Shopify商店
7. **报告生成**: 生成部署统计报告

## 🔍 工作流详细信息

### 主要验证检查
- ✅ `layout/theme.liquid` 存在
- ✅ `config/settings_schema.json` 存在
- ✅ JSON语法正确
- ✅ Liquid语法基本检查
- ✅ CSS和JavaScript文件存在

### 推送策略
```yaml
# 如果有主题ID，推送到指定主题
shopify theme push --theme $SHOPIFY_THEME_ID

# 如果没有主题ID，推送到开发主题
shopify theme push --development
```

## 📊 部署报告示例
```
📊 Deployment Report
====================
Repository: yourusername/shopify-custom-theme-template
Branch: main
Commit: abc123def456
Author: Your Name
Timestamp: 2024-03-28 13:30:00

📁 File Statistics:
11

🏗️ Main Theme Files:
layout/theme.liquid
config/settings_schema.json
```

## ⚠️ 注意事项

### 安全警告
1. **不要暴露密码**: GitHub Secrets确保密码安全
2. **不要提交敏感信息**: `config/settings_data.json`应在.gitignore中
3. **使用环境变量**: 所有敏感信息使用环境变量

### 权限要求
1. **Shopify API权限**: 需要商店管理员权限或API密钥
2. **GitHub Actions权限**: 需要访问仓库的权限
3. **网络访问**: 需要访问Shopify API的网络权限

## 🔧 自定义配置

### 修改工作流触发条件
```yaml
# 只在特定分支触发
on:
  push:
    branches:
      - production
      - staging

# 手动触发
on:
  workflow_dispatch:
```

### 添加额外检查
```yaml
# 添加性能检查
- name: Performance check
  run: |
    echo "Checking file sizes..."
    find . -type f -name "*.css" -o -name "*.js" | xargs du -h
```

### 添加通知功能
```yaml
# Slack通知
- name: Slack notification
  uses: slackapi/slack-github-action@v1
  with:
    channel-id: 'your-channel'
    slack-message: 'Shopify主题已更新'
```

## 📈 监控和调试

### 查看工作流运行
1. 访问GitHub仓库的 `Actions` 页面
2. 查看 `Shopify Theme Sync` 工作流
3. 检查每一步的执行状态

### 调试常见问题
1. **认证失败**: 检查GitHub Secrets是否正确
2. **网络错误**: 检查Shopify API访问权限
3. **语法错误**: 检查代码语法是否正确

### 日志分析
```bash
# 查看工作流日志
- 在GitHub Actions页面查看详细日志
- 检查每个步骤的输出
- 查看错误信息和警告
```

## 🚀 立即启用

### 启用步骤
1. **推送代码**: 将包含工作流的代码推送到GitHub
2. **设置Secrets**: 在GitHub仓库设置中配置Shopify认证
3. **触发工作流**: 推送代码到main分支触发工作流
4. **验证结果**: 检查Shopify商店是否更新

### 验证命令
```bash
# 本地验证工作流
cd .github/workflows
cat shopify-sync.yml

# 检查GitHub Secrets
echo "检查GitHub Secrets是否设置"
```

## 💡 扩展功能建议

### 多环境部署
```yaml
# 支持多个Shopify环境
- staging环境: shopify-staging.myshopify.com
- production环境: shopify-production.myshopify.com
```

### 预览部署
```yaml
# 创建预览主题
shopify theme push --theme=preview --store=$SHOPIFY_STORE_URL
```

### 版本标记
```yaml
# 添加版本标签
git tag v1.0.0
git push origin v1.0.0
```

## ✅ 成功标志

**工作流成功运行后应显示：**
- ✅ 所有步骤通过
- ✅ Shopify主题更新成功
- ✅ 部署报告生成
- ✅ 没有语法错误
- ✅ 商店访问正常

## 📞 技术支持

### 常见问题解答
1. **Q: Shopify CLI安装失败**
   **A**: 检查Node.js版本和网络连接

2. **Q: 认证错误**
   **A**: 验证GitHub Secrets中的Shopify密码

3. **Q: 主题推送失败**
   **A**: 检查主题ID和商店URL

### 参考文档
- GitHub Actions官方文档
- Shopify CLI文档
- Liquid模板语言文档

---

## 🎉 GitHub Actions配置完成！

**现在你的Shopify主题仓库具备：**
- ✅ 自动同步到Shopify的功能
- ✅ 语法验证和质量检查
- ✅ 安全的认证管理
- ✅ 详细的部署报告
- ✅ 可扩展的工作流架构

**只需配置GitHub Secrets即可启用自动同步！**