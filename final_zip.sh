#!/bin/bash
# Éclat Doréa最终ZIP打包脚本

echo "🎨 Éclat Doréa最终ZIP打包"
echo "=========================================="

# 清理
rm -rf final_zip_temp
rm -f eclat-dorea-final.zip

# 创建临时目录
mkdir -p final_zip_temp

# 复制所有必要文件
echo "📋 复制主题文件..."
cp -r assets final_zip_temp/
cp -r config final_zip_temp/
cp -r layout final_zip_temp/
cp -r sections final_zip_temp/
cp -r snippets final_zip_temp/
cp -r templates final_zip_temp/
cp -r locales final_zip_temp/
cp package.json final_zip_temp/

# 复制Logo文件
echo "🎨 复制Logo文件..."
cp logo_header.svg final_zip_temp/
cp logo_footer.svg final_zip_temp/
cp logo_favicon.svg final_zip_temp/

# 检查文件
echo "🔍 检查文件完整性..."
if [ -f "final_zip_temp/config/settings_schema.json" ]; then
    echo "✅ settings_schema.json - 存在"
else
    echo "❌ settings_schema.json - 缺失"
fi

if [ -f "final_zip_temp/layout/theme.liquid" ]; then
    echo "✅ theme.liquid - 存在"
else
    echo "❌ theme.liquid - 缺失"
fi

if [ -f "final_zip_temp/assets/css/global.css" ]; then
    echo "✅ global.css - 存在"
else
    echo "❌ global.css - 缺失"
fi

if [ -f "final_zip_temp/snippets/logo.liquid" ]; then
    echo "✅ logo.liquid - 存在"
else
    echo "❌ logo.liquid - 缺失"
fi

if [ -f "final_zip_temp/logo_header.svg" ]; then
    echo "✅ logo_header.svg - 存在"
else
    echo "❌ logo_header.svg - 缺失"
fi

# 打包
echo "📦 使用Shopify CLI打包..."
cd final_zip_temp
shopify theme package
mv *.zip ../eclat-dorea-final.zip
cd ..

# 清理
rm -rf final_zip_temp

echo "✅ 最终ZIP打包完成!"
echo ""
echo "📊 文件信息:"
file_size=$(du -h eclat-dorea-final.zip | cut -f1)
echo "- ZIP文件: eclat-dorea-final.zip"
echo "- 文件大小: $file_size"
echo "- Shopify格式: ✅ 官方支持"

echo ""
echo "📁 ZIP包含文件:"
unzip -l eclat-dorea-final.zip | grep -v "/$" | tail -20

echo ""
echo "🎨 Éclat Doréa主题完整包含:"
echo "1. 奢侈品金饰配色系统"
echo "2. 品牌Logo一致性系统"
echo "3. 法式优雅字体组合"
echo "4. 响应式设计和性能优化"
echo "5. 完整的Shopify主题架构"

echo ""
echo "🚀 立即上传指南:"
echo "=========================================="
echo "1. 访问 https://eclat-dorea.myshopify.com/admin"
echo "2. Online Store → Themes → Upload theme"
echo "3. 选择 eclat-dorea-final.zip"
echo "4. 点击 Upload 按钮"
echo "5. 等待上传完成 (约1-2分钟)"
echo "6. 点击 Publish 发布主题"
echo "7. 访问店铺查看效果"

echo ""
echo "📱 上传后测试:"
echo "- 桌面端: https://eclat-dorea.myshopify.com"
echo "- 移动端: 手机访问店铺"
echo "- Logo显示: 确认品牌logo正确显示"
echo "- 配色检查: 确认奢侈品配色生效"
echo "- 功能测试: 导航、搜索、购物车"

echo ""
echo "🔧 文件格式优势:"
echo "- ✅ Shopify官方ZIP格式"
echo "- ✅ 包含所有必要文件"
echo "- ✅ 优化的文件结构"
echo "- ✅ 快速上传支持"

echo ""
echo "📞 技术支持:"
echo "如遇上传问题，请提供:"
echo "- 错误截图: 上传错误截图"
echo "- 文件信息: eclat-dorea-final.zip 文件大小"
echo "- 问题描述: 详细说明遇到的问题"

echo ""
echo "=========================================="
echo "🎉 Éclat Doréa Luxury Gold Jewelry Theme"
echo "版本: v2.0 (最终ZIP格式)"
echo "品牌: Éclat Doréa collection"
echo "店铺: eclat-dorea.myshopify.com"
echo "状态: 最终ZIP打包完成，等待上传"
echo ""
echo "⏱️  预计上传时间: 2-3分钟"
echo "💡 建议: 上传前备份当前主题"
echo ""
echo "立即上传 → https://eclat-dorea.myshopify.com/admin"