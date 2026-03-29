#!/bin/bash
# Shopify主题自动打包脚本

echo "🎨 Éclat Doréa主题打包系统"
echo "=================================================="

# 1. 清理旧打包文件
echo "📦 清理旧文件..."
rm -rf upload_package
rm -f eclat-dorea-theme.zip

# 2. 创建打包目录
echo "📁 创建打包目录..."
mkdir -p upload_package

# 3. 复制主题核心文件
echo "📋 复制主题文件..."
echo "- 复制 assets..."
cp -r assets upload_package/

echo "- 复制 config..."
cp -r config upload_package/

echo "- 复制 layout..."
cp -r layout upload_package/

echo "- 复制 sections..."
cp -r sections upload_package/

echo "- 复制 snippets..."
cp -r snippets upload_package/

echo "- 复制 templates..."
cp -r templates upload_package/

echo "- 复制 locales..."
cp -r locales upload_package/

echo "- 复制 package.json..."
cp package.json upload_package/

# 4. 复制Logo文件
echo "🎨 复制品牌Logo..."
cp logo_header.svg upload_package/
cp logo_footer.svg upload_package/
cp logo_favicon.svg upload_package/

# 5. 创建.shopifyignore文件
echo "📝 创建.shopifyignore..."
cat > upload_package/.shopifyignore << EOF
# Shopify上传忽略文件
*.md
*.py
*.sh
.git/
.github/
logo_*.svg
node_modules/
EOF

# 6. 创建ZIP文件
echo "📦 创建ZIP压缩包..."
cd upload_package
zip -r eclat-dorea-theme-v2.zip . -x ".shopifyignore"
cd ..

# 7. 显示结果
echo "✅ 打包完成!"
echo ""
echo "📊 文件信息:"
zip_size=$(du -h upload_package/eclat-dorea-theme-v2.zip | cut -f1)
echo "- ZIP文件: upload_package/eclat-dorea-theme-v2.zip"
echo "- 文件大小: $zip_size"
echo "- 包含文件数: $(find upload_package -type f | grep -v ".zip" | grep -v ".shopifyignore" | wc -l)"

echo ""
echo "📁 核心文件清单:"
echo "1. config/settings_schema.json - 主题设置配置"
echo "2. layout/theme.liquid - 主题布局文件"
echo "3. assets/css/global.css - 全局样式（奢侈品配色）"
echo "4. snippets/logo.liquid - 品牌logo组件"
echo "5. snippets/brand-logo.liquid - 高级logo组件"
echo "6. logo_header.svg - 主品牌logo (200×60px)"
echo "7. logo_footer.svg - 页脚logo (120×40px)"
echo "8. logo_favicon.svg - 浏览器图标 (32×32px)"

echo ""
echo "🎨 主题特色:"
echo "- 奢侈品金饰配色系统"
echo "- Cormorant + Montserrat字体组合"
echo "- 完整的品牌logo一致性系统"
echo "- 响应式设计和性能优化"
echo "- 无障碍支持和SEO优化"

echo ""
echo "🚀 上传步骤:"
echo "=================================================="
echo "1. 访问 https://eclat-dorea.myshopify.com/admin"
echo "2. 登录店铺账户"
echo "3. 点击 'Online Store' → 'Themes'"
echo "4. 点击 'Upload theme'（页面底部）"
echo "5. 选择 upload_package/eclat-dorea-theme-v2.zip"
echo "6. 点击 'Upload' 按钮"
echo "7. 等待上传完成（约1-2分钟）"
echo "8. 点击 'Publish' 发布新主题"
echo "9. 访问店铺首页查看效果"

echo ""
echo "📱 上传后测试:"
echo "- 桌面端: https://eclat-dorea.myshopify.com"
echo "- 移动端: 手机访问店铺"
echo "- Logo显示: 确认品牌logo正确显示"
echo "- 配色检查: 确认奢侈品配色生效"
echo "- 功能测试: 导航、搜索、购物车"

echo ""
echo "🔧 故障排除:"
echo "如遇上传问题:"
echo "1. 检查文件大小（应小于5MB）"
echo "2. 确认ZIP文件格式正确"
echo "3. 尝试不同的浏览器"
echo "4. 清除浏览器缓存"
echo "5. 联系Shopify支持"

echo ""
echo "📞 技术支持:"
echo "- 错误截图: 提供上传错误截图"
echo "- 问题描述: 详细说明遇到的问题"
echo "- 环境信息: 浏览器和设备信息"

echo ""
echo "=================================================="
echo "🎉 Éclat Doréa Luxury Gold Jewelry Theme"
echo "版本: v2.0"
echo "品牌: Éclat Doréa collection"
echo "店铺: eclat-dorea.myshopify.com"
echo "状态: 打包完成，等待上传"
echo ""
echo "⏱️  预计上传时间: 2-3分钟"
echo "💡 建议: 上传前备份当前主题"
echo ""
echo "立即开始 → https://eclat-dorea.myshopify.com/admin"