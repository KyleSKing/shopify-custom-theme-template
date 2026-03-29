# 🚀 Shopify主题整体上传指南

## 🎯 上传目标
**店铺**: eclat-dorea.myshopify.com  
**主题**: Luxury Gold Jewelry Theme v2.0  
**包含**: 完整主题文件 + 品牌logo系统

## 📋 上传前准备

### 需要的文件
主题包含以下核心文件：
```
📁 assets/           # 样式和脚本文件
  ├── css/global.css
  └── js/global.js

📁 config/           # 主题配置
  ├── settings_schema.json
  └── settings_data.json

📁 layout/           # 布局文件
  └── theme.liquid

📁 sections/         # 可编辑区块
  └── announcement-bar.liquid

📁 snippets/         # 可重用代码片段
  ├── logo.liquid
  └── brand-logo.liquid

📁 templates/        # 页面模板
  └── index.json

📁 locales/          # 多语言文件
  └── en.default.json
```

### 需要上传的Logo文件
```
logo_header.svg     # 主logo (200×60px)
logo_footer.svg     # 页脚logo (120×40px) 
logo_favicon.svg    # 浏览器图标 (32×32px)
```

## 🚀 上传方法选择

### 方法1: Shopify CLI (推荐)
```bash
# 安装Shopify CLI
npm install -g @shopify/cli

# 登录到你的店铺
shopify login --store eclat-dorea.myshopify.com

# 进入主题目录并推送
cd shopify-custom-theme-template
shopify theme push
```

### 方法2: 手动ZIP上传
1. **打包主题**: 排除不需要的文件
2. **后台上传**: 通过Shopify管理面板上传ZIP
3. **配置设置**: 应用主题设置

### 方法3: GitHub Actions自动同步
通过GitHub仓库自动同步到Shopify

### 方法4: 第三方工具
使用第三方Shopify主题管理工具

## 📦 方法1: 手动ZIP上传（最简单）

### 步骤1: 打包主题文件
```bash
# 进入主题目录
cd shopify-custom-theme-template

# 创建上传包（排除不需要的文件）
zip -r eclat-dorea-theme-v2.zip . \
  -x "*.md" \
  -x "*.py" \
  -x "*.sh" \
  -x ".git/*" \
  -x ".github/*" \
  -x "logo_*.svg" \
  -x "node_modules/*" \
  -x ".shopifyignore"
```

### 步骤2: 登录Shopify后台
1. 访问 https://eclat-dorea.myshopify.com/admin
2. 输入你的登录凭据

### 步骤3: 上传主题包
1. 左侧菜单点击 **Online Store**
2. 选择 **Themes**
3. 滚动到底部，点击 **Upload theme**
4. 选择 `eclat-dorea-theme-v2.zip` 文件
5. 点击 **Upload** 开始上传

### 步骤4: 应用新主题
1. 等待上传完成
2. 找到新上传的主题
3. 点击 **Actions** → **Publish**
4. 确认发布

## ⚡ 方法2: 使用Shopify CLI（开发推荐）

### 安装Shopify CLI
```bash
# macOS (使用Homebrew)
brew tap shopify/shopify
brew install shopify-cli

# Windows (使用npm)
npm install -g @shopify/cli

# Linux (使用npm)
sudo npm install -g @shopify/cli
```

### 登录和认证
```bash
# 登录到你的店铺
shopify login --store eclat-dorea.myshopify.com

# 或使用合作伙伴账户
shopify login --store eclat-dorea.myshopify.com --password YOUR_STAFF_TOKEN
```

### 上传主题
```bash
# 进入主题目录
cd shopify-custom-theme-template

# 初始化主题（如果尚未初始化）
shopify theme init

# 推送主题到店铺
shopify theme push --theme eclat-dorea-gold-theme

# 或推送到开发主题
shopify theme push --development

# 强制覆盖现有主题
shopify theme push --force
```

### 实时预览
```bash
# 启动开发服务器
shopify theme serve

# 在浏览器中预览
open http://localhost:9292
```

## 🔧 方法3: 使用GitHub Actions自动同步

### 设置GitHub仓库
1. 创建GitHub仓库
2. 推送主题代码到仓库
3. 配置Shopify API密钥

### GitHub Actions工作流
```yaml
# .github/workflows/shopify-sync.yml
name: Shopify Theme Sync
on: [push]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: shopify/theme-check-action@v1
      - uses: shopify/theme-action@v1
        with:
          password: ${{ secrets.SHOPIFY_PASSWORD }}
          store: eclat-dorea.myshopify.com
          theme-id: ${{ secrets.SHOPIFY_THEME_ID }}
```

### 配置Secrets
在GitHub仓库设置中添加：
- `SHOPIFY_PASSWORD`: 商店访问密码
- `SHOPIFY_THEME_ID`: 主题ID

## 🎨 上传后配置

### 步骤1: 上传品牌Logo
1. 主题发布后，点击 **Customize**
2. 找到 **Brand Identity & Logo** 部分
3. 上传 `logo_header.svg` 作为主logo
4. 配置logo尺寸：200×60px

### 步骤2: 应用主题设置
1. **颜色设置**: 确保使用奢侈品配色
2. **字体设置**: 配置Cormorant + Montserrat字体
3. **Logo设置**: 启用悬停效果和响应式适配

