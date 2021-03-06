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
it log --stat; // show statistics;
git show commitId; // show commit detail;
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

# submodule


```
git submodule update --init --recursive; // fetch all submodules
```
