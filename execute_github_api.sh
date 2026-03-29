#!/bin/bash
# GitHub API创建仓库执行脚本

echo "🚀 GitHub API仓库创建执行脚本"
echo "================================"

# 配置参数
REPO_NAME="shopify-custom-theme-template"
REPO_DESCRIPTION="A modern Shopify custom theme template for gold jewelry stores"
REPO_PRIVATE=false

echo "📋 配置信息："
echo "仓库名称: $REPO_NAME"
echo "仓库描述: $REPO_DESCRIPTION"
echo "仓库类型: $(if $REPO_PRIVATE; then echo '私有'; else echo '公开'; fi)"

# 检查GitHub Token
if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️ 请先设置GitHub Token环境变量"
    echo "执行: export GITHUB_TOKEN=your_personal_access_token"
    echo ""
    echo "获取Token步骤："
    echo "1. 访问 https://github.com/settings/tokens"
    echo "2. 点击 'Generate new token'"
    echo "3. 选择 'repo' 权限"
    echo "4. 生成并保存token"
    exit 1
fi

echo "✅ GitHub Token已设置"

# 检查本地项目
if [ ! -d "shopify-custom-theme-template" ]; then
    echo "❌ 项目目录不存在"
    exit 1
fi

echo "✅ 项目目录存在"

# 显示项目状态
cd shopify-custom-theme-template
echo ""
echo "📊 项目状态："
echo "Git提交数: $(git log --oneline | wc -l)"
echo "文件总数: $(find . -type f | wc -l)"
echo "GitHub Actions文件: $(ls .github/workflows/)"

echo ""
echo "🎯 开始创建GitHub仓库..."
echo ""

# API请求
API_URL="https://api.github.com/user/repos"
API_DATA=$(cat <<EOF
{
  "name": "$REPO_NAME",
  "description": "$REPO_DESCRIPTION",
  "private": $REPO_PRIVATE,
  "has_projects": false,
  "has_wiki": false,
  "auto_init": false
}
EOF
)

echo "📡 发送API请求..."
RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/json" \
  "$API_URL" \
  -d "$API_DATA")

# 解析响应
if echo "$RESPONSE" | grep -q "html_url"; then
    echo "✅ GitHub仓库创建成功！"
    
    # 提取仓库URL
    REPO_URL=$(echo "$RESPONSE" | grep -o '"html_url":"[^"]*"' | cut -d'"' -f4)
    CLONE_URL=$(echo "$RESPONSE" | grep -o '"clone_url":"[^"]*"' | cut -d'"' -f4)
    
    echo ""
    echo "📋 仓库信息："
    echo "访问地址: $REPO_URL"
    echo "克隆地址: $CLONE_URL"
    
    echo ""
    echo "🚀 下一步：推送代码"
    echo "执行以下命令："
    echo ""
    echo "# 添加远程仓库"
    echo "git remote add origin $CLONE_URL"
    echo ""
    echo "# 推送代码"
    echo "git push -u origin master"
    echo ""
    echo "# 或使用main分支"
    echo "git branch -m main"
    echo "git push -u origin main"
    
    # 自动添加远程仓库（可选）
    echo ""
    echo "💡 自动配置（可选）："
    read -p "是否自动添加远程仓库并推送代码？ (y/n): " choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        git remote add origin "$CLONE_URL"
        echo "✅ 远程仓库已添加"
        
        read -p "是否现在推送代码？ (y/n): " push_choice
        if [ "$push_choice" = "y" ] || [ "$push_choice" = "Y" ]; then
            git push -u origin master
            echo "✅ 代码已推送"
        fi
    fi
    
else
    echo "❌ GitHub仓库创建失败"
    echo ""
    echo "错误响应："
    echo "$RESPONSE"
    echo ""
    echo "可能的原因："
    echo "1. Token权限不足"
    echo "2. 仓库名称已存在"
    echo "3. API限制"
fi

echo ""
echo "📈 GitHub Actions配置："
echo "仓库创建后，请配置GitHub Secrets："
echo "1. Settings → Secrets and variables → Actions"
echo "2. 添加：SHOPIFY_STORE_URL, SHOPIFY_PASSWORD, SHOPIFY_THEME_ID"
echo ""
echo "🎉 脚本执行完成！"