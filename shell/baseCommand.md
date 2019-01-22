> i recorded the shell commands i usually used, if forgot come here to see.

```
Every shell script first line is `#!/bin/bash` indicate script enviroment.

use `chomd +x name.sh` make script executable.
```

## ls

ls command show file and directory at specific file location.

`ls [-alAFR] [file location]`

- `-a`

display additional files or directories that has `.` prefix.

- `-l`

> first line `total [blocks]` mean : total disk allocation for all files in this directory.

display file's property.

- `-A`

as same as `-a` but not display `.`(current directory) and `..`(parent directory).

- `-F`

add `*` symbol after execute file, add `/` symbol after directory.

- `-R`

recursively list subdirectories encountered.

`ls -lF ~` mean display ~ location file and dicrectory contain file property.

## grep

grep command use specific regular expression to filter the line that we want.

`grep ^-` mean display line that has `-` prefix.

## wc

wc command use to calculate content lines, words, bytes.

- `-l` 

display lines

- `-c`

display bytes

- `-w` 

display words

`ls -l | grep ^- | wc -l` mean calculate current directory files count.

## mv

mv command use to move file to another directory(also can use to rename directory)

## cp

cp command use to copy file to another directory.

## tr(translate)

tr command use to delete or replace content.

`echo a b c | tr " " "\n"` mean replace " " with "\n".

## while read line do {} done

The example below shows the content("aaa bbb ccc") line by line.

```
content="aaa bbb ccc"
echo $content | tr " " "\n" | while read line
do
   echo $line
done
```
## if then fi

The example below prints only lines with a line number greater than 1.

```
content="aaa bbb ccc"
i=0
echo $content | tr " " "\n" | while read line
do
   if (($i > 0)) then
      echo $line
   fi
   i=$(($i+1))
done
```

## curl

curl use to send request.

- GET

curl https://domain.com/path?para=xxx

- POST

json parameters: curl -d '{"key": "value"}' -H "Content-Type: application/json" -X POST https://domain.com/path

x-www-form-urlencoded parameters: curl -d "key&value" -H "Content-Type: application/x-www-form-urlencoded" -X POST https://domain.com/path