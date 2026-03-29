#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
创建Éclat Doréa collection品牌logo
适用于Shopify黄金珠宝主题
"""

from PIL import Image, ImageDraw, ImageFont
import os

def create_logo_variant(name, size, text1, text2=None, font_size1=36, font_size2=18):
    """创建logo变体"""
    width, height = size
    
    # 创建透明背景图像
    img = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # 计算居中位置
    # 尝试加载字体，如果失败则使用默认字体
    try:
        font1 = ImageFont.truetype("arial.ttf", font_size1)
        font2 = ImageFont.truetype("arial.ttf", font_size2)
    except:
        font1 = ImageFont.load_default()
        font2 = ImageFont.load_default()
    
    # 绘制金色文字
    gold_color = (202, 138, 4, 255)  # #CA8A04
    dark_gold = (212, 175, 55, 255)  # #D4AF37
    
    # 计算文本位置
    if text2:
        # 双行文本
        text1_width = font1.getbbox(text1)[2] - font1.getbbox(text1)[0] if hasattr(font1, 'getbbox') else len(text1) * font_size1
        text2_width = font2.getbbox(text2)[2] - font2.getbbox(text2)[0] if hasattr(font2, 'getbbox') else len(text2) * font_size2
        
        text1_x = (width - text1_width) // 2
        text2_x = (width - text2_width) // 2
        
        # 计算总高度
        total_text_height = font_size1 + font_size2 + 10
        text1_y = (height - total_text_height) // 2
        text2_y = text1_y + font_size1 + 5
        
        # 绘制文字
        draw.text((text1_x, text1_y), text1, fill=gold_color, font=font1)
        draw.text((text2_x, text2_y), text2, fill=dark_gold, font=font2)
    else:
        # 单行文本
        text_width = font1.getbbox(text1)[2] - font1.getbbox(text1)[0] if hasattr(font1, 'getbbox') else len(text1) * font_size1
        text_x = (width - text_width) // 2
        text_y = (height - font_size1) // 2
        draw.text((text_x, text_y), text1, fill=gold_color, font=font1)
    
    # 保存文件
    filename = f"logo_{name}.png"
    img.save(filename)
    print(f"✅ 创建logo: {filename} ({width}x{height})")
    
    return filename

def create_all_logo_variants():
    """创建所有logo变体"""
    print("🎨 开始创建Éclat Doréa collection品牌logo")
    print("="*50)
    
    logos = []
    
    # 1. 主Logo - 大尺寸
    logos.append(create_logo_variant(
        name="main",
        size=(400, 120),
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=40,
        font_size2=20
    ))
    
    # 2. 页眉Logo - 中等尺寸
    logos.append(create_logo_variant(
        name="header",
        size=(200, 60),
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=22,
        font_size2=12
    ))
    
    # 3. 页脚Logo - 小尺寸
    logos.append(create_logo_variant(
        name="footer",
        size=(120, 40),
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=16,
        font_size2=10
    ))
    
    # 4. 简化版 - 仅首字母
    logos.append(create_logo_variant(
        name="simple",
        size=(100, 40),
        text1="ÉD",
        text2=None,
        font_size1=30,
        font_size2=0
    ))
    
    # 5. 竖版Logo - 特殊用途
    logos.append(create_logo_variant(
        name="vertical",
        size=(120, 200),
        text1="ÉCLAT",
        text2="DORÉA\ncollection",
        font_size1=30,
        font_size2=18
    ))
    
    # 6. Favicon
    logos.append(create_logo_variant(
        name="favicon",
        size=(32, 32),
        text1="ÉD",
        text2=None,
        font_size1=18,
        font_size2=0
    ))
    
    print("\n" + "="*50)
    print("✅ 所有logo创建完成！")
    print("\n📁 生成的logo文件：")
    for logo in logos:
        print(f"  - {logo}")
    
    print("\n🎯 下一步：")
    print("1. 上传这些logo到你的Shopify店铺")
    print("2. 在主题设置中配置logo显示")
    print("3. 测试logo在不同页面的显示效果")
    
    return logos

def create_logo_usage_guide():
    """创建logo使用指南"""
    guide = """
# Éclat Doréa Collection Logo 使用指南

## 📁 可用的Logo文件

### 主Logo (400×120px)
- **文件**: `logo_main.png`
- **用途**: 品牌主标识，正式场合使用
- **位置**: 首页英雄区域，重要宣传材料

### 页眉Logo (200×60px)  
- **文件**: `logo_header.png`
- **用途**: 网站顶部导航栏
- **位置**: 所有页面的页眉区域

### 页脚Logo (120×40px)
- **文件**: `logo_footer.png`
- **用途**: 网站底部标识
- **位置**: 页脚区域，联系方式旁边



