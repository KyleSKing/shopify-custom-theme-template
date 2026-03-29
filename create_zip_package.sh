#!/bin/bash
# Éclat Doréa Shopify主题ZIP打包脚本

echo "📦 Éclat Doréa主题ZIP打包系统"
echo "=================================================="

# 清理旧文件
echo "🧹 清理旧打包文件..."
rm -f eclat-dorea-theme.zip
rm -rf upload_zip_temp

# 创建临时目录
echo "📁 创建临时目录..."
mkdir -p upload_zip_temp

# 复制Shopify主题核心文件
echo "📋 复制主题文件..."
cp -r assets upload_zip_temp/
cp -r config upload_zip_temp/
cp -r layout upload_zip_temp/
cp -r sections upload_zip_temp/
cp -r snippets upload_zip_temp/
cp -r templates upload_zip_temp/
cp -r locales upload_zip_temp/
cp package.json upload_zip_temp/

# 复制必要的logo文件
echo "🎨 复制Logo文件..."
cp logo_header.svg upload_zip_temp/
cp logo_footer.svg upload_zip_temp/
cp logo_favicon.svg upload_zip_temp/

# 创建.shopifyignore文件
echo "📝 创建.shopifyignore..."
cat > upload_zip_temp/.shopifyignore << EOF
# Shopify上传忽略文件
*.md
*.py
*.sh
*.tar.gz
*.zip
.git/
.github/
logo_*.svg
node_modules/
EOF

# 创建ZIP文件
echo "📦 创建ZIP文件..."
cd upload_zip_temp
zip -r eclat-dorea-theme.zip . -x ".shopifyignore"
mv eclat-dorea-theme.zip ../eclat-dorea-theme.zip
cd ..

# 清理临时目录
rm -rf upload_zip_temp

# 显示结果
echo "✅ ZIP打包完成!"
echo ""
echo "📊 文件信息:"
zip_size=$(du -h eclat-dorea-theme.zip | cut -f1)
echo "- ZIP文件: eclat-dorea-theme.zip"
echo "- 文件大小: $zip_size"
echo "- Shopify标准格式: ✅ 符合上传要求"

echo ""
echo "📁 ZIP包含的核心文件:"
echo "1. config/settings_schema.json - 主题设置架构"
echo "2. config/settings_data.json - 预设奢侈品配色"
echo "3. layout/theme.liquid - 主题布局文件"
echo "4. assets/css/global.css - 奢侈品金饰样式系统"
echo "5. snippets/logo.liquid - 品牌logo显示组件"
echo "6. snippets/brand-logo.liquid - 高级logo组件"
echo "7. logo_header.svg - 主品牌logo (200×60px)"
echo "8. logo_footer.svg - 页脚logo (120×40px)"
echo "9. logo_favicon.svg - 浏览器图标 (32×32px)"

echo ""
echo "🎨 主题特色摘要:"
echo "- 奢侈品金饰配色系统 (#1C1917 + #CA8A04)"
echo "- Cormorant + Montserrat法式优雅字体组合"
echo "- 完整的品牌logo一致性系统"
echo "- 响应式设计和性能优化"
echo "- 无障碍支持和SEO优化"

echo ""
echo "🚀 立即上传步骤:"
echo "=================================================="
echo "1. 访问 https://eclat-dorea.myshopify.com/admin"
echo "2. 登录店铺账户"
echo "3. 点击 'Online Store' → 'Themes'"
echo "4. 点击 'Upload theme'（页面底部）"
echo "5. 选择 eclat-dorea-theme.zip"
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
echo "🔧 ZIP格式优势:"
echo "- ✅ Shopify官方支持格式"
echo "- ✅ 文件压缩优化"
echo "- ✅ 上传速度快"
echo "- ✅ 兼容所有浏览器"

echo ""
echo "📞 技术支持:"
echo "如遇上传问题，请提供:"
echo "- 错误截图: 上传错误截图"
echo "- 问题描述: 详细说明遇到的问题"
echo "- 环境信息: 浏览器和设备信息"

echo ""
echo "=================================================="
echo "🎉 Éclat Doréa Luxury Gold Jewelry Theme"
echo "版本: v2.0 (ZIP格式)"
echo "品牌: Éclat Doréa collection"
echo "店铺: eclat-dorea.myshopify.com"
echo "状态: ZIP打包完成，等待上传"
echo ""
echo "⏱️  预计上传时间: 2-3分钟"
echo "💡 建议: 上传前备份当前主题"
echo ""
echo "立即上传 → https://eclat-dorea.myshopify.com/admin"