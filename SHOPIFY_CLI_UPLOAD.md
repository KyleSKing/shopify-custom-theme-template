# 🚀 Shopify CLI上传Éclat Doréa主题指南

## ✅ 安装状态确认
✅ **Shopify CLI已安装**: 版本 3.92.1  
✅ **Theme功能已集成**: 所有theme命令可用  
✅ **准备上传**: Éclat Doréa主题打包完成  

## 🎯 立即上传步骤

### 步骤1: 登录到你的Shopify店铺
```bash
shopify login --store eclat-dorea.myshopify.com
```

这将会：
1. 打开Shopify登录页面
2. 输入你的店铺用户名和密码
3. 授权CLI访问你的店铺

### 步骤2: 进入主题目录
```bash
cd shopify-custom-theme-template
```

### 步骤3: 使用Shopify CLI上传主题

#### 选项A: 作为开发主题上传（实时预览）
```bash
shopify theme dev
```

**特点**:
- 上传为开发主题
- 实时同步本地更改
- 可在Shopify后台预览
- 适合开发和测试

#### 选项B: 直接推送到主题库
```bash
shopify theme push --theme eclat-dorea-gold-theme
```

**特点**:
- 创建新主题或更新现有主题
- 指定主题名称
- 上传到主题库中
- 适合正式部署

#### 选项C: 打包主题文件
```bash
shopify theme package
```

**特点**:
- 创建.zip文件供手动上传
- 不直接上传到店铺
- 生成: `.zip`文件
- 适合备份或分享

### 步骤4: 发布主题
```bash
shopify theme publish --theme THEME_ID
```

需要先获取主题ID：
```bash
shopify theme list
```

### 步骤5: 预览主题
```bash
shopify theme open
```

## 🔧 Shopify CLI详细命令

### 登录和认证
```bash
# 登录到特定店铺
shopify login --store eclat-dorea.myshopify.com

# 使用合作伙伴账户登录
shopify login --store eclat-dorea.myshopify.com --password YOUR_STAFF_TOKEN

# 查看登录状态
shopify theme info
```

### 主题管理
```bash
# 列出店铺中的所有主题
shopify theme list

# 查看主题详细信息
shopify theme info --theme THEME_ID

# 删除主题
shopify theme delete --theme THEME_ID

# 复制主题
shopify theme duplicate --theme THEME_ID --name "Éclat Doréa Copy"

# 重命名主题
shopify theme rename --theme THEME_ID --name "Éclat Doréa Gold Jewelry"
```

### 开发功能
```bash
# 启动开发服务器（实时同步）
shopify theme dev

# 打开主题预览
shopify theme open

# 拉取远程主题到本地
shopify theme pull --theme THEME_ID

# 验证主题代码
shopify theme check
```

### 部署功能
```bash
# 推送主题到店铺
shopify theme push --theme eclat-dorea-gold-theme

# 强制推送（覆盖现有）
shopify theme push --theme eclat-dorea-gold-theme --force

# 打包主题为.zip文件
shopify theme package

# 发布主题为正式主题
shopify theme publish --theme THEME_ID

# 创建可分享主题
shopify theme share --name "Éclat Doréa Shareable"
```

## 🛠️ Éclat Doréa主题上传配置

### 推荐上传命令
```bash
# 1. 登录店铺
shopify login --store eclat-dorea.myshopify.com

# 2. 进入主题目录
cd shopify-custom-theme-template

# 3. 推送主题（推荐方式）
shopify theme push --theme eclat-dorea-gold-jewelry --force

# 4. 查看主题列表确认
shopify theme list

# 5. 发布主题
shopify theme publish --theme YOUR_THEME_ID
```

### 上传参数说明
```
--theme: 指定主题名称（将出现在主题库中）
--force: 强制覆盖现有主题
--development: 上传为开发主题
--live: 直接设为正式主题
--json: 输出JSON格式结果
```

### 实时开发模式
```bash
# 启动开发模式（推荐测试使用）
shopify theme dev

# 这将：
# 1. 上传主题作为开发主题
# 2. 开启实时同步
# 3. 提供预览URL
# 4. 允许实时编辑和测试
```

## 📊 上传进度监控

### 上传过程输出
Shopify CLI会显示：
- ✅ **文件上传进度**: 每个文件的上传状态
- ✅ **验证结果**: 主题代码验证
- ✅ **主题ID**: 新主题的ID
- ✅ **预览URL**: 主题预览链接
- ✅ **编辑器URL**: Shopify主题编辑器链接

### 上传成功标志
```bash
# 检查上传结果
shopify theme list

# 预期输出应包含：
Theme name: eclat-dorea-gold-jewelry
Theme ID: 1234567890
Role: development/main/unpublished
Preview URL: https://eclat-dorea.myshopify.com/?preview_theme_id=1234567890
```

### 错误处理
```bash
# 如果上传失败，尝试：
shopify theme push --theme eclat-dorea-gold-jewelry --force

# 或分步上传：
shopify theme dev  # 先作为开发主题
shopify theme publish --theme THEME_ID  # 再发布
```

## 🧪 上传后测试命令

### 功能测试
```bash
# 打开主题预览测试
shopify theme open

# 验证主题代码
shopify theme check

# 查看主题环境信息
shopify theme info
```

