# 一、Git 命令一览

[详细地址](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)

# 二、添加不同远程仓库

原github项目添加一个码云的仓库地址

## 本地生成一个公钥并添加到码云

#### [帮助文档](http://git.mydoc.io/?t=154712)

## 添加一个远程地址

~~~
git remote add gitee git@gitee.com:riverluoo/NoteBook.git
~~~

~~~
git push gitee
~~~



# 三 、git 删除远程

* 仓库文件保留本地文件

~~~
git rm --cached demo.md
git commit -m "delete file"
git push
~~~
* 删除远程文件夹 本地保留

~~~
git rm --cached -r demo
git commit -m "delete directory"
git push
~~~


# 四 、tag 操作

 * 创建标签

~~~
git tag v1.0				# 创建轻量级标签
git tag -a v1.0 -m "prod"	# 创建附注标签
~~~

 * 删除标签

~~~
git tag -d v1.1						# 删除本地标签
git push origin --delete tag v1.1	# 删除远程标签
~~~

 * 查看tag信息

~~~
git show v1.1
~~~

 * 提交tag

~~~
git push origin v1.2			# 提交指定标签
git push origin --tags			# 提交本地所有的标签
~~~

 * 检出标签


~~~
git  checkout v1.0   # 此时会指向打v1.0标签时的代码状态，（但现在处于一个空的分支上）
~~~