### 步骤3: 测试主题功能
1. **首页**: 检查logo和布局
2. **产品页面**: 验证产品显示
3. **购物车**: 测试结账流程
4. **移动端**: 响应式适配测试

## 🧪 上传后测试清单

### 基本功能测试
- [ ] 主题成功发布
- [ ] 首页正常加载
- [ ] Logo正确显示
- [ ] 导航菜单工作正常
- [ ] 搜索功能可用

### 设计一致性测试
- [ ] 颜色主题正确应用
- [ ] 字体样式一致
- [ ] Logo在所有页面显示
- [ ] 响应式布局正常

### 性能测试
- [ ] 页面加载速度正常
- [ ] 移动端性能良好
- [ ] 图片优化正常
- [ ] 缓存策略有效

### 兼容性测试
- [ ] Chrome浏览器正常
- [ ] Firefox浏览器正常
- [ ] Safari浏览器正常
- [ ] Edge浏览器正常
- [ ] 移动浏览器正常

## 🔍 故障排除

### 常见上传问题

#### 问题1: ZIP文件太大
**解决**: 
- 检查是否包含了不需要的文件
- 使用 `.shopifyignore` 排除文件
- 压缩图片资源

#### 问题2: 文件格式错误
**解决**:
- 确保所有文件使用UTF-8编码
- 检查Liquid语法错误
- 验证JSON文件格式

#### 问题3: 权限问题
**解决**:
- 确认你有店铺管理权限
- 检查API密钥权限
- 联系店铺所有者

#### 问题4: 主题冲突
**解决**:
- 备份当前主题
- 创建新主题而不是覆盖
- 测试后再发布

### 上传错误代码
- **413**: 文件太大 - 压缩文件
- **422**: 格式错误 - 检查文件格式
- **401**: 权限不足 - 检查登录凭证
- **404**: 店铺不存在 - 检查店铺地址

## 📊 上传状态监控

### 上传进度检查
1. **Shopify后台**: Themes页面查看状态
2. **CLI输出**: 查看上传进度和错误
3. **邮件通知**: Shopify会发送上传完成通知

### 成功标志
- ✅ 主题出现在Themes列表
- ✅ 可以点击Customize编辑
- ✅ 发布后前台显示正常
- ✅ 无错误日志

## 🚀 快速上传脚本

### 一键上传脚本
```bash
#!/bin/bash
# 快速上传Shopify主题脚本

echo "🚀 开始上传Éclat Doréa主题..."

# 1. 清理和打包
echo "📦 打包主题文件..."
zip -r eclat-dorea-theme.zip . \
  -x "*.md" \
  -x "*.py" \
  -x "*.sh" \
  -x ".git/*" \
  -x ".github/*" \
  -x "logo_*.svg" \
  -x "node_modules/*" \
  -x ".shopifyignore" \
  -x "*.log"

echo "✅ 主题打包完成: eclat-dorea-theme.zip"

# 2. 显示上传指南
echo ""
echo "🎯 上传指南:"
echo "1. 访问 https://eclat-dorea.myshopify.com/admin"
echo "2. 进入 Online Store → Themes"
echo "3. 点击 'Upload theme'"
echo "4. 选择 eclat-dorea-theme.zip"
echo "5. 点击 Upload 并等待完成"
echo "6. 发布新主题"
echo ""
echo "📁 文件大小: $(du -h eclat-dorea-theme.zip | cut -f1)"
echo "⏱️  预计时间: 2-5分钟"
```

### 执行脚本
```bash
chmod +x upload_theme.sh
./upload_theme.sh
```

## 📞 技术支持

### 上传问题支持
1. **错误截图**: 提供上传错误截图
2. **日志文件**: 如果有错误日志
3. **文件列表**: 打包的文件列表
4. **浏览器信息**: 使用的浏览器和版本

### 紧急联系方式
- **Shopify支持**: https://help.shopify.com
- **主题文档**: 查看项目README文件
- **社区论坛**: https://community.shopify.com

### 备选方案
如果上传失败：
1. **分步上传**: 先上传核心文件，再上传资源
2. **使用CLI**: 尝试Shopify CLI上传
3. **联系Shopify**: 获取官方技术支持
4. **测试环境**: 先在测试店铺上传

## 🎉 上传成功确认

### 完成检查项
- [ ] 主题成功上传到Themes列表
- [ ] 可以自定义主题设置
- [ ] 发布后前台显示正常
- [ ] 所有功能测试通过
- [ ] 移动端适配正常

### 最终验证
1. **访问店铺**: https://eclat-dorea.myshopify.com
2. **检查首页**: 确认新主题生效
3. **测试功能**: 导航、搜索、购物车
4. **移动端**: 手机访问测试

### 庆祝时刻 🎊
上传成功后：
1. **分享成果**: 展示新的豪华珠宝主题
2. **收集反馈**: 获取用户对新设计的反馈
3. **分析数据**: 监控转化率和用户行为
4. **持续优化**: 基于数据进一步优化

---

**立即开始上传**: https://eclat-dorea.myshopify.com/admin  
**预计完成时间**: 5-10分钟  
**主题版本**: Luxury Gold Jewelry Theme v2.0  
**品牌**: Éclat Doréa collection  

**成功提示**: 主题上传是品牌升级的关键一步，完成后你的店铺将拥有完整的奢侈品视觉体验！