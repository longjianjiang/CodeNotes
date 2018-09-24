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