# 🔐 GitHub Secrets配置指南 - Éclat Doréa主题自动部署

## 🎯 配置目标
配置GitHub Secrets以启用Éclat Doréa主题的**完全自动化部署**到Shopify店铺。

## 📍 配置地址
**立即访问**: https://github.com/KyleSKing/shopify-custom-theme-template/settings/secrets/actions

## 🔑 必需Secrets配置

### Secret 1: SHOPIFY_STORE_URL
```
🔸 名称: SHOPIFY_STORE_URL
🔸 值: eclat-dorea.myshopify.com
🔸 用途: 指定部署的目标Shopify店铺
🔸 说明: 必须是完整的店铺URL
```

### Secret 2: SHOPIFY_PASSWORD
```
🔸 名称: SHOPIFY_PASSWORD  
🔸 值: [你的Shopify访问密码]
🔸 用途: 授权GitHub Actions访问你的Shopify店铺
🔸 说明: 这是Shopify API的访问密码
```

## 🛠️ 配置步骤

### 步骤1: 访问Secrets配置页面
1. 打开: https://github.com/KyleSKing/shopify-custom-theme-template/settings/secrets/actions
2. 点击 **Repository secrets** 部分
3. 点击 **New repository secret** 按钮

### 步骤2: 添加 SHOPIFY_STORE_URL
```
Name: SHOPIFY_STORE_URL
Secret: eclat-dorea.myshopify.com
```
点击 **Add secret**

### 步骤3: 添加 SHOPIFY_PASSWORD
```
Name: SHOPIFY_PASSWORD  
Secret: [获取你的Shopify密码]
```
点击 **Add secret**

## 🔍 如何获取Shopify密码

### 方法1: 从现有应用获取
如果你已经有Shopify应用:
1. 访问: https://eclat-dorea.myshopify.com/admin/apps
2. 找到现有应用
3. 查看API凭证

### 方法2: 创建私有应用
1. 访问: https://eclat-dorea.myshopify.com/admin/apps
2. 点击 **Manage private apps**
3. 点击 **Create new private app**
4. 设置:
   - **App name**: GitHub Actions Deploy
   - **Admin API**: ✓ Theme templates and theme assets (Read and write)
5. 保存后获取密码

### 方法3: 使用现有API密码
如果你之前配置过Shopify CLI或其他工具，使用相同的密码。

## 🧪 验证配置

### 配置完成后检查:
1. ✅ 两个Secrets显示在列表中
2. ✅ 名称完全匹配（大小写敏感）
3. ✅ 值正确无空格

### 触发自动部署:
配置Secrets后，可以:
1. **重新运行最新工作流** - 点击Re-run jobs
2. **推送新提交** - 我会帮你创建
3. **手动触发工作流** - 使用workflow_dispatch

## 🚀 自动部署流程

### 配置Secrets后的工作流:
```
1. ✅ 验证主题结构
2. ✅ 检查设计系统
3. 🚀 部署到Shopify (自动执行!)
4. ✅ 生成部署报告
5. 📦 主题包Artifacts
6. ✅ 部署完成摘要
```

### 预期输出:
```
🚀 开始部署Éclat Doréa主题到Shopify...
店铺: eclat-dorea.myshopify.com
开始部署...
使用Shopify CLI部署...
✅ 主题部署成功
```

## 🔒 安全注意事项

### Secrets安全性:
- ✅ GitHub加密存储Secrets
- ✅ 仅在GitHub Actions运行时解密
- ✅ 日志中自动隐藏Secret值
- ✅ 仅仓库管理员可管理

### 访问权限:
- 🔸 SHOPIFY_PASSWORD应有最小必要权限
- 🔸 仅限主题读写权限
- 🔸 定期更新密码增加安全性

## 📊 配置状态检查清单

### 配置前状态:
- [ ] GitHub仓库无Secrets配置
- [ ] 自动化工作流跳过部署步骤
- [ ] 需要手动上传主题

### 配置后状态:
- [ ] SHOPIFY_STORE_URL 已配置
- [ ] SHOPIFY_PASSWORD 已配置  
- [ ] 自动化工作流启用部署
- [ ] 主题自动推送到Shopify
- [ ] 店铺自动更新主题

## 🆘 常见问题解决

### 问题1: Secret无效
**症状**: 部署失败，认证错误
**解决**: 
1. 验证Shopify密码是否正确
2. 检查店铺URL格式
3. 确认API权限足够

### 问题2: 部署权限不足
**症状**: 部署成功但主题未生效
**解决**:
1. 确保API有主题读写权限
2. 检查Shopify用户权限
3. 验证店铺管理员权限

### 问题3: Secrets未生效
**症状**: 工作流仍然跳过部署
**解决**:
1. 确认Secret名称完全匹配
2. 检查大小写（SHOPIFY_PASSWORD）
3. 重新运行工作流测试

## 🔗 相关链接

### GitHub相关:
- **Secrets配置**: https://github.com/KyleSKing/shopify-custom-theme-template/settings/secrets/actions
- **Actions运行**: https://github.com/KyleSKing/shopify-custom-theme-template/actions
- **工作流文件**: .github/workflows/auto-deploy.yml

### Shopify相关:
- **店铺后台**: https://eclat-dorea.myshopify.com/admin
- **API管理**: https://eclat-dorea.myshopify.com/admin/apps
- **店铺前台**: https://eclat-dorea.myshopify.com

## ⏱️ 配置时间预估

### 快速配置 (3-5分钟):
```
00:00 - 访问GitHub Secrets页面
00:01 - 添加SHOPIFY_STORE_URL
00:02 - 添加SHOPIFY_PASSWORD
00:03 - 重新运行工作流
00:04 - 监控自动部署
00:05 - 验证店铺效果
```

### 完整配置 (8-10分钟):
```
00:00 - 获取Shopify API密码
00:02 - 配置GitHub Secrets
00:04 - 验证配置正确性
00:05 - 触发自动部署
00:07 - 监控部署过程
00:09 - 全面测试店铺
00:10 - 部署完成确认
```

## 🎉 配置成功标志

### 技术成功:
- ✅ GitHub Secrets列表显示两个Secret
- ✅ 工作流自动执行部署步骤
- ✅ Shopify CLI成功连接店铺
- ✅ 主题自动上传并发布

### 商业成功:
- ✅ Éclat Doréa主题自动部署到店铺
- ✅ 奢侈品设计系统立即生效
- ✅ 品牌形象自动提升
- ✅ 无需手动操作，完全自动化

## 🚀 立即开始配置!

**访问**: https://github.com/KyleSKing/shopify-custom-theme-template/settings/secrets/actions

**配置两个Secrets后，Éclat Doréa主题将实现完全自动化部署！**