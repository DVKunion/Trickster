<h1 align="center"> 🃏Trickster - 白嫖临时主机 </h1>

<p align="center"> 中文文档 | <a href="README_EN.md">English</a> </p>

<p align="center"> <b> Trickster 简介</b> </p>

> Collie Trickster 正式更名 Trickster
> 我们的目标就是 **免费** 获取 **可使用的** 各类机器
> 不装了，👴摊牌了，👴就是想要白嫖机器

![](https://dvkunion.oss-cn-shanghai.aliyuncs.com/Trickster/686a83148700e41b5a11f68c3d606fdb1804f934.jpg)

遇到反弹 shell 时，发现 vps 又过期了？

想测试一些不好的东西，手头又没有虚拟机？自己开虚拟机还需要做快照做防护？

此时好想要一台临时可用的主机，用完就丢掉不需要后续的管理。

Trickster 基于 Github Action 触发器，让你一个 curl 请求打过来，立刻获取一个临时的主机。

## 🧑‍🤝‍🧑 友情提示

**# 关于风险**

> 智者说过，天下没有免费的午餐，免费的往往可能是最贵的。  
> 此项目属于利用各种资源和方式，尽最大可能薅一点点羊毛。  
> 账户是属于你个人的宝贵资产，富哥和号宝党可以忽略此项目。

## 🎮 快速开始

### 主要步骤

1. 注册百川-使用牧云主机管理助手  
![](https://dvkunion.oss-cn-shanghai.aliyuncs.com/Trickster/ac7ea656b4324c73801181ebd0b525d9.png)
2. 点击绑定主机  
![](https://dvkunion.oss-cn-shanghai.aliyuncs.com/Trickster/1afd640a149d4fce965c2c2c5ced1c23.png)
3. 获取百川 token  
url 的结尾参数即为你的 百川token。
4. fork 本仓库到你自己的账户下  
方便你自己触发 CI 实现自动化。  
5. 生成 github token  
参考 [Github Token](https://github.com/settings/tokens/) ，生成一个 token 作为认证用；
6. 请求接口

此处提供一个curl请求示例，发送该请求即可快速上线一台主机。

```shell
curl \     
-X POST \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer <YOUR_GITHUB_ACTION>"\
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/<YOUR_CI_FILE>/dispatches \
-d '{"ref":"main","inputs":{"token":"<YOUR_TOKEN>","type": "linux"}'
```

其中:
+ <YOUR_GITHUB_ACTION>: github配置的token认证
+ <YOUR_GITHUB_USER_NAME>: 你github账户名称
+ <YOUR_CI_FILE>: 要执行的脚本，为`.github/workflows/` 目录下的文件，如: `github_linux_ubuntu.yaml` 表示此次请求上线的是来自github的linux类型ubuntu主机
+ <YOUR_GITHUB_REPOS>: 你fork的仓库名，一般直接fork的就写`Trickster`即可。
+ <YOUR_TOKEN>: 长亭牧云主机助手生成的那个Token。

这样，每发起一次请求，就会执行一次CI。成功上线一台主机。

> url为 `https://api.github.com/repos/<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/<YOUR_CI_FILE>.yml/dispatches` 时  
> 触发的对象为 <YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/<YOUR_CI_FILE>  
> 同时在http请求里， 替换请求体的json参数： `'{"ref":"main","inputs":{"token":"<YOUR_TOKEN>"}'`

7. 主机助手绑定通知，即可在主机上线时收到消息


## 💻 目前主机列表


## 🎈 更有趣的玩法

如果你有什么更加有趣的想法或建议，欢迎提交 Issue/Pr

## ⌨️ 分享你的资源

如果你有更好的白嫖主机方案，并希望分享给更多的小伙伴，欢迎提交 ISSUE

如果你具备一定的 CI 开发能力，也欢迎直接提交 PR， 在 `.github/workflows` 中直接加入对应的ci资源。

## ✨ 动动小手支持一下

都看到这了，点一个star吧～
