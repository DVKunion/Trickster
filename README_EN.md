<h1 align="center"> Collie-Trickster </h1>

<p align="center">Get An Free foreign hosts through GitHub Action [doge] </ p>

<p align="center"> <a href="README_EN. md">Chinese Documents</a> | English</p>

<p align="center"> <b>Collie-Trickster introduction</b> </p>

Collie Trickster is based on the MuYun Virtual Machine Assistant (Collie), Github Action implemented. Mainly used for more convenient use and Debug Github Action.

## 🧑‍🤝‍🧑 Friendly reminder

**About Risk**

> Actually, everyone knows that the so-called "Get An Free foreign hosts" is just a gimmick  -_-
> 
> First of all, the duration is usually only 6 hours. Of course, you can also conduct some automated development yourself to maintain a persistent state, but this use is not encouraged. After all, the official action description proposes explicitly prohibited usage.
> 
> Secondly, the purpose of this tool is to enable the `github action` debugging scheme.  
> People who have used `gittab ci` may know that the `debug` mode can directly access terminals in the ci environment for manual `debug`, which is very effective when some complex ci operations encounter errors.  
> Therefore, `Collie Trickster` provides you with a solution that allows you to obtain an adjustable environment for debugging.  
> 
> After all, I made a joke with everyone that the purpose of `Collie Trickster` was to locate a debugging tool from the beginning.  
> 
> `Collie Trickster` does not assume any responsibility for any possible risks that may arise from using `Collie Strickster` to commit crimes, including the Github seal.".

**Some other sounds**

<details><summary>See More</summary>
</details>


## 🎮 Quick Start

### Basic usage

<details><summary>CLICK ME</summary>

1. Register for Rivers Platform - Use MuYun Virtual Machine Management Assistant

![](https://cdn.dvkunion.cn/tricker/46fd1775808c4411b8c2f1225641289f.png)

2. Click Bind Host

![](https://cdn.dvkunion.cn/tricker/b61fa3cb6f0f4069b60c99a48be599aa.png)

3. Obtain token

![](https://cdn.dvkunion.cn/tricker/09d9e9ee0809482faf54b491e42ae7d8.png)

For convenience, you can choose a token for long-term use

![](https://cdn.dvkunion.cn/tricker/c63a06e23805430781cc42fc485d8f79.png)

4. Create an empty project at Github, clone it locally, and create a `.github/workflows/workflow.yml` file. Write
   the following reference content:

```yml
name: example
on: [ push, pull_request ]

jobs:
   runner:
      runs-on: ubuntu-latest # select your host system like：ubuntu:20.04
      steps:
         - uses: actions/checkout@v3
         - name: collie
           uses: dvkunion/CollieTrickster@main
           with:
              token: xxxxxx  # your token,  It will be safer to use ${{ secrets.token }}, see [https://docs.github.com/actions/security-guides/encrypted-secrets]
```

5. Push the code to trigger the action.

```shell
git push

```

6. Return to the Rivers interface and obtain the host.

![](https://cdn.dvkunion.cn/tricker/4f8e7c5ea2234135b6f57de12a115f30.png)

7. During subsequent use, you can manually trigger an action.

</details>

### Advanced template: Automatically triggered through http triggers

<details><summary>CLICK ME</summary>

</details>

## 🎈 More fun ways to play

If you have any more interesting ideas or suggestions, Welcome to submit an Issue/Pr.