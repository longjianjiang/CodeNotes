> i recorded the shell commands i usually used, if forgot come here to see.

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