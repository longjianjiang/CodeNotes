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

grep command use specific regular expression to filter the line that we want, and we can appoint specific serach path.

grep command have several option:

- `-r`

recursively search path.

- `-n` 

display line number.

`grep ^-` mean display line that has `-` prefix.

`grep -rn "unordered_set" *` mean search for the current directory and its subdirectory files containing the "unordered_set".

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

`mv tcp_note* ~/path` mean move file name prefix is tcp_note to the custom path.

## cp

cp command use to copy file to another directory.

`cp -a /source/. /dest` mean copy source directory files to dest directory.

## rm

rm command use to delete files.

`rm -rf dir` mean force recursively delete directory contents.

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

- cookie

Chrome Console Network right click one request, can copy cURL request str;

cookie file format:

```
.douban.com	TRUE	/	FALSE	1485507337	bid	"WASIURtSGKN"
```

domain;
tailmatch; <<<
path;
secure; // send cookie only https request;
expire;
name;
value;

`curl -b cookie.txt url | python -m json.tool`

[ref](https://curl.haxx.se/docs/http-cookies.html)
[ref](https://aiezu.com/article/linux_curl_http_cookie.html)

## cat

`cat -n filepath` mean print the contents of the file and the line number to std output.

`cat oneFilePath anotherFilePath` mean copy the contents of the file to another file.
