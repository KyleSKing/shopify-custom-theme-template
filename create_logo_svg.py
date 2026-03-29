#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
创建SVG格式的Éclat Doréa collection品牌logo
不需要PIL库，纯文本SVG生成
"""

def create_svg_logo(filename, width, height, text1, text2=None, font_size1=36, font_size2=18):
    """创建SVG格式的logo"""
    
    # SVG颜色定义
    gold_color = "#CA8A04"  # 主金色
    dark_gold = "#D4AF37"   # 深金色
    background = "transparent"
    
    # 计算文本位置
    if text2:
        # 双行文本
        text1_x = width // 2
        text1_y = height // 2 - font_size1 // 2
        
        text2_x = width // 2
        text2_y = height // 2 + font_size2 + 5
        
        # SVG内容
        svg_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<svg width="{width}" height="{height}" viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg">
  <rect width="{width}" height="{height}" fill="{background}"/>
  <text x="{text1_x}" y="{text1_y}" text-anchor="middle" font-family="Arial, sans-serif" font-size="{font_size1}px" font-weight="bold" fill="{gold_color}">{text1}</text>
  <text x="{text2_x}" y="{text2_y}" text-anchor="middle" font-family="Arial, sans-serif" font-size="{font_size2}px" fill="{dark_gold}">{text2}</text>
</svg>'''
    else:
        # 单行文本
        text_x = width // 2
        text_y = height // 2
        
        svg_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<svg width="{width}" height="{height}" viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg">
  <rect width="{width}" height="{height}" fill="{background}"/>
  <text x="{text_x}" y="{text_y}" text-anchor="middle" dominant-baseline="middle" font-family="Arial, sans-serif" font-size="{font_size1}px" font-weight="bold" fill="{gold_color}">{text1}</text>
</svg>'''
    
    # 保存文件
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(svg_content)
    
    print(f"✅ 创建SVG logo: {filename} ({width}x{height})")
    return filename

def create_all_svg_logos():
    """创建所有SVG logo变体"""
    print("🎨 创建Éclat Doréa collection SVG品牌logo")
    print("="*60)
    
    logos = []
    
    # 1. 主Logo
    logos.append(create_svg_logo(
        filename="logo_main.svg",
        width=400,
        height=120,
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=40,
        font_size2=20
    ))
    
    # 2. 页眉Logo
    logos.append(create_svg_logo(
        filename="logo_header.svg",
        width=200,
        height=60,
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=22,
        font_size2=12
    ))
    
    # 3. 页脚Logo
    logos.append(create_svg_logo(
        filename="logo_footer.svg",
        width=120,
        height=40,
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=16,
        font_size2=10
    ))
    
    # 4. 简化版
    logos.append(create_svg_logo(
        filename="logo_simple.svg",
        width=100,
        height=40,
        text1="ÉD",
        text2=None,
        font_size1=30,
        font_size2=0
    ))
    
    # 5. Favicon
    logos.append(create_svg_logo(
        filename="logo_favicon.svg",
        width=32,
        height=32,
        text1="ÉD",
        text2=None,
        font_size1=18,
        font_size2=0
    ))
    
    # 6. 大尺寸Logo (用于打印)
    logos.append(create_svg_logo(
        filename="logo_large.svg",
        width=800,
        height=240,
        text1="ÉCLAT DORÉA",
        text2="collection",
        font_size1=80,
        font_size2=40
    ))
    
    print("\n" + "="*60)
    print("✅ 所有SVG logo创建完成！")
    
    # 创建转换指南
    create_conversion_guide(logos)
    
    return logos

def create_conversion_guide(logos):
    """创建SVG转PNG指南"""
    guide = """
# SVG Logo 转换与使用指南

## 📁 生成的SVG文件

以下SVG logo文件已创建：

"""
    
    for logo in logos:
        guide += f"- **{logo}** - 矢量格式，可无限缩放\n"
    
    guide += """
## 🚀 如何将SVG转换为PNG

### 方法1: 使用在线转换工具 (推荐)
1. 访问 https://svgtopng.com/
2. 上传你的SVG文件
3. 设置输出尺寸：
   - 主Logo: 400×120px
   - 页眉Logo: 200×60px  
   - 页脚Logo: 120×40px
   - Favicon: 32×32px
4. 下载PNG文件
5. 上传到Shopify

### 方法2: 使用Photoshop或GIMP
1. 打开SVG文件
2. 文件 → 导出 → 导出为...
3. 选择PNG格式
4. 设置尺寸和质量
5. 保存文件

### 方法3: 使用命令行工具
如果你有ImageMagick安装：
```bash
# 安装ImageMagick
sudo apt-get install imagemagick

# 转换SVG到PNG
convert logo_main.svg logo_main.png

# 指定尺寸
convert logo_header.svg -resize 200x60 logo_header.png
```

