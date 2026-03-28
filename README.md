# Shopify Custom Theme Template

一个现代化的Shopify定制主题模板，采用模块化设计和最佳实践。

## 🎯 功能特性

- ✅ 响应式设计，支持移动端和桌面端
- ✅ 模块化组件架构
- ✅ SEO友好结构
- ✅ 高性能优化
- ✅ 易于定制和扩展
- ✅ 多语言支持
- ✅ 可访问性(A11y)优化

## 🚀 快速开始

### 环境要求
- Node.js 14.0+
- Shopify CLI 3.0+
- Git

### 安装步骤

1. **克隆仓库**
```bash
git clone https://github.com/YOUR_USERNAME/shopify-custom-theme-template.git
cd shopify-custom-theme-template
```

2. **安装依赖**
```bash
npm install
```

3. **连接到Shopify商店**
```bash
shopify theme dev --store YOUR_STORE_NAME
```

4. **开始开发**
```bash
npm run dev
```

## 📁 项目结构

```
shopify-custom-theme-template/
├── assets/              # 静态资源
│   ├── css/            # 样式文件
│   ├── js/             # JavaScript文件
│   └── images/         # 图片资源
├── config/             # 配置文件夹
│   ├── settings_schema.json
│   └── settings_data.json
├── layout/             # 布局文件
│   └── theme.liquid
├── locales/            # 多语言文件
│   ├── en.default.json
│   └── zh-CN.json
├── sections/           # 模块化组件
│   ├── header.liquid
│   ├── footer.liquid
│   ├── hero.liquid
│   └── featured-collection.liquid
├── snippets/           # 可复用代码片段
│   ├── product-card.liquid
│   └── icon.liquid
├── templates/          # 页面模板
│   ├── index.json
│   ├── product.json
│   ├── collection.json
│   └── page.json
├── .gitignore          # Git忽略文件
├── package.json        # NPM配置
└── README.md           # 项目说明
```

## 🛠️ 开发指南

### 创建新组件
1. 在 `sections/` 目录下创建新的 `.liquid` 文件
2. 在模板文件中引用该组件
3. 在 `config/settings_schema.json` 中添加配置选项

### 添加样式
- 全局样式: `assets/css/global.css`
- 组件样式: 在对应的 `.liquid` 文件中使用 `<style>` 标签
- 使用CSS变量确保一致性

### 添加脚本
- 全局脚本: `assets/js/global.js`
- 组件脚本: 在对应的 `.liquid` 文件中使用 `<script>` 标签
- 使用ES6模块化

## 🎨 主题定制

### 颜色系统
主题使用CSS变量定义颜色，可以在 `assets/css/global.css` 中修改：

```css
:root {
  --color-primary: #3a3a3a;
  --color-secondary: #717171;
  --color-accent: #d4af37;
  --color-background: #ffffff;
  --color-text: #333333;
}
```

### 字体设置
默认使用系统字体栈，支持自定义字体：

```liquid
{% style %}
  :root {
    --font-heading: 'Helvetica Neue', Arial, sans-serif;
    --font-body: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  }
{% endstyle %}
```

## 🔧 配置选项

### 主题设置
通过 `config/settings_schema.json` 配置主题选项：

- 颜色方案
- 字体设置
- 布局选项
- 社交链接
- 页脚信息

### 多语言支持
主题支持多语言，翻译文件位于 `locales/` 目录：

1. 复制 `en.default.json` 为新语言文件
2. 翻译所有键值对
3. 在Shopify后台设置商店语言

## 🚀 部署

### 开发环境
```bash
npm run dev
```

### 构建生产版本
```bash
npm run build
```

### 部署到Shopify
```bash
shopify theme push
```

## 📊 性能优化

### 图片优化
- 使用Shopify图片CDN
- 实现懒加载
- 使用WebP格式（支持时）

### 代码分割
- 按需加载JavaScript
- 关键CSS内联
- 第三方库异步加载

### 缓存策略
- 静态资源长期缓存
- API响应适当缓存
- 使用Service Worker

## 🧪 测试

### 浏览器兼容性
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

### 设备测试
- 移动端 (320px - 768px)
- 平板 (768px - 1024px)
- 桌面端 (1024px+)

## 🤝 贡献指南

1. Fork 仓库
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📝 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 🙏 致谢

- Shopify 官方文档
- Liquid 模板语言
- 所有贡献者

## 📞 支持

遇到问题？请：
1. 查看 [Issues](https://github.com/YOUR_USERNAME/shopify-custom-theme-template/issues)
2. 创建新的 Issue
3. 查看 Wiki 文档

---

**Happy Coding! 🎉**