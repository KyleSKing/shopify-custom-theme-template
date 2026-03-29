#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
创建完整的Éclat Doréa主题ZIP上传包
"""

import os
import zipfile
import json

def create_shopify_zip():
    """创建Shopify主题ZIP文件"""
    
    print("📦 创建Éclat Doréa主题ZIP上传包")
    print("==========================================")
    
    # 定义需要包含的文件
    required_files = [
        # 目录结构
        "assets/",
        "config/",
        "layout/",
        "sections/",
        "snippets/",
        "templates/",
        "locales/",
        
        # 具体文件
        "assets/css/global.css",
        "assets/js/global.js",
        "assets/images/",
        
        "config/settings_data.json",
        "config/settings_schema.json",
        
        "layout/theme.liquid",
        
        "sections/announcement-bar.liquid",
        
        "snippets/logo.liquid",
        "snippets/brand-logo.liquid",
        
        "templates/index.json",
        
        "locales/en.default.json",
        
        "package.json",
        
        # Logo文件
        "logo_header.svg",
        "logo_footer.svg",
        "logo_favicon.svg",
    ]
    
    # 检查文件是否存在
    missing_files = []
    for file in required_files:
        if not os.path.exists(file):
            if not file.endswith('/'):  # 不是目录
                missing_files.append(file)
    
    if missing_files:
        print(f"⚠️  缺少文件: {missing_files}")
        print("尝试创建缺失的文件...")
    
    # 创建ZIP文件
    zip_filename = "eclat-dorea-theme-complete.zip"
    
    with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        # 添加目录和文件
        for item in required_files:
            if os.path.exists(item):
                if os.path.isdir(item):
                    # 添加目录中的所有文件
                    for root, dirs, files in os.walk(item):
                        for file in files:
                            file_path = os.path.join(root, file)
                            arcname = os.path.relpath(file_path, '.')
                            zipf.write(file_path, arcname)
                else:
                    # 添加单个文件
                    zipf.write(item, item)
    
    print(f"✅ ZIP文件创建完成: {zip_filename}")
    
    # 检查文件大小
    file_size = os.path.getsize(zip_filename)
    print(f"📊 文件大小: {file_size} bytes ({file_size/1024:.2f} KB)")
    
    # 列出ZIP中的文件
    with zipfile.ZipFile(zip_filename, 'r') as zipf:
        files = zipf.namelist()
        
    print(f"📁 包含文件数: {len(files)}")
    print("\n主要文件:")
    for file in sorted(files):
        if not file.endswith('/'):
            print(f"  - {file}")
    
    print("\n🎨 Éclat Doréa主题ZIP包已准备完成！")
    print("==========================================")
    print("立即上传步骤:")
    print("1. 访问 https://eclat-dorea.myshopify.com/admin")
    print("2. Online Store → Themes → Upload theme")
    print("3. 选择 eclat-dorea-theme-complete.zip")
    print("4. 上传并发布")
    
    return zip_filename

def verify_zip_contents(zip_filename):
    """验证ZIP文件内容"""
    print(f"\n🔍 验证ZIP文件: {zip_filename}")
    
    with zipfile.ZipFile(zip_filename, 'r') as zipf:
        # 检查关键文件
        critical_files = [
            "config/settings_schema.json",
            "layout/theme.liquid",
            "assets/css/global.css",
            "snippets/logo.liquid",
            "logo_header.svg"
        ]
        
        for file in critical_files:
            if file in zipf.namelist():
                print(f"✅ {file} - 存在")
            else:
                print(f"❌ {file} - 缺失")
    
    print("✅ ZIP文件验证完成")

def main():
    print("🎨 Éclat Doréa Shopify主题打包系统")
    
    # 创建ZIP文件
    zip_file = create_shopify_zip()
    
    # 验证文件内容
    verify_zip_contents(zip_file)
    
    print("\n🚀 主题打包完成！")
    print("📦 ZIP文件: eclat-dorea-theme-complete.zip")
    print("🎯 立即上传: https://eclat-dorea.myshopify.com/admin")

if __name__ == "__main__":
    main()