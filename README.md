# 幸运转盘

趣味抽奖网页：自定义选项、热土豆炸弹动画、历史记录与收藏预设，带完整音效。

## 在线访问

https://jfbfb.github.io/lucky-wheel/

## 更新网站

在项目目录打开终端，执行：

```powershell
.\update.ps1
```

或带提交说明：

```powershell
.\update.ps1 "修复按钮音效"
```

也可双击 `update.bat`。脚本会自动 `git add`、提交并推送到 GitHub，Pages 约 1~2 分钟后更新。

## 本地运行

双击 [index.html](index.html)，或用本地服务器打开：

```bash
npx --yes serve .
```

## 功能

- 自定义选项、快速生成 1~N
- 约 5 秒紧张抽奖动画
- 最近 10 条历史记录
- 收藏方案（localStorage）
- 背景音乐《好运来》循环播放（见下方配置）
- 背景音乐与音效独立开关、可调音量（右上角）

## 背景音乐

1. 将音频文件命名为 `haoyunlai.mp3` 或 `haoyunlai.ogg`
2. 放入 [audio/](audio/) 目录
3. 运行 `.\update.ps1` 更新网站

详见 [audio/README.md](audio/README.md)。
