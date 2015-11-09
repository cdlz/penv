#!/bin/bash
#cd `dirname $0`
#add crontab job.
## m h  dom mon dow   command
#*/3 * * * * /home/ubuntu/.cscope/cscope_update_db.sh
mkdir $HOME/.cscope/  1>/dev/null 2>&1
cd $HOME/.cscope/

#source file path,need add to this file.
find -L \
/home/ubuntu/zc/devzc \
/home/ubuntu/zc/worktools \
/home/ubuntu/zc/phptest \
-type f \
-name '*.c' -o \
-name '*.cpp' -o \
-name '*.h' -o \
-name '*.hpp' -o \
-name '*.py' \
-name '*.php' \
 > ./src.files && cscope -b -q -i ./src.files
