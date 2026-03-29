# 📥 从腾讯云服务器下载Éclat Doréa主题指南

## 🖥️ 服务器信息
- **服务器IP**: 43.133.181.95
- **用户名**: root
- **文件路径**: `/root/.openclaw/workspace/shopify-custom-theme-template/eclat-dorea-manual.zip`
- **文件大小**: 25.16KB

## 📋 下载方法

### 方法1：SCP下载（Mac/Linux/Windows Git Bash）
```bash
# 在你的本地电脑上运行：
scp root@43.133.181.95:/root/.openclaw/workspace/shopify-custom-theme-template/eclat-dorea-manual.zip ~/Downloads/
```
**需要输入服务器root密码**

### 方法2：使用WinSCP（Windows用户）
1. 下载并安装 WinSCP：https://winscp.net/
2. 新建会话：
   - 文件协议：SCP
   - 主机名：43.133.181.95
   - 端口：22
   - 用户名：root
   - 密码：你的服务器密码
3. 连接后导航到：
   `/root/.openclaw/workspace/shopify-custom-theme-template/`
4. 下载 `eclat-dorea-manual.zip`

### 方法3：使用FileZilla
1. 下载 FileZilla：https://filezilla-project.org/
2. 连接设置：
   - 主机：sftp://43.133.181.95
   - 用户名：root
   - 密码：你的服务器密码
   - 端口：22
3. 下载ZIP文件

### 方法4：命令行快速下载
```bash
# 如果你有curl和ssh访问权限，可以使用：
ssh root@43.133.181.95 "cat /root/.openclaw/workspace/shopify-custom-theme-template/eclat-dorea-manual.zip" > eclat-dorea-manual.zip
```

## 🚀 下载后步骤

### 第1步：验证下载的文件
```bash
# 检查文件大小
ls -lh eclat-dorea-manual.zip

# 检查文件内容
unzip -l eclat-dorea-manual.zip | head -10
```

### 第2步：上传到Shopify
1. 访问：https://eclat-dorea.myshopify.com/admin
2. Online Store → Themes → Upload theme
3. 选择下载的 `eclat-dorea-manual.zip`
4. 点击 Upload

### 第3步：发布主题
1. 上传完成后找到 "Custom Gold Jewelry Theme"
2. 点击 Actions → Publish
3. 确认发布

## 🔧 备选方案

### 如果SCP无法连接
1. **检查防火墙**：确保22端口开放
2. **验证IP地址**：确认服务器IP正确
3. **使用密码**：确保使用正确的root密码

### 快速解决方案
如果无法下载，可以：
1. **重新生成ZIP文件**：在服务器上重新打包
2. **使用CloudFlare Pages**：上传到临时存储
3. **GitHub仓库**：创建私有仓库上传

## 📞 技术支持

### 下载问题
如遇下载问题：
1. **连接问题**：检查网络和防火墙
2. **权限问题**：确认有服务器访问权限
3. **文件问题**：重新生成ZIP文件

### 上传问题
如遇上传问题：
1. **文件格式**：确保是ZIP格式
2. **文件大小**：不超过50MB
3. **Shopify限制**：检查主题上传限制

## 🎯 立即行动

### 推荐步骤：
1. **使用SCP下载**：最快的方法
2. **验证文件完整性**：确保下载完整
3. **立即上传Shopify**：完成主题部署

### 预期时间：
- **下载时间**：10-30秒
- **上传时间**：1-2分钟
- **总时间**：3-5分钟

---

**立即开始下载**：
```bash
scp root@43.133.181.95:/root/.openclaw/workspace/shopify-custom-theme-template/eclat-dorea-manual.zip ~/Downloads/
```

**店铺后台**：https://eclat-dorea.myshopify.com/admin  
**文件已准备**：eclat-dorea-manual.zip  
**主题版本**：Luxury Gold Jewelry Theme v2.0