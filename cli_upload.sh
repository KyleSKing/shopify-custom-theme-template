#!/bin/bash
# Shopify CLI上传Éclat Doréa主题脚本

echo "🚀 Shopify CLI主题上传系统"
echo "=================================================="
echo "店铺: eclat-dorea.myshopify.com"
echo "主题: Éclat Doréa Luxury Gold Jewelry Theme v2.0"
echo "CLI版本: Shopify CLI 3.92.1"
echo ""

# 检查Shopify CLI是否安装
if ! command -v shopify &> /dev/null; then
    echo "❌ Shopify CLI未安装"
    echo "请先运行: npm install -g @shopify/cli"
    exit 1
fi

echo "✅ Shopify CLI已安装"
shopify version

# 检查当前目录
if [ ! -f "config/settings_schema.json" ]; then
    echo "❌ 错误: 不在主题目录中"
    echo "请在 shopify-custom-theme-template 目录中运行此脚本"
    exit 1
fi

echo "✅ 在正确的主题目录中"

echo ""
echo "🎯 上传选项:"
echo "=================================================="
echo "选项1: 🔥 立即登录并上传"
echo "选项2: 📦 仅打包主题文件"
echo "选项3: 🔍 查看店铺主题列表"
echo "选项4: 🧪 启动开发模式测试"
echo "选项5: 📚 查看CLI帮助文档"

echo ""
read -p "请选择选项 (1-5): " choice

case $choice in
    1)
        echo "🔥 选择选项1: 立即登录并上传"
        ;;
    2)
        echo "📦 选择选项2: 仅打包主题文件"
        ;;
    3)
        echo "🔍 选择选项3: 查看店铺主题列表"
        ;;
    4)
        echo "🧪 选择选项4: 启动开发模式测试"
        ;;
    5)
        echo "📚 选择选项5: 查看CLI帮助文档"
        ;;
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo ""
echo "=================================================="

# 选项1: 立即登录并上传
if [ "$choice" = "1" ]; then
    echo "步骤1: 🔐 登录到Shopify店铺"
    echo "----------------------------------------"
    
    shopify login --store eclat-dorea.myshopify.com
    
    echo "✅ 登录完成"
    
    echo "步骤2: 📁 推送Éclat Doréa主题"
    echo "----------------------------------------"
    
    echo "推荐上传命令:"
    echo "shopify theme push --theme eclat-dorea-gold-jewelry --force"
    
    echo "执行命令..."
    shopify theme push --theme eclat-dorea-gold-jewelry --force
    
    echo "步骤3: 📊 获取主题信息"
    echo "----------------------------------------"
    
    shopify theme list
    
    echo "步骤4: 🎯 发布主题"
    echo "----------------------------------------"
    
    echo "获取主题ID后运行:"
    echo "shopify theme publish --theme YOUR_THEME_ID"
    
    echo "步骤5: 🔗 预览主题"
    echo "----------------------------------------"
    
    echo "预览命令:"
    echo "shopify theme open"
    
    echo ""
    echo "🎉 上传完成！"
    echo "立即访问: https://eclat-dorea.myshopify.com"
fi

# 选项2: 仅打包主题文件
if [ "$choice" = "2" ]; then
    echo "📦 打包主题文件"
    echo "----------------------------------------"
    
    shopify theme package
    
    echo "✅ 主题打包完成"
    echo "生成的.zip文件可用于手动上传"
    
    echo ""
    echo "手动上传步骤:"
    echo "1. 访问 https://eclat-dorea.myshopify.com/admin"
    echo "2. Online Store → Themes → Upload theme"
    echo "3. 选择生成的.zip文件"
    echo "4. 上传并发布"
fi

# 选项3: 查看店铺主题列表
if [ "$choice" = "3" ]; then
    echo "🔍 查看店铺主题列表"
    echo "----------------------------------------"
    
    echo "先登录店铺..."
    shopify login --store eclat-dorea.myshopify.com
    
    shopify theme list
    
    echo ""
    echo "📋 主题信息说明:"
    echo "- ID: 主题唯一标识"
    echo "- Name: 主题名称"
    echo "- Role: 主题角色 (development/main/unpublished)"
    echo "- Updated: 最后更新时间"
fi

# 选项4: 启动开发模式测试
if [ "$choice" = "4" ]; then
    echo "🧪 启动开发模式测试"
    echo "----------------------------------------"
    
    echo "先登录店铺..."
    shopify login --store eclat-dorea.myshopify.com
    
    echo "启动开发模式..."
    shopify theme dev
    
    echo ""
    echo "🎨 开发模式特点:"
    echo "- 实时同步本地更改"
    echo "- 提供预览URL"
    echo "- 适合开发和测试"
    echo "- 修改文件后自动上传"
fi

# 选项5: 查看CLI帮助文档
if [ "$choice" = "5" ]; then
    echo "📚 查看CLI帮助文档"
    echo "----------------------------------------"
    
    echo "Shopify CLI主要命令:"
    echo ""
    echo "🔐 登录认证"
    echo "  shopify login --store eclat-dorea.myshopify.com"
    echo "  shopify logout"
    echo ""
    echo "📁 主题管理"
    echo "  shopify theme list"
    echo "  shopify theme info"
    echo "  shopify theme push --theme NAME"
    echo "  shopify theme dev"
    echo "  shopify theme package"
    echo "  shopify theme publish --theme ID"
    echo ""
    echo "🔍 查看详细帮助"
    echo "  shopify help"
    echo "  shopify theme --help"
    echo "  shopify theme push --help"
fi

echo ""
echo "=================================================="
echo "🎉 Éclat Doréa主题Shopify CLI上传系统"
echo ""
echo "📞 CLI使用技巧:"
echo "- 使用 --verbose 查看详细输出"
echo "- 使用 --json 获取JSON格式结果"
echo "- 使用 --force 强制覆盖现有主题"
echo "- 使用 --development 上传为开发主题"
echo ""
echo "品牌: Éclat Doréa collection"
echo "店铺: eclat-dorea.myshopify.com"
echo "CLI版本: Shopify CLI 3.92.1"
echo "时间: $(date)"
echo ""
echo "🚀 立即开始上传 → 运行选项1"