### 开发测试
```bash
# 启动实时开发模式
shopify theme dev

# 修改文件后会自动同步
# 实时查看更改效果
```

### 性能测试
```bash
# 打包主题检查文件
shopify theme package

# 检查生成的.zip文件大小
# 确保文件优化良好
```

## 🔍 常见问题解决

### CLI登录问题
```bash
# 如果登录失败：
shopify logout  # 清除登录状态
shopify login --store eclat-dorea.myshopify.com  # 重新登录

# 或使用浏览器手动登录
```

### 上传权限问题
```bash
# 确认你有店铺管理权限
shopify theme info  # 查看当前店铺信息

# 如果需要合作伙伴权限：
shopify login --store eclat-dorea.myshopify.com --password YOUR_STAFF_TOKEN
```

### 网络连接问题
```bash
# 检查网络连接
curl -I https://eclat-dorea.myshopify.com

# 使用详细模式查看错误
shopify theme push --theme eclat-dorea-gold-jewelry --verbose
```

### 文件格式问题
```bash
# 验证主题文件格式
shopify theme check

# 修复Liquid语法错误
# 然后重新上传
```

## 🎨 Éclat Doréa主题上传注意事项

### 主题文件要求
- ✅ **所有文件UTF-8编码**
- ✅ **Liquid语法正确**
- ✅ **JSON格式正确**
- ✅ **文件结构符合Shopify标准**
- ✅ **logo文件为SVG格式**

### 上传最佳实践
1. **先测试**: 使用 `shopify theme dev` 测试
2. **再部署**: 使用 `shopify theme push` 部署
3. **验证**: 使用 `shopify theme check` 验证
4. **发布**: 使用 `shopify theme publish` 发布

### 品牌Logo上传
主题上传后，还需要：
1. **上传Logo文件**: 在Shopify后台上传logo_header.svg
2. **配置Logo设置**: 设置尺寸200×60px
3. **测试Logo显示**: 在所有页面测试显示效果

## 📱 移动端支持

### CLI移动端适配
Shopify CLI支持：
- ✅ **实时移动端预览**
- ✅ **移动端开发测试**
- ✅ **移动端性能优化**
- ✅ **移动端响应式验证**

### 移动端测试命令
```bash
# 打开移动端预览
shopify theme open --mobile

# 验证移动端响应式
shopify theme check --mobile
```

## 🚀 快速上传脚本

### 一键上传脚本
```bash
#!/bin/bash
echo "🚀 Éclat Doréa主题一键上传脚本"
echo "=================================="

# 1. 登录店铺
shopify login --store eclat-dorea.myshopify.com

# 2. 推送主题
shopify theme push --theme eclat-dorea-gold-jewelry --force

# 3. 获取主题ID
THEME_ID=$(shopify theme list --json | jq -r '.themes[] | select(.name=="eclat-dorea-gold-jewelry") | .id')

# 4. 发布主题
shopify theme publish --theme $THEME_ID

echo "✅ 主题上传完成!"
echo "主题ID: $THEME_ID"
echo "预览URL: https://eclat-dorea.myshopify.com/?preview_theme_id=$THEME_ID"
```

### 简化上传命令
```bash
# 最简上传（适合有权限的用户）
shopify login --store eclat-dorea.myshopify.com && \
shopify theme push --theme eclat-dorea-gold-jewelry --force && \
shopify theme publish --theme $(shopify theme list --json | jq -r '.themes[] | select(.name=="eclat-dorea-gold-jewelry") | .id')
```

## 📞 CLI技术支持

### 获取帮助
```bash
# 查看所有命令
shopify help

# 查看theme命令帮助
shopify theme --help

# 查看具体命令帮助
shopify theme push --help
```

### 调试模式
```bash
# 开启详细输出
shopify theme push --theme eclat-dorea-gold-jewelry --verbose

# 输出JSON格式结果
shopify theme list --json

# 记录日志
shopify theme push --theme eclat-dorea-gold-jewelry --log-level debug
```

### 错误报告
如果遇到问题：
1. **运行命令**: `shopify theme push --verbose`
2. **提供输出**: 完整的CLI输出
3. **描述问题**: 详细问题描述
4. **环境信息**: 操作系统和Node版本

## 🎉 上传成功确认

### CLI成功标志
- ✅ `shopify theme list` 显示新主题
- ✅ `shopify theme open` 可打开预览
- ✅ `shopify theme info` 显示正确信息
- ✅ 店铺前台显示新主题

### 店铺成功标志
- ✅ Shopify后台Themes列表有新主题
- ✅ 可以Customize新主题
- ✅ 前台店铺显示新设计
- ✅ 品牌Logo正确显示

### 品牌成功标志
- ✅ Éclat Doréa品牌logo显示
- ✅ 奢侈品配色生效
- ✅ 法式优雅字体应用
- ✅ 完整品牌一致性达成

---

**立即开始上传**: 
```bash
shopify login --store eclat-dorea.myshopify.com
cd shopify-custom-theme-template
shopify theme push --theme eclat-dorea-gold-jewelry --force
```

**预计时间**: 2-3分钟  
**主题版本**: Luxury Gold Jewelry Theme v2.0  
**CLI版本**: Shopify CLI 3.92.1  
**店铺**: eclat-dorea.myshopify.com  

**成功提示**: Shopify CLI提供最专业、最快速的主题上传方案，立即开始享受流畅的开发体验！