#!/bin/bash
# Shopify主题上传脚本
# Éclat Doréa collection - Luxury Gold Jewelry Theme

echo "🚀 Éclat Doréa Shopify主题上传系统"
echo "=================================================="
echo "店铺: eclat-dorea.myshopify.com"
echo "主题: Luxury Gold Jewelry Theme v2.0"
echo ""

# 检查当前目录
if [ ! -f "config/settings_schema.json" ]; then
    echo "❌ 错误: 不在主题目录中"
    echo "请在 shopify-custom-theme-template 目录中运行此脚本"
    exit 1
fi

echo "📊 主题文件统计:"
echo "- Liquid文件: $(find . -name '*.liquid' | grep -v node_modules | wc -l)"
echo "- 配置文件: $(find config/ -name '*.json' | wc -l)"
echo "- 样式文件: $(find assets/css/ -name '*.css' | wc -l)"
echo "- Logo文件: $(ls logo_*.svg | wc -l)"

echo ""
echo "🎯 上传选项:"
echo "=================================================="

echo "选项1: 🔥 立即打包上传 (推荐)"
echo "选项2: 📦 仅打包主题文件"
echo "选项3: 🛠️ 使用Shopify CLI上传"
echo "选项4: 📚 查看详细指南"

echo ""
read -p "请选择选项 (1-4): " choice

case $choice in
    1)
        echo "🔥 选择选项1: 立即打包上传"
        ;;
    2)
        echo "📦 选择选项2: 仅打包主题文件"
        ;;
    3)
        echo "🛠️ 选择选项3: 使用Shopify CLI上传"
        ;;
    4)
        echo "📚 选择选项4: 查看详细指南"
        ;;
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo ""
echo "=================================================="

# 选项1: 立即打包上传
if [ "$choice" = "1" ]; then
    echo "步骤1: 📦 打包主题文件"
    echo "----------------------------------------"
    
    # 创建打包目录
    mkdir -p upload_package
    
    # 复制主题文件（排除不需要的文件）
    echo "复制 assets 目录..."
    cp -r assets upload_package/
    
    echo "复制 config 目录..."
    cp -r config upload_package/
    
    echo "复制 layout 目录..."
    cp -r layout upload_package/
    
    echo "复制 sections 目录..."
    cp -r sections upload_package/
    
    echo "复制 snippets 目录..."
    cp -r snippets upload_package/
    
    echo "复制 templates 目录..."
    cp -r templates upload_package/
    
    echo "复制 locales 目录..."
    cp -r locales upload_package/
    
    echo "复制 package.json..."
    cp package.json upload_package/
    
    # 复制logo文件
    echo "复制Logo文件..."
    cp logo_header.svg upload_package/
    cp logo_footer.svg upload_package/
    cp logo_favicon.svg upload_package/
    
    echo "✅ 文件复制完成"
    
    # 创建ZIP文件
    echo "步骤2: 📁 创建ZIP压缩包"
    echo "----------------------------------------"
    
    cd upload_package
    zip -r eclat-dorea-theme-v2.zip . -x ".shopifyignore"
    cd ..
    
    echo "✅ ZIP文件创建完成: upload_package/eclat-dorea-theme-v2.zip"
    
    # 显示文件信息
    echo "步骤3: 📊 文件信息"
    echo "----------------------------------------"
    
    zip_size=$(du -h upload_package/eclat-dorea-theme-v2.zip | cut -f1)
    echo "ZIP文件大小: $zip_size"
    
    echo "包含的文件结构:"
    find upload_package -type f | grep -v ".zip" | sort
    
    echo ""
    echo "🎯 立即上传指南:"
    echo "=================================================="
    echo "1. 访问 https://eclat-dorea.myshopify.com/admin"
    echo "2. 登录你的店铺账户"
    echo "3. 点击 'Online Store' → 'Themes'"
    echo "4. 点击 'Upload theme'（在底部）"
    echo "5. 选择 upload_package/eclat-dorea-theme-v2.zip"
    echo "6. 点击 'Upload' 开始上传"
    echo "7. 上传完成后点击 'Publish' 发布主题"
    echo "8. 访问店铺首页查看效果"
    
    echo ""
    echo "⏱️  预计时间: 3-5分钟"
    echo "📱 上传后测试: 桌面端和移动端"
    
    # 提供快速访问链接
    echo ""
    echo "🔗 快速链接:"
    echo "- Shopify后台: https://eclat-dorea.myshopify.com/admin"
    echo "- 店铺首页: https://eclat-dorea.myshopify.com"
    echo "- 主题文档: UPLOAD_THEME_GUIDE.md"
    
    echo ""
    echo "💡 提示: 上传前建议备份当前主题"
    
fi

# 选项2: 仅打包主题文件
if [ "$choice" = "2" ]; then
    echo "📦 仅打包主题文件"
    echo "----------------------------------------"
    
    # 直接创建ZIP文件
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
    
    echo "✅ ZIP文件创建完成: eclat-dorea-theme.zip"
    
    zip_size=$(du -h eclat-dorea-theme.zip | cut -f1)
    echo "文件大小: $zip_size"
    
    echo ""
    echo "📁 包含的主要文件:"
    echo "- config/settings_schema.json"
    echo "- layout/theme.liquid"
    echo "- assets/css/global.css"
    echo "- snippets/logo.liquid"
    echo "- snippets/brand-logo.liquid"
    
    echo ""
    echo "🎯 上传步骤:"
    echo "1. 登录Shopify后台"
    echo "2. Online Store → Themes → Upload theme"
    echo "3. 选择 eclat-dorea-theme.zip"
    echo "4. 上传并发布"
fi

# 选项3: Shopify CLI上传
if [ "$choice" = "3" ]; then
    echo "🛠️ Shopify CLI上传指南"
    echo "----------------------------------------"
    
    echo "需要安装Shopify CLI:"
    echo ""
    echo "安装方法:"
    echo "1. macOS: brew install shopify-cli"
    echo "2. Linux/Windows: npm install -g @shopify/cli"
    echo ""
    echo "使用步骤:"
    echo "1. shopify login --store eclat-dorea.myshopify.com"
    echo "2. shopify theme push"
    echo "3. 或: shopify theme push --development"
    echo ""
    echo "实时预览:"
    echo "shopify theme serve"
    echo ""
    echo "更多信息: https://shopify.dev/themes/tools/cli"
fi

# 选项4: 查看详细指南
if [ "$choice" = "4" ]; then
    echo "📚 详细上传指南"
    echo "----------------------------------------"
    
    echo "请查看以下文档:"
    echo ""
    echo "1. UPLOAD_THEME_GUIDE.md - 完整上传指南"
    echo "2. QUICK_UPLOAD.md - Logo快速上传指南"
    echo "3. SVG_CONVERSION_GUIDE.md - SVG文件指南"
    echo ""
    echo "或运行以下命令查看:"
    echo "cat UPLOAD_THEME_GUIDE.md | head -50"
fi

echo ""
echo "=================================================="
echo "🎉 Éclat Doréa主题上传准备完成！"
echo ""
echo "📞 如需技术支持:"
echo "- 提供上传错误截图"
echo "- 描述具体问题"
echo "- 浏览器和设备信息"
echo ""
echo "品牌: Éclat Doréa collection"
echo "店铺: eclat-dorea.myshopify.com"
echo "时间: $(date)"
echo ""
echo "🚀 立即开始上传 → https://eclat-dorea.myshopify.com/admin"