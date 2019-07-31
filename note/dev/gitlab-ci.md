## Gitlab runner

因构建过程消耗系统资源，是由 gitlab runner 来执行构建任务。

Runner 类型：
GitLab-Runner 可以分类两种类型： Shared Runner（共享型）和 Specific Runner（指定型）。

Shared Runner：这种 Runner 是所有工程都能够用的。只有系统管理员能够创建 Shared Runner。

Specific Runner：这种 Runner 只能为指定的工程服务。拥有该工程访问权限的人都能够为该工程创建 Shared Runner。

## 安装 gitlab-runner

```
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | sudo bash
```

```
yum install gitlab-ci-multi-runner
```

## 遇到的问题

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190731231802.png)

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190725165717.png)

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190725165833.png)
