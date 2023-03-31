<h1 align="center"> Collie-Trickster </h1>

<p align="center">通过 GitHub Action 白嫖国外主机。[狗头] </p>

<p align="center"> 中文文档 | <a href="README_EN.md">English</a> </p>

<p align="center"> <b>Collie-Trickster 简介</b> </p>

Collie-Trickster 基于 牧云主机助手 (Collie) 实现的Github Action。主要用于更便捷的使用和Debug Github Action。

## 🧑‍🤝‍🧑 友情提示

**关于风险**

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

**一些其他的声音**
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
        uses: dvkunion/collie_tricker@main
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

</details>

### 高级模版: 通过http触发器自动触发

<details><summary>CLICK ME</summary>
</details>

## 🎈 更有趣的玩法

如果你有什么更加有趣的想法或建议，欢迎提交 Issue/Pr