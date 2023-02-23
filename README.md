# Collie Tricker

通过 GitHub Action 白嫖国外主机。

## 使用方式

1. 注册百川-使用牧云主机管理助手

![](https://cdn.dvkunion.cn/tricker/46fd1775808c4411b8c2f1225641289f.png)

2. 点击绑定主机

![](https://cdn.dvkunion.cn/tricker/b61fa3cb6f0f4069b60c99a48be599aa.png)

3. 获取token

![](https://cdn.dvkunion.cn/tricker/09d9e9ee0809482faf54b491e42ae7d8.png)


4. 在github创建一个空的仓库，clone到本地，并创建`.github/workflows/workflow.yml`文件，写入一下参考内容：

```yml

```

5. git push 上去代码，触发action。

6. 返回百川界面，已获取到主机。

7. 后续使用时可以通过手动触发action的方式。

## 一些更有趣的玩法

一些更便捷的方式，如果需求的人多会逐步加入到demo。

+ 可以使用github action 的`on:workflow_dispatch`，通过http请求触发ci，来实现主机上线控制。