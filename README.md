# Aseprite_Compile_BatchScripts
This personal note documents the process of compiling and building a pixel art drawing tool, Aseprite, with core content focusing on automated compilation of Aseprite source code using CMake through Windows batch scripting.     
----------
>- Should any copyright infringement be identified, the author will promptly remove this content.
     
## __使用说明__
1. 一台x64的PC :yum: （其他平台的还未测试）
2. 下载适合版本[CMake](https://github.com/Kitware/CMake/releases "站内下载")并配置环境变量
3. 安装[VS2022](https://visualstudio.microsoft.com/zh-hans/downloads/ "官网下载")并选择C++桌面开发工作负荷、Windows 10 SDK (10.0.18362.0)
4. git克隆Aseprite[项目](https://github.com/aseprite/aseprite.git "ULR to Clone")或直接下载项目release[压缩包](https://github.com/aseprite/aseprite/releases "项目源码")（推荐）
5. 下载合适版本[Ninja](https://github.com/ninja-build/ninja/releases "站内下载")并配置系统变量
6. 下载合适版本的专供[Skia库](https://github.com/aseprite/skia/releases "站内下载")
7. 将Aseprite源码、Ninja工具、Skia库解压分文件夹放置于同一工作目录中
8. 将`build.bat`脚本同样置于工作目录下，并视情况修改由注释标记区域的变量路径
   > (大概只需修改解压后不同文件目录名 :sweat_drops::sweat_drops::sweat_drops:)

9. 以 *__管理员__* 身份运行.bat脚本
10. 编译完成后文件写入工作目录下build文件夹

---------
<strong>支持[原项目](https://github.com/aseprite/aseprite "Aseprite")!</strong> :thumbsup::thumbsup::thumbsup:
> [Store](https://store.steampowered.com/app/431730/Aseprite/ "补票")
