##for git readme.
#personal git alias config
```sh
git config --global merge.tool vimdiff
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.last 'log --graph --color -1'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.pom  'push origin master'
git config --global alias.phm  'push home master'
```

#git merge 
本地没有add到暂存区(stage)中时:
```sh
git stash 
git pull origin master
git stash apply
```
之后是
```sh
git mergetool 
```
进行合并. vimdiff中,合并完成后,wqall完成退出(可以删除中间文件) 
删除备份文件: xxx.orig
```sh
git commit -m 'merge'
git push origin master
git pull origin master
```

#其他有用的文档
exp:

    *[更详细的git中文指导](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001373962845513aefd77a99f4145f0a2c7a7ca057e7570000)
    
    *[git alias](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001375234012342f90be1fc4d81446c967bbdc19e7c03d3000)
    
    *[git server manager](https://github.com/res0nat0r/gitosis)
    
    *[git权限扩展](https://github.com/sitaramc/gitolite)
