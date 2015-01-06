" zc modified from http://beiyuu.com/git-vim-tutorial/
"================================================================

if has("win32")
      let $VIMFILES = $VIM.'/vimfiles'
      let $V = $VIM.'/_vimrc'
else
      let $VIMFILES = $HOME.'/.vim'
      let $V = $HOME.'/.vimrc'
endif

  "修改leader键为逗号
  let mapleader=","
  imap jj <esc>
  
  set nocompatible          "不要兼容vi
  filetype off              "必须的设置：

  "Color Settings {
  set colorcolumn=85           "彩色显示第85行
  set t_Co=256                 "设置256色显示
  set background=dark          "使用color solarized
  set cursorline               "设置光标高亮显示
  set cursorcolumn             "光标垂直高亮
  set ttyfast
  set ruler
  set backspace=indent,eol,start

  "}

  "tab setting {
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  "}

  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
  set scrolloff=3
  set fenc=utf-8
  set autoindent
  set hidden
  set noswapfile
  set nowritebackup
  set nobackup

  "set encoding=utf-8

 
  set laststatus=2                                      "启用状态栏信息
  set cmdheight=2                                       "设置命令行的高度为2，默认为1
  set cursorline                                        "突出显示当前行 
  set shortmess=atI                                     "去掉欢迎界面
  set statusline=%F%m%r\ \|\ %{&ff},%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"},%Y\ \|%=\ %l/%L,%c\ \|\ %f
                            " 设置在状态行显示的信息如下：
                            " %f    当前的文件名
                            " %F    当前全路径文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}
                            "       当前文件编码
                            " %{&fileencoding}
                            "       中文编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数
  
  set number                                    "显示行号
  set undofile                                  "unlimited undo,and dir redirect to vimfiles
  set undodir=$VIMFILES/\_undofiles
  set undolevels=1000 "maximum number of changes that can be undone
  
  "set nowrap                                    "禁止自动换行
  "autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

  "相对行号 要想相对行号起作用要放在显示行号后面
  "set relativenumber 
  "自动换行
  set wrap
  "GUI界面里的字体，默认有抗锯齿
  set guifont=Inconsolata:h12
  "将-连接符也设置为单词
  set isk+=-

  set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
  set smartcase
  "set gdefault
  set incsearch
  set showmatch
  set hlsearch
   


  set numberwidth=4          "行号栏的宽度
  "set columns=135           "初始窗口的宽度
  "set lines=50              "初始窗口的高度
  "winpos 620 45             "初始窗口的位置

  set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

  "插入模式下移动
  imap <c-j> <down>
  imap <c-k> <up>
  imap <c-l> <right>
  imap <c-h> <left>

  "===================================================

  "修改vim的正则表达
  nmap / /\v
  vmap / /\v

  "使用tab键来代替%进行匹配跳转
  nmap <tab> %
  vmap <tab> %

  "折叠html标签 ,fold tag
  nnoremap <leader>ft vatzf
  "使用,v来选择刚刚复制的段落，这样可以用来缩进
  nnoremap <leader>v v`]

  "使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
  nmap <leader>w <c-w>v<c-w>l
  nmap <leader>wc <c-w>c
  nmap <leader>ww <c-w>w

  "tab切换
  nmap <leader>t gt
  nmap <leader>r gT

  "<leader>空格快速保存
  nmap <leader><space> :w<cr>

  "取消搜索高亮
  nmap <leader>n :noh<cr>

  "html中的js加注释 取消注释
  nmap <leader>h I//jj
  nmap <leader>ch ^xx
  "切换到当前目录
  nmap <leader>q :execute "cd" expand("%:h")<CR>
  "搜索替换
  nmap <leader>s :,s///c

  "取消粘贴缩进
  nmap <leader>p :set paste<CR>
  nmap <leader>pp :set nopaste<CR>

  "文件类型切换
  nmap <leader>fj :set ft=javascript<CR>
  nmap <leader>fc :set ft=css<CR>
  nmap <leader>fh :set ft=html<CR>
  nmap <leader>fm :set ft=mako<CR>

  "设置隐藏gvim的菜单和工具栏 F2切换
  set guioptions-=m
  set guioptions-=T
  "去除左右两边的滚动条
  set go-=r
  set go-=L


  "Vundle Settings {
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  Bundle 'gmarik/vundle'
  Bundle "mattn/emmet-vim"
  Bundle 'Auto-Pairs'
  Bundle 'matchit.zip'
  Bundle 'trailing-whitespace'
  Bundle 'cakebaker/scss-syntax.vim'
  Bundle "pangloss/vim-javascript"
  Bundle "othree/html5.vim"
  Bundle "beiyuu/vim-bundle-mako"
  Bundle "ayang/AutoComplPop"
  Bundle "wavded/vim-stylus"
  Bundle "mxw/vim-jsx"
  Bundle 'junegunn/vim-easy-align'
    vmap <Enter> <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)

  Bundle "Solarized"
    colorscheme solarized
    let g:solarized_termtrans  = 1
    let g:solarized_termcolors = 256
    let g:solarized_contrast   = "high"
    let g:solarized_visibility = "high"

  Bundle "ervandew/supertab"
    let g:SuperTabDefaultCompletionType = "<c-n>"

  Bundle 'ctrlp.vim'
    let g:ctrlp_cmd = 'CtrlPMRU'
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|site_packages\|venv'

  Bundle 'Lokaltog/vim-easymotion'
    let g:EasyMotion_smartcase = 0
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    nmap s <Plug>(easymotion-s)
    nmap S <Plug>(easymotion-s2)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)

  Bundle 'The-NERD-tree' 
    let g:NERDTreeShowBookmarks=1
    let g:NERDTreeShowFiles=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeIgnore=['\.$','\~$']
    let g:NERDTreeShowLineNumbers=1
    let g:NERDTreeWinPos='left'
	
    "nmap <silent> <F2> :NERDTreeToggle<CR>
    nmap <leader>nt :NERDTree<cr>:set rnu<CR>

  Bundle 'The-NERD-Commenter'
    let NERDShutUp=1
    "支持单行和多行的选择，//格式
    map <c-h> ,c<space>

  Bundle 'UltiSnips'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

  "Bundle 'FencView.vim'
    "let g:fencview_autodetect=1
  "Bundle 'Valloric/YouCompleteMe'
  "Bundle 'terryma/vim-multiple-cursors'
  "Bundle '_jsbeautify'
    "nnoremap <leader>_ff :call g:Jsbeautify()<CR>
  "Bundle 'nathanaelkane/vim-indent-guides'
    "let g:indent_guides_enable_on_vim_startup=1
    "let g:indent_guides_guide_size=1


  Bundle 'taglist.vim'
  Bundle 'majutsushi/tagbar'   
   " Tagbar 相对 TagList 能更好的支持面向对象 
   nmap tb :TlistClose<CR>:TagbarToggle<CR>  " 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
   let g:tagbar_width=30                       "设置窗口宽度
   nmap tr  <Esc>:!ctags -R *<CR>   "生成一个tags文件
   nmap tl :TagbarClose<CR>:Tlist<CR> " 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
    
   " let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
   let g:Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
   "let g:Tlist_File_Fold_Auto_Close=1            "自动折叠
   let g:Tlist_WinWidth=30                       "设置窗口宽度
   "let g:Tlist_Use_Right_Window=1                "在右侧窗口中显示
   let g:Tlist_Show_One_File=1  "仅显示当前文件的
   
   
  
  Bundle 'std_c.zip'
  Bundle 'ZoomWin'
  "高亮显示插件
  "Bundle 'Mark--Karkat'
  
  
  Bundle 'wesleyche/SrcExpl'
   " 增强源代码浏览，其功能就像Windows中的"Source Insight"
   nmap <F3> :SrcExplToggle<CR>                "打开/闭浏览窗口

  Bundle 'winmanager'
   "合并显示taglist和nerdtree
   let g:NERDTree_title='NERD Tree'
   let g:winManagerWindowLayout='NERDTree|TagList'
   let g:winManagerWidth = 30
   nmap <F2> :WMToggle<cr>
   
   "解决E382: Cannot write, 'buftype' option is set
   au VimEnter * set buftype=""  
  
  
  "}   end vbundle config
  
  
" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
    "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=./tags;                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）



function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction
  
  " F2 打开nerdtree和taglist
  " F3 sourceexplorer
  nmap <F10> <ESC><C-W><UP>
  nmap <F11> <ESC><C-W><DOWN> 
  nmap <F12> <ESC><c-w>w  "循环窗口
  

  "放置在Bundle的设置后，防止意外BUG
  filetype plugin indent on
  syntax on
  "需要调整window大小时,可以手动设置后用鼠标调整
  "set mouse=a
  " unselected for paste's indent.
  set paste
  
