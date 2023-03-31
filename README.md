<h1 align="center"> Collie-Trickster </h1>

<p align="center">通过 GitHub Action 白嫖国外主机。[狗头] </p>

<p align="center"> 中文文档 | <a href="README_EN.md">English</a> </p>

<p align="center"> <b>Collie-Trickster 简介</b> </p>

Collie-Trickster 基于 牧云主机助手 (Collie) 实现的Github Action。主要用于更便捷的使用和Debug Github Action。

目前支持了：
+ linux ci环境 通过 `手动推送`/`HTTP请求触发` 注册到牧云主机助手，并可以通过牧云主机助手卸载来完成ci。
+ windows主机支持(等待牧云开放接口，脚本已支持)

## 🧑‍🤝‍🧑 友情提示

**# 关于风险**

> 其实大家都知道所谓 "白嫖国外主机" 不过是个噱头 -_-
>
> 首先持续的时常只有 6小时，当然你也可以自己进行一些自动化开发来保持一个持久化的状态，但是不鼓励这样使用，毕竟官方的action说明中提出了明令禁止的用法。
>
> 其次，该工具的目的在于开启`github action`调试的方案。  
> 用过`gitlab-ci`的人可能会知道，`debug`模式可以直接进入到ci环境中的终端进行人工`debug`，在一些复杂的ci运行出现错误时十分有效。  
> 因此，`Collie-Trickster` 提供给你了一种方案，让你能够获取到一个可调式的环境，方便进行调试。
>
> 说到底，和大家开了个玩笑，`Collie-Trickster`的目的从一开始就是一个debug工具的定位。   
> 任何使用`Collie-Trickster`作恶而导致可能面临的风险，包括github封号的情况，`Collie-Trickster`不承担任何责任。

**# 助手限制**
<details><summary>See More</summary>

牧云主机助手目前默认仅免费三台主机，超过三台主机的使用量时，需要切换付费版本。
也可以不切换，但是三台以上的机器无法成功注册。

</details>

**# 一些其他的声音**
<details><summary>See More</summary>

</details>

## 🎮 快速开始

### 基础使用

<details><summary>CLICK ME</summary>

1. 注册百川-使用牧云主机管理助手

![](https://cdn.dvkunion.cn/tricker/46fd1775808c4411b8c2f1225641289f.png)

2. 点击绑定主机

![](https://cdn.dvkunion.cn/tricker/b61fa3cb6f0f4069b60c99a48be599aa.png)

3. 获取token

![](https://cdn.dvkunion.cn/tricker/09d9e9ee0809482faf54b491e42ae7d8.png)

为了方便，可以选择长期使用的token

![](https://cdn.dvkunion.cn/tricker/c63a06e23805430781cc42fc485d8f79.png)

4. 在github创建一个空的仓库，clone到本地，并创建`.github/workflows/workflow.yml`文件，写入一下参考内容：

```yml
name: example
on: [ push, pull_request ]

jobs:
  runner:
    runs-on: ubuntu-latest # 选择你想要的主机系统如：ubuntu:20.04
    steps:
      - uses: actions/checkout@v3
      - name: collie
        uses: dvkunion/CollieTrickster@main
        with:
          token: xxxxxx  # your token,  It will be safer to use ${{ secrets.token }}, see [https://docs.github.com/actions/security-guides/encrypted-secrets] 
```

5. 推送代码到仓库，触发action。

```shell
git push
```

6. 返回百川界面，已获取到主机。

![](https://cdn.dvkunion.cn/tricker/4f8e7c5ea2234135b6f57de12a115f30.png)

7. 后续使用时可以通过手动触发action的方式。

8. 关于退出：Linux主机，在百川解绑主机后，ci自动完成。

![](https://cdn.dvkunion.cn/tricker/99d6436c64ab49859e5337787a5a3688.png)



</details>

### 高级: 切换主机系统(Windows)

<details><summary>CLICK ME</summary>

</details>

### 高级: 通过http触发器自动触发的workflow模版

<details><summary>CLICK ME</summary>

> 注意：这种方式在ci页面会暴露你的牧云助手token信息！请确保不要使用长期token的模式，  
> 重要的事重复一遍！请使用一次性安装的token！ 不要使用长期token！

每次推送代码才能触发实在太蠢了。当然也十分的不够优雅，需要手动把token放在github secrets中。

在基础用法的基础上，这里给出一份通过`workflow_dispatch` 利用方式: 
```yaml
name: example
on:
  workflow_dispatch:
    inputs:
      token:
        description: 'chaitin rivers token'
        required: true
      type:
        description: 'your host type'
        required: true

jobs:
  runner:
    runs-on: ubuntu-latest # 选择你想要的主机系统如：ubuntu:20.04
    steps:
      - uses: actions/checkout@v3
      - name: collie
        if: ${{ inputs.token != '' && inputs.type != '' }}
        uses: dvkunion/CollieTrickster@main
        with:
          token: ${{ inputs.token }}
          host_type: ${{ inputs.type }}
```

使用时，需要你生成一个 [Github Token](https://github.com/settings/tokens/) ，作为认证用；

然后将这份`yaml`放在你的仓库`.github/workflows/example.yml`，或者直接fork本仓库也可以。

最后发起一个http请求, 这里给出一个curl的调用:

```shell
curl \     
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR_GITHUB_ACTION>"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example.yml/dispatches \
  -d '{"ref":"main","inputs":{"token":"<YOUR_TOKEN>","type": "linux"}'
```

其中:
+ <YOUR_GITHUB_ACTION>: github配置的token认证
+ <YOUR_GITHUB_USER_NAME>: 你github账户名称
+ <YOUR_GITHUB_REPOS>: 你fork的仓库名，一般直接fork的就写`CollieTrickster`即可。
+ <YOUR_TOKEN>: 长亭牧云主机助手生成的那个Token。

这样，每发起一次请求，就会执行一次CI。成功上线一台主机。

> url为 `https://api.github.com/repos/<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example.yml/dispatches` 时  
> 触发的对象为 <YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example.yml  
> 如果是fork的仓库，这份yaml默认为linux主机脚本
> 
> 想使用windows时， 对应的yaml脚本为：<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example_windows.yml  
> 同时在http请求里， 替换请求体的json参数： `'{"ref":"main","inputs":{"token":"<YOUR_TOKEN>","type": "windows"}'`

</details>

## 🎈 更有趣的玩法

如果你有什么更加有趣的想法或建议，欢迎提交 Issue/Pr