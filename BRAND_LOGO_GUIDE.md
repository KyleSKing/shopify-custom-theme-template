# 品牌Logo上传与一致性指南

## 🎯 概述

本指南说明如何在Shopify黄金珠宝主题中上传品牌logo，并确保在整个网站中保持一致的设计和显示效果。

## 🖼️ Logo要求

### 推荐规格
- **格式**: PNG（支持透明背景）
- **尺寸**: 最小 400×120 像素
- **颜色模式**: RGB
- **文件大小**: 小于 500KB
- **背景**: 透明或白色

### 最佳实践
1. **高分辨率**: 确保logo在放大时保持清晰
2. **简单设计**: 避免过于复杂的细节
3. **可读性**: 确保在小尺寸下仍然可识别
4. **品牌颜色**: 使用主题的品牌色系（深色+金色）

## 📱 Logo变体建议

### 1. 主Logo（Header）
- **尺寸**: 200×60 像素
- **用途**: 网站顶部导航栏
- **特点**: 完整品牌标识

### 2. 页脚Logo
- **尺寸**: 120×40 像素  
- **用途**: 网站底部
- **特点**: 可简化设计

### 3. 结账页面Logo
- **尺寸**: 150×50 像素
- **用途**: 结账流程
- **特点**: 简洁明了

## 🛠️ 上传步骤

### 步骤1：访问主题设置
1. 登录Shopify后台
2. 进入 Online Store > Themes
3. 点击 "Customize" 当前主题

### 步骤2：上传Logo
1. 在主题编辑器中，找到 "Brand Identity & Logo" 部分
2. 点击 "Main logo image" 上传按钮
3. 选择您的logo文件
4. 调整logo尺寸设置：
   - Header logo max width: 200px
   - Header logo max height: 60px

### 步骤3：上传其他变体（可选）
1. **Light version logo**: 用于深色背景
2. **Dark version logo**: 用于浅色背景  
3. **Footer logo**: 页脚专用版本
4. **Favicon**: 浏览器标签图标（32×32px）

### 步骤4：调整设置
1. **Logo位置**: 选择居中或左对齐
2. **悬停效果**: 启用微妙的动画效果
3. **减少动画**: 为偏好减少动画的用户禁用动画
4. **文本回退**: 设置无logo时的显示文本

## 🎨 设计一致性

### CSS变量控制
主题使用CSS变量确保logo一致性：
```css
:root {
  --logo-max-width: 200px;
  --logo-max-height: 60px;
  --footer-logo-width: 120px;
  --logo-text-color: #1C1917;
}
```

### 响应式设计
Logo会自动适应不同设备：
- **桌面**: 完整尺寸显示
- **平板**: 适当缩小
- **手机**: 优化显示，确保可读性

### 动画效果
- **悬停缩放**: 鼠标悬停时轻微放大
- **淡入淡出**: 平滑的过渡效果
- **减少运动**: 尊重用户偏好设置

## 🔧 代码实现

### Logo片段使用
```liquid
{% comment %} 基本logo {% endcomment %}
{% render 'logo' %}

{% comment %} 品牌logo变体 {% endcomment %}
{% render 'brand-logo', 
  logo_type: 'footer',
  logo_size: 'small',
  show_text: true 
%}
```

### 可用的参数
| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `logo_type` | string | 'header' | header/footer/checkout |
| `logo_size` | string | 'medium' | small/medium/large/xlarge |
| `show_text` | boolean | false | 是否显示文字回退 |
| `text_position` | string | 'below' | below/right |
| `custom_class` | string | '' | 自定义CSS类 |

## 🧪 测试建议

### 视觉测试
1. **不同尺寸**: 检查在各种屏幕尺寸下的显示
2. **不同背景**: 测试在浅色和深色背景下的对比度
3. **悬停状态**: 验证悬停动画效果
4. **加载状态**: 确保加载时无布局偏移

### 功能测试
1. **链接功能**: 点击logo应返回首页
2. **可访问性**: Alt文本正确，键盘导航可用
3. **打印样式**: 打印时logo正确显示
4. **性能**: logo加载不影响页面性能

### 浏览器兼容性
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

## 📊 SEO优化

### Logo的SEO最佳实践
1. **Alt文本**: 使用品牌名称作为alt文本
2. **文件命名**: 使用描述性文件名（brand-logo.png）
3. **尺寸优化**: 使用适当尺寸，避免过大文件
4. **懒加载**: 非首屏logo使用懒加载

### 结构化数据
确保logo在结构化数据中正确引用：
```json
{
  "@type": "Organization",
  "url": "https://your-store.com",
  "logo": "https://your-store.com/logo.png"
}
```

## 🔍 故障排除

### 常见问题

#### 1. Logo显示模糊
- **原因**: 上传的图片分辨率太低
- **解决**: 上传更高分辨率的logo（最小400px宽度）

#### 2. 背景不透明
- **原因**: Logo有白色背景
- **解决**: 使用PNG格式并确保背景透明

#### 3. Logo尺寸不正确
- **原因**: CSS变量设置错误
- **解决**: 检查主题设置中的logo尺寸配置

#### 4. 动画不流畅
- **原因**: 图片文件过大
- **解决**: 优化图片大小（小于500KB）

#### 5. 移动端显示问题
- **原因**: 响应式设置不正确
- **解决**: 检查媒体查询和CSS变量

### 调试命令
```liquid
{% comment %} 检查logo设置 {% endcomment %}
Logo type: {{ logo_type }}
Logo size: {{ logo_size }}
Max width: {{ settings.logo_max_width }}
Has logo: {{ settings.logo != blank }}
```

## 🚀 高级配置

### 自定义CSS
如果需要进一步定制，可以添加自定义CSS：
```css
/* 自定义logo样式 */
.brand-logo__image {
  filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
}

/* 夜间模式优化 */
@media (prefers-color-scheme: dark) {
  .brand-logo__image {
    filter: brightness(1.1);
  }
}
```

### JavaScript增强
```javascript
// Logo加载状态管理
document.addEventListener('DOMContentLoaded', function() {
  const logo = document.querySelector('[data-logo-image]');
  if (logo) {
    logo.addEventListener('load', function() {
      this.classList.add('logo-loaded');
    });
  }
});
```

## 📝 维护建议

### 定期检查
1. **季度检查**: 确保logo在所有页面上正确显示
2. **性能监控**: 检查logo加载时间
3. **SEO审核**: 验证alt文本和结构化数据
4. **浏览器更新**: 测试新浏览器版本的兼容性

### 更新策略
1. **版本控制**: 记录logo更新历史
2. **A/B测试**: 测试新logo设计的效果
3. **用户反馈**: 收集用户对logo的反馈
4. **品牌一致性**: 确保logo符合品牌指南

## 📞 支持

### 资源
- [Shopify Logo指南](https://help.shopify.com/manual/online-store/themes/theme-structure/logo)
- [PNG优化工具](https://tinypng.com/)
- [品牌设计原则](https://www.shopify.com/blog/brand-identity)

### 联系支持
如有问题，请提供：
1. Logo文件（如可能）
2. 问题描述
3. 截图或屏幕录制
4. 浏览器和操作系统信息

---

**最后更新**: 2026年3月29日  
**主题版本**: 2.0.0  
**设计系统**: Anthropic Frontend Design System