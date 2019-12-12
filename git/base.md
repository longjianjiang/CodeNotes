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

```
c0 -> c1 -> c2 -> c4 -> c3'(as same as c3, only the hash value is different)
```

have one ahead;(will always one ahead)

[ref](https://segmentfault.com/q/1010000012762602)

# diff

[ref](https://blog.csdn.net/Jeffxu_lib/article/details/86589070)

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

# log

```
it log --stat; // show statistics;
git show commitId; // show commit detail;
```
