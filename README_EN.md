<h1 align="center"> Collie-Trickster </h1>

<p align="center">Get An Free foreign hosts through GitHub Action [doge] </p>

<p align="center"> <a href="README_EN.md">Chinese Documents</a> | English</p>

<p align="center"> <b>Collie-Trickster introduction</b> </p>

Collie Trickster is based on the MuYun Virtual Machine Assistant (Collie), Github Action implemented. Mainly used for more convenient use and Debug Github Action.

Currently supported:

+ The Linux ci environment registers with the MuYun virtual machine assistant through `manual push`/`HTTP request trigger`, and can complete ci by uninstalling the MuYun virtual machine assistant.

+ Windows host support

## 🧑‍🤝‍🧑 Friendly reminder

**# About Risk**

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

**# MuYun Virtual Machine Assistant Limit**

<details><summary>See More</summary>

Currently, the Mu Virtual Machine Assistant only has three free hosts by default. When the usage of three hosts exceeds, you need to switch to a paid version.

You can also not switch, but more than three machines cannot successfully register.

</details>

**# Some other sounds**

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

8. About exiting: For Linux hosts, ci automatically completes after Rivers unbinds the host.

![](https://cdn.dvkunion.cn/tricker/99d6436c64ab49859e5337787a5a3688.png)



</details>

### Advanced: Switching host systems (Windows)

<details><summary>CLICK ME</summary>
</details>

### Advanced: Automatically triggered through http triggers workflow template

<details><summary>CLICK ME</summary>

> Note: This way on the ci page will expose your cloud assistant token information! Please ensure that you do not use the long-term token mode,  
> Repeat the important thing! Please use a one-time installed token! Do not use long-term tokens!

It's foolish to trigger every time you push code. Of course, it is not elegant enough. You need to manually place the token in github secrets.

Based on the basic usage, here is a copy of the `workflow_dispatch` method:

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

When using, you need to generate a [Github Token](https://github.com/settings/tokens/) For authentication purposes; 

Then place this' yaml 'in your warehouse'.github/workflows/example.yml', Or directly fork the warehouse.

Finally, a http request is issued, and here is a curl call:

```shell
curl \     
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR_GITHUB_ACTION>"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example.yml/dispatches \
  -d '{"ref":"main","inputs":{"token":"<YOUR_TOKEN>","type": "linux"}'
```

Including:

+ <YOUR_ GITHUB_ACTION>: Token authentication configured for github
+ <YOUR_ GITHUB_USER_NAME>: Your github account name
+ <YOUR_ GITHUB_REPOS>: The warehouse name of your fork. Generally, if you fork directly, you can write `CollieTrickster`.
+ <YOUR_ TOKEN>: The token generated by the MuYun virtual machine assistant.

This way, the CI is executed every time a request is initiated. and successfully launched a host.


> The url is` https://api.github.com/repos/<YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example.yml/dispatches`  
> Triggered object is <YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example.yml  
> If it's a fork repository, this yaml defaults to a Linux host script
>
> When you want to use Windows, the corresponding yaml script is: <YOUR_GITHUB_USER_NAME>/<YOUR_GITHUB_REPOS>/actions/workflows/example_windows.yml
> In the http request, replace the json parameters of the request body: '{"ref": "main", "inputs": {"token": "<YOUR_TOKEN>", "type": "windows"}'`

</details>

## 🎈 More fun ways to play

If you have any more interesting ideas or suggestions, Welcome to submit an Issue/Pr.