### 简化版Logo (100×40px)
- **文件**: `logo_simple.png`
- **用途**: 小尺寸应用
- **位置**: 移动端导航，邮件签名



### 竖版Logo (120×200px)
- **文件**: `logo_vertical.png`
- **用途**: 特殊布局需求
- **位置**: 侧边栏，产品标签



### Favicon (32×32px)
- **文件**: `logo_favicon.png`
- **用途**: 浏览器标签图标
- **位置**: 所有页面浏览器标签页

## 🚀 上传到Shopify

### 步骤1: 登录Shopify后台
1. 访问 `https://eclat-dorea.myshopify.com/admin`
2. 输入你的登录凭据

### 步骤2: 进入主题设置
1. 点击左侧菜单的 "Online Store"
2. 选择 "Themes"
3. 点击当前主题的 "Customize" 按钮

### 步骤3: 上传Logo
1. 在主题编辑器中，找到 "Brand Identity & Logo" 部分
2. 点击 "Main logo image" 上传按钮
3. 选择 `logo_main.png`
4. 调整设置：
   - Logo max width: 200px
   - Logo max height: 60px
   - Enable hover effects: Yes

### 步骤4: 上传其他变体（可选）
1. **页脚Logo**: 上传 `logo_footer.png`
2. **Favicon**: 上传 `logo_favicon.png`

## 🎨 Logo设计说明

### 颜色方案
- **主金色**: #CA8A04 - 温暖优雅的黄金色
- **深金色**: #D4AF37 - 经典金色调
- **透明背景**: 适应各种页面背景

### 字体设计
- **大号字体**: 突出品牌名称 "ÉCLAT DORÉA"
- **小号字体**: 显示产品线 "collection"
- **简洁排版**: 便于识别和记忆

### 品牌一致性
- 所有logo使用相同的颜色和字体风格
- 不同尺寸适配不同用途
- 金色主题突出珠宝奢侈品定位

## 🔧 技术规格

### 文件格式
- 格式: PNG (Portable Network Graphics)
- 位深度: 32-bit (RGBA)
- 压缩: 无损压缩
- 透明度: Alpha通道支持

### 尺寸标准
- 主Logo: 400×120px (推荐尺寸)
- 页眉Logo: 200×60px (实际使用尺寸)
- 页脚Logo: 120×40px
- Favicon: 32×32px (标准尺寸)

### SEO优化
- Alt文本: "Éclat Doréa Collection - Luxury Gold Jewelry"
- 文件名: 描述性，包含品牌关键词
- 文件大小: 优化加载速度

## 🧪 测试建议

### 视觉测试
1. **不同背景**: 在浅色和深色背景上测试
2. **响应式**: 在各种设备尺寸下查看
3. **颜色对比**: 确保在所有背景下清晰可见
4. **悬停效果**: 验证动画流畅性

### 功能测试
1. **链接功能**: 点击logo应返回首页
2. **加载速度**: 检查logo加载时间
3. **可访问性**: Alt文本正确，键盘导航可用
4. **打印样式**: 打印页面时logo正常显示



## 📞 支持与反馈

### 问题报告
如遇问题，请提供：
1. 问题描述和截图
2. 浏览器和设备信息
3. Shopify主题版本
4. 复现步骤


### Logo更新
如需更新logo设计：
1. 提供新的设计文件
2. 说明更新需求
3. 测试更新后的显示效果


### 联系方式
- Shopify主题设置中的品牌配置部分
- 主题开发文档
- 设计系统指南



---

**最后更新**: 2026年3月29日  
**品牌名称**: Éclat Doréa collection  
**店铺地址**: eclat-dorea.myshopify.com  
**主题版本**: 2.0.0 (Luxury Gold Jewelry Theme)


**设计原则**: 法国奢华风格，金色珠宝主题，品牌一致性优先
    """
    
    with open("LOGO_USAGE_GUIDE.md", "w", encoding="utf-8") as f:
        f.write(guide)
    
    print("✅ 创建了Logo使用指南: LOGO_USAGE_GUIDE.md")
    return "LOGO_USAGE_GUIDE.md"

if __name__ == "__main__":
    print("🎨 开始创建Éclat Doréa collection品牌logo系列")
    print("="*60)
    
    # 创建logo文件
    logos = create_all_logo_variants()
    
    # 创建使用指南
    guide_file = create_logo_usage_guide()
    
    print("\n" + "="*60)
    print("🎉 Logo创建完成！")
    print(f"📁 总计创建 {len(logos)} 个logo文件")
    print(f"📚 使用指南: {guide_file}")
    print("\n🚀 下一步：")
    print("1. 查看生成的logo文件")
    print("2. 按照指南上传到Shopify")
    print("3. 配置主题设置")
    print("4. 测试显示效果")
    