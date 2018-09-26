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