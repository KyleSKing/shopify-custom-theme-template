# Éclat Doréa Collection Logo 上传指南

## 🎯 快速开始

### 立即上传Logo到你的Shopify店铺：
1. **访问店铺后台**: https://eclat-dorea.myshopify.com/admin
2. **进入主题设置**: Online Store → Themes → Customize
3. **上传主Logo**: Brand Identity → Main logo image

## 📁 Logo文件准备

我已为你创建了以下logo设计方案：

### 方案A: 经典豪华版 (推荐)
```
ÉCLAT DORÉA
collection
```
- **颜色**: 金色渐变 (#CA8A04 → #D4AF37)
- **字体**: Cormorant (法式优雅衬线体)
- **适合**: 主logo，正式品牌标识

### 方案B: 简约现代版
```
ÉD
collection
```
- **颜色**: 纯金色 (#CA8A04)
- **字体**: Montserrat (现代无衬线体)
- **适合**: 小尺寸应用，页脚logo

### 方案C: 艺术装饰版
```
Éclat Doréa
✦ collection ✦
```
- **颜色**: 深褐色+金色 (#1C1917 + #CA8A04)
- **字体**: Playfair Display (艺术装饰风格)
- **适合**: 包装，宣传材料

## 🖼️ 如何获取Logo文件

### 选项1: 使用在线工具创建
1. 访问 [Canva](https://www.canva.com/) 或 [LogoMakr](https://logomakr.com/)
2. 选择 "Create a Logo"
3. 输入文本: "ÉCLAT DORÉA" (第一行) 和 "collection" (第二行)
4. 选择金色配色 (#CA8A04)
5. 下载为PNG格式 (400×120px)

### 选项2: 使用Photoshop或设计软件
1. 创建新文件: 400×120像素，透明背景
2. 添加文本层: "ÉCLAT DORÉA" - 字体大小 36pt，金色
3. 添加文本层: "collection" - 字体大小 18pt，深金色
4. 居中排列文本
5. 导出为PNG

### 选项3: 使用AI生成工具
1. 访问 [Looka](https://looka.com/) 或 [DesignEvo](https://www.designevo.com/)
2. 输入品牌名: "Éclat Doréa Collection"
3. 选择行业: "Jewelry" 或 "Luxury"
4. 选择金色和深色配色方案
5. 下载高清logo

## 🚀 Shopify上传步骤详解

### 步骤1: 登录Shopify后台
```
URL: https://eclat-dorea.myshopify.com/admin
用户名: [你的用户名]
密码: [你的密码]
```

### 步骤2: 进入主题编辑器
1. 点击左侧菜单 "Online Store"
2. 选择 "Themes"
3. 找到当前使用的主题
4. 点击 "Customize" 按钮

### 步骤3: 上传主Logo
1. 在左侧面板找到 "Brand Identity & Logo" 部分
2. 点击 "Main logo image" 旁边的上传按钮
3. 选择你的logo文件 (建议400×120px PNG)
4. 等待上传完成

### 步骤4: 调整Logo设置
```
Logo max width: 200px
Logo max height: 60px
Center logo: No (保持左对齐)
Enable hover effects: Yes
Hover animation: Scale
Respect reduced motion: Yes
Show text fallback: Yes
```

### 步骤5: 上传其他Logo变体 (可选)
1. **页脚Logo**: 上传 `logo_footer.png` (120×40px)
2. **Favicon**: 上传 `logo_favicon.png` (32×32px)
3. **结账Logo**: 上传 `logo_checkout.png` (150×50px)

### 步骤6: 保存并发布
1. 点击右上角 "Save" 按钮
2. 确认更改已保存
3. 点击 "Publish" 发布主题
4. 查看前台效果

## 🎨 主题配色设置

### 颜色配置建议
```
Primary color: #1C1917 (Premium Dark)
Secondary color: #44403C (Medium Dark)
Accent color: #CA8A04 (Gold)
Background color: #FAFAF9 (Light)
Text color: #0C0A09 (Dark)
```

### 字体设置建议
```
Heading font: Cormorant (法式优雅)
Body font: Montserrat (现代易读)
Base font size: 16px
Font scale ratio: 1.25
```

## 🔧 技术配置

### CSS变量控制
你的主题已经配置了以下CSS变量：
```css
:root {
  --logo-max-width: 200px;
  --logo-max-height: 60px;
  --footer-logo-width: 120px;
  --logo-text-color: #1C1917;
}
```

### Liquid代码片段
主题包含两个logo组件：
1. **`logo.liquid`** - 基础logo显示
2. **`brand-logo.liquid`** - 高级变体支持

使用示例：
```liquid
{% comment %} 在页眉使用logo {% endcomment %}
{% render 'logo' %}

{% comment %} 在页脚使用小尺寸logo {% endcomment %}
{% render 'brand-logo', 
  logo_type: 'footer',
  logo_size: 'small'
%}
```

## 🧪 测试检查清单

### 上传后必测项
- [ ] Logo在桌面端正确显示
- [ ] Logo在移动端正确显示
- [ ] Logo点击返回首页
- [ ] 悬停动画效果正常
- [ ] 页面加载速度正常
- [ ] 深色模式下logo可见
- [ ] 打印页面时logo正常

### 高级测试项
- [ ] 不同浏览器兼容性
- [ ] 屏幕阅读器可访问性
- [ ] 页面性能影响
- [ ] SEO优化检查
- [ ] 社交媒体分享预览

## 📱 响应式显示

### 不同设备显示效果
- **桌面端 (1024px+)**: 完整logo，200px宽度
- **平板 (768px-1024px)**: 适当缩小，160px宽度
- **手机 (480px-768px)**: 优化显示，120px宽度
- **小手机 (<480px)**: 最小尺寸，80px宽度

### Logo适配规则
1. **最大宽度限制**: 防止logo过大
2. **高度自动比例**: 保持原比例
3. **居中显示选项**: 可选居中或左对齐
4. **文本回退**: 无logo时显示品牌名

## 🔍 故障排除

### 常见问题及解决方案

#### 问题1: Logo显示模糊
**原因**: 上传的图片分辨率太低
**解决**: 
1. 使用更高分辨率的logo (最小400px宽度)
2. 使用PNG格式保存
3. 避免过度压缩

#### 问题2: 背景不透明
**原因**: Logo有白色背景
**解决**:
1. 使用支持透明背景的PNG格式
2. 在设计软件中删除背景
3. 使用在线工具去除背景

#### 问题3: Logo尺寸不正确
**原因**: CSS变量设置错误
**解决**:
1. 检查主题设置中的logo尺寸
2. 调整 --logo-max-width 变量
3. 清除浏览器缓存

#### 问题4: 动画不流畅
**原因**: 图片文件过大
**解决**:
1. 优化logo文件大小 (<200KB)
2. 禁用不必要的动画效果
3. 检查浏览器性能

#### 问题5: 移动端显示问题
**原因**: 响应式设置不正确
**解决**:
1. 检查媒体查询设置
2. 调整移动端logo尺寸
3. 测试不同设备

## 🚀 高级功能

### Logo动画效果
你的主题支持以下动画：
- **悬停缩放**: 鼠标悬停时轻微放大
- **淡入淡出**: 平滑的透明度变化
- **黄金光芒**: 金色渐变效果
- **减少运动**: 尊重用户偏好

### 多版本支持
- **亮色版**: 用于深色背景
- **深色版**: 用于亮色背景
- **简化版**: 小尺寸应用
- **全文字版**: SEO优化

### SEO优化建议
1. **Alt文本**: "Éclat Doréa Collection - Luxury Gold Jewelry"
2. **文件名**: eclat-dorea-collection-logo.png
3. **结构化数据**: 在JSON-LD中包含logo URL
4. **社交媒体**: 设置Open Graph图片

## 📞 即时支持

### 需要立即帮助？
1. **截图问题**: 提供问题截图
2. **描述现象**: 详细说明问题
3. **浏览器信息**: 提供浏览器版本
4. **步骤复现**: 如何重现问题

### 联系信息
- **店铺后台**: https://eclat-dorea.myshopify.com/admin
- **主题文档**: 查看BRAND_LOGO_GUIDE.md
- **设计资源**: 参考logo_designs.md

### 紧急修复
如果logo上传失败：
1. 尝试使用不同的图片格式
2. 检查文件大小限制 (通常<5MB)
3. 清除浏览器缓存
4. 尝试使用隐身模式

## 🎉 完成状态检查

### 成功标志
- [ ] Logo在店铺首页可见
- [ ] 点击logo返回首页
- [ ] 不同页面logo一致
- [ ] 移动端显示正常
- [ ] 加载速度无影响

### 品牌一致性验证
- [ ] Logo颜色匹配品牌色系
- [ ] 字体风格符合品牌定位
- [ ] 所有页面统一显示
- [ ] 响应式适配良好

---

**立即行动**: 
1. 访问 https://eclat-dorea.myshopify.com/admin
2. 进入主题设置
3. 上传你的品牌logo
4. 测试显示效果

**预计时间**: 10-15分钟
**难度级别**: 简单
**所需工具**: 浏览器，logo图片文件

**品牌**: Éclat Doréa collection  
**店铺**: eclat-dorea.myshopify.com  
**主题**: Luxury Gold Jewelry Theme v2.0  
**最后更新**: 2026年3月29日