## 🎨 SVG的优势

### 优点
- **矢量格式**: 无限缩放不失真
- **文件小巧**: 通常比PNG小
- **编辑方便**: 可修改颜色和文字
- **透明背景**: 天然支持透明度

### 在Shopify中使用
1. **直接上传SVG**: Shopify支持SVG格式
2. **更好的清晰度**: 在所有设备上清晰显示
3. **灵活的样式**: 可通过CSS控制颜色

## 🔧 直接使用SVG

### 内嵌SVG代码
```html
<svg width="200" height="60" viewBox="0 0 200 60">
  <text x="100" y="30" text-anchor="middle" font-family="Arial" font-size="22" fill="#CA8A04">ÉCLAT DORÉA</text>
  <text x="100" y="48" text-anchor="middle" font-family="Arial" font-size="12" fill="#D4AF37">collection</text>
</svg>
```

### 作为背景图片
```css
.logo {
  background-image: url('logo_header.svg');
  background-size: contain;
  background-repeat: no-repeat;
  width: 200px;
  height: 60px;
}
```

## 🧪 测试SVG显示

### 浏览器兼容性
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

### 功能测试
1. **缩放测试**: 放大页面检查清晰度
2. **颜色测试**: 在不同背景下显示
3. **打印测试**: 打印页面时的质量
4. **性能测试**: 加载速度影响

## 📱 响应式SVG

### 自适应尺寸
```css
.logo-svg {
  width: 100%;
  max-width: 200px;
  height: auto;
}
```

### 媒体查询调整
```css
@media (max-width: 768px) {
  .logo-svg {
    max-width: 160px;
  }
}

@media (max-width: 480px) {
  .logo-svg {
    max-width: 120px;
  }
}
```

## 🔍 故障排除

### 常见SVG问题
1. **显示不正确**: 检查viewBox设置
2. **字体缺失**: 使用web安全字体或嵌入字体
3. **颜色不对**: 检查fill属性值
4. **尺寸错误**: 确认width和height属性

### 解决方案
1. **简化SVG**: 移除不必要的元素
2. **嵌入字体**: 使用@font-face引入字体
3. **优化代码**: 使用SVG优化工具
4. **测试多浏览器**: 确保跨浏览器兼容

## 🚀 立即行动步骤

### 快速开始
1. **下载SVG文件**: 使用上面生成的SVG文件
2. **转换到PNG**: 使用在线工具转换
3. **上传到Shopify**: 按照上传指南操作
4. **测试显示**: 在不同设备上测试

### 高级选项
1. **直接使用SVG**: 上传SVG文件到Shopify
2. **自定义样式**: 修改SVG颜色和字体
3. **动画效果**: 添加CSS动画到SVG
4. **交互功能**: 添加JavaScript交互

## 📞 技术支持

### 需要帮助？
1. **SVG编辑**: 推荐使用Inkscape (免费)
2. **在线工具**: SVGOMG (SVG优化)
3. **转换服务**: CloudConvert (多格式转换)
4. **设计资源**: Flaticon (SVG图标资源)

### 紧急问题
如果SVG无法显示：
1. 检查文件编码 (必须是UTF-8)
2. 验证XML语法是否正确
3. 尝试简化SVG结构
4. 使用不同的浏览器测试

---

**SVG文件优势**: 高清、可缩放、文件小  
**转换工具**: 免费在线工具可用  
**Shopify支持**: 完全支持SVG格式  
**品牌**: Éclat Doréa collection  

**立即开始**: 
1. 查看生成的SVG文件
2. 转换为PNG格式
3. 上传到你的Shopify店铺
4. 享受高清品牌logo
"""
    
    with open("SVG_CONVERSION_GUIDE.md", "w", encoding="utf-8") as f:
        f.write(guide)
    
    print("📚 创建了SVG转换指南: SVG_CONVERSION_GUIDE.md")
    return "SVG_CONVERSION_GUIDE.md"

def main():
    print("🎨 Éclat Doréa Collection Logo 生成系统")
    print("="*60)
    
    # 创建SVG logo文件
    logos = create_all_svg_logos()
    
    print("\n🎉 完成！")
    print(f"📁 创建了 {len(logos)} 个SVG logo文件")
    print("\n🚀 下一步操作：")
    print("1. 查看生成的SVG文件")
    print("2. 阅读SVG_CONVERSION_GUIDE.md转换指南")
    print("3. 转换为PNG格式（如需）")
    print("4. 上传到 eclat-dorea.myshopify.com")
    print("\n💡 提示：SVG格式可直接上传到Shopify，无需转换！")

if __name__ == "__main__":
    main()