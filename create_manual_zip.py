#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
手动创建包含所有文件的Éclat Doréa主题ZIP包
"""

import os
import shutil
import zipfile

def create_manual_zip():
    """手动创建ZIP文件"""
    
    print("📦 手动创建Éclat Doréa主题ZIP包")
    
    # 清理
    if os.path.exists("eclat-dorea-manual.zip"):
        os.remove("eclat-dorea-manual.zip")
    
    # 创建临时目录
    temp_dir = "zip_temp"
    if os.path.exists(temp_dir):
        shutil.rmtree(temp_dir)
    os.makedirs(temp_dir)
    
    # 复制所有文件
    dirs_to_copy = ["assets", "config", "layout", "sections", "snippets", "templates", "locales"]
    
    for dir_name in dirs_to_copy:
        if os.path.exists(dir_name):
            shutil.copytree(dir_name, os.path.join(temp_dir, dir_name))
    
    # 复制单个文件
    files_to_copy = ["package.json", "logo_header.svg", "logo_footer.svg", "logo_favicon.svg"]
    
    for file_name in files_to_copy:
        if os.path.exists(file_name):
            shutil.copy2(file_name, os.path.join(temp_dir, file_name))
    
    # 创建ZIP文件
    with zipfile.ZipFile("eclat-dorea-manual.zip", 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(temp_dir):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, temp_dir)
                zipf.write(file_path, arcname)
    
    # 清理临时目录
    shutil.rmtree(temp_dir)
    
    print(f"✅ ZIP文件创建完成: eclat-dorea-manual.zip")
    
    # 显示文件信息
    file_size = os.path.getsize("eclat-dorea-manual.zip")
    print(f"📊 文件大小: {file_size} bytes ({file_size/1024:.2f} KB)")
    
    # 列出文件
    with zipfile.ZipFile("eclat-dorea-manual.zip", 'r') as zipf:
        files = zipf.namelist()
        
    print(f"📁 包含文件数: {len(files)}")
    
    # 关键文件检查
    critical_files = [
        "config/settings_schema.json",
        "layout/theme.liquid", 
        "assets/css/global.css",
        "snippets/logo.liquid",
        "logo_header.svg"
    ]
    
    print("\n🔍 关键文件检查:")
    for file in critical_files:
        if file in files:
            print(f"✅ {file}")
        else:
            print(f"❌ {file}")
    
    return "eclat-dorea-manual.zip"

def main():
    print("🎨 Éclat Doréa Shopify主题手动打包")
    
    zip_file = create_manual_zip()
    
    print("\n🚀 主题手动打包完成！")
    print(f"📦 ZIP文件: {zip_file}")
    print("🎯 立即上传: https://eclat-dorea.myshopify.com/admin")
    print("\n💡 说明: 这个ZIP文件包含所有必要的主题文件，可直接上传到Shopify")

if __name__ == "__main__":
    main()