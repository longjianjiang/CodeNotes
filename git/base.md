# user related

## set user message

- global
we can set a global user message like below, then every repository user message is same.

```
git config --global user.name "longjianjiang"
git config --global user.email "brucejiang5.7@gmail.com"
```
- independent
if we want to different repository have different uesr message, we can set it independently.

```
# cancel global user message
git config --global --unset user.name
git config --global --unset user.email

cd $repository_path/
git config user.email 'brucejiang5.7@gmail.com'
git config user.name 'longjianjiang'
```

## show user message

```
cd $repository_path/
git config user.name
git config user.email
```

# ssh

```
ssh-keygen -t rsa -C 'brucejiang5.7@gmail.com'

Enter file in which to save the key (/Users/zl/.ssh/id_rsa): right now we can write different names for different hosts.
```

we use ssh-keygen to generate a public key avoid enter password.
when we generate more public key for different host, we need a config file use `touch ~/.ssh/config`
below is config file:

```
# Github
Host github.com 
	HostName github.com
	PreferredAuthentications publickey
	IdentityFile ~/.ssh/id_rsa
 	user longjianjiang

# Coding
Host git.coding.net
	HostName git.coding.net
	PreferredAuthentications publickey
	IdentityFile ~/.ssh/id_rsa_coding
	user longjianjiang
```

then we need set ssh agent to add private key:

```
exec ssh-agent bash
ssh-add ~/.ssh/id_rsa_coding
ssh-add ~/.ssh/id_rsa_github
```

last, we can test is success:

```
ssh -T git@github.com
```

---

遇到无法push的时候，查看remote地址是不是git@github这种的，不是的话重新设置一下。

```
git remote set-url origin git@github.com:lut/EvolutionApp.git
```

---

遇到[too open](https://stackoverflow.com/questions/9270734/ssh-permissions-are-too-open-error) 错误，执行文件读取权限。

```
chmod 600 ~/.ssh/id_rsa_github
```

---

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
SHA256:uNiVztksCsDhcc0u9e8BujQXVUpKZIDTMczCvj3tD2s.
Please contact your system administrator.
Add correct host key in /Users/xmly/.ssh/known_hosts to get rid of this message.
Offending RSA key in /Users/xmly/.ssh/known_hosts:2
Host key for github.com has changed and you have requested strict checking.
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists
```

这个错误需要在known_hosts里面删除uNiVztksCsDhcc0u9e8BujQXVUpKZIDTMczCvj3tD2s.记录，下次push的时候会进行重新添加host。

---

遇到

```
git@gitlab.xxx.com: Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).
fatal: Could not read from remote repository.
```

需要在.ssh/config中对每个host添加rsa算法声明，如下:

```
HostkeyAlgorithms +ssh-rsa  # 使 openssh 支持 rsa 算法
PubkeyAcceptedAlgorithms +ssh-rsa
PubkeyAcceptedKeyTypes +ssh-rsa
```
[ref](https://blog.csdn.net/qq_53528578/article/details/120897053)

# merge related

```
c0 -> c1 -> c2 -> c3 (master)
			|
			v
			c4 (feat)
```

feat branch want to merge master, have three choices:

## merge

```
c0 -> c1 -> c2 -> c4 -> c5(merge commit)
```

will fine;

## rebase

```
c0 -> c1 -> c2 -> c3 -> c4'(as same as c4, only the hash value is different)
```

have two ahead, one behind;

need `git push --force`.

## cherry-pick

[ref](http://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html)

```
c0 -> c1 -> c2 -> c4 -> c3'(as same as c3, only the hash value is different)
```

have one ahead;(will always one ahead)

[ref](https://segmentfault.com/q/1010000012762602)

# diff

[ref](https://blog.csdn.net/Jeffxu_lib/article/details/86589070)

```
git diff --cached; // show diff when files be staged;
```

# branch related

```
git branch -a; // show local and remote branch;
git branch -r; // show remote branch;
git remote show origin; // show remote origin, remote branch msg;
git remote prune origin; // delete remote repo have deleted branch;
```

```
git branch -d name; // delete local branch;
git branch -D name; // force delete local branch(not fully merged, squash commit);
git push origin --delete name; // delete remote branch;
```

```
git checkout -b local_branch_name origin/remote_branch_name; // create a branch and track remote branch;
```

```
git branch -m oldname newname; // modify local branch name;
```

# log

```
git log --stat; // show statistics;
git show commitId; // show commit detail;
git log -p; // show every commit detail;
```

# hunk

[ref1](https://stackoverflow.com/questions/1981830/undo-part-of-unstaged-changes-in-git)
[ref2](https://stackoverflow.com/questions/10605405/what-does-each-of-the-y-n-q-a-d-k-j-j-g-e-stand-for-in-context-of-git-p)

```
git add -p; // choose individual hunks to add to stages;
git checkout -p; // choose individual hunks to discard that not staged;
git reset -p; // choose individual hunks to become unStaged;
```

# remote

```
git remote update origin --prune // refresh origin branch
```


# commit 

```
git commit --amend 可以对上一次的提交做修改
```

---

can use rebase to change commit msg in origin branch. [ref](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E9%87%8D%E5%86%99%E5%8E%86%E5%8F%B2)

---

```
git show // show latest commit content;
git show commitId // show commit context; 
git show commitId fileName
```

# submodule

```
git submodule update --init --recursive; // fetch all submodules

git clone --recurse-submodules // fetch all submodules
```

# tag

```
git tag -d tag_name;
git push origin :refs/tags/tag_name
```

# conflict

```
git checkout --theirs path/to/file
git checkout --ours path/to/file
```

# 复制最新的commit id

git log -1 --pretty=format:%h | pbcopy

git log | grep commit | head -n1 | awk '{print $2}' // 打印出最新的一条commit id

# add

提交某个文件的部分提交；

```
git add -p file;
```

[ref](https://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git)

# stash

```
git stash save 'message';
git stash list;
git stash apply; // 应用存储，不会删除记录
git stash pop; // 应用存储，并且删除记录
git stash clear; // 删除所有记录
git stash drop stash@{0}; // 删除某个记录
```

# clean

```
git clean -n; // 查看工作区中所有没有被跟踪的文件；
git clean -f; // 删除工作区中所有没有被跟踪的文件；
```
