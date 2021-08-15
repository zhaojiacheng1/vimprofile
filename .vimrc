" 设置不与VI兼容
set nocompatible

" 配置256颜色显示
set t_Co=256

" 设置行高亮
set cursorline

" 高亮行配置
hi CursorLine term=bold cterm=bold ctermbg=240

" 设置显示行号
set number

" 打开语法高亮
syntax on

" 显示输入模式
set showmode

" 显示命令
set showcmd

" 设置文件编码 并解决中文乱码的问题
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 解决consle输出乱码
language messages zh_CN.utf-8

" 缩进保持
set autoindent

" tab显示空格数
set tabstop=2

" 设置快速缩进
set shiftwidth=4

" 设置tab空格数
set expandtab
set softtabstop=4

" 设置显示相对行号
set relativenumber

" 设置自动换行
set wrap
set textwidth=80
set linebreak
set wrapmargin=2

" 保持光标正中
set scrolloff=5
set sidescrolloff=15

" 括号显示
set showmatch

" 高亮显示匹配结果
set hlsearch
set incsearch
set ignorecase
set smartcase

" 高亮结果显示颜色设置
hi Search term=bold cterm=bold ctermbg=240

" 将高亮的结果取消高亮
nnoremap <tab> :noh<return><esc>

" 保留撤销历史
set undofile

" 自动切换工作目录
set autochdir

" 历史操作
set history=1000

" 打开文件监视
set autoread

" tab补齐
set wildmenu
set wildmode=longest:list,full

" Vundle管理插件
" filetype off "关闭文件类型检查

" 启用vundle管理插件
" set rtp+=~/.vim/bundle/Vundle.vim " 设置初始化相关的runtime path
" call vundle#begin() " 安装插件从此开始

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'



" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如:PluginSearch xml 就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
" h:vundle          - 获取帮助

" 自动补齐
" Plugin 'Valloric/YouCompleteMe'

" 补全插件配置
" set runtimepath+=~/.vim/bundle/YouCompleteMe
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif " 离开插入模式自动关闭预览窗口
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'    
" let g:ycm_min_num_of_chars_for_completion               = 2 " 输入第 2 个字符开始补全                  
" let g:ycm_seed_identifiers_with_syntax                  = 1 " 语法关键字补全    
" let g:ycm_complete_in_comments                          = 1 " 在注释中也可以补全    
" let g:ycm_complete_in_strings                           = 1 " 在字符串输入中也能补全    
" let g:ycm_collect_identifiers_from_tag_files            = 1 " 使用 ctags 生成的 tags 文件    
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全    
" let g:ycm_cache_omnifunc                                = 0 " 每次重新生成匹配项，禁止缓存匹配项    
" let g:ycm_use_ultisnips_completer                       = 0 " 不查询 ultisnips 提供的代码模板补全，如果需要，设置成 1 即可
" let g:ycm_show_diagnostics_ui                           = 0 " 禁用语法检查
" let g:ycm_key_list_select_completion   = ['<c-n>', '<Down>']   " 选择下一条补全，Default: ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']     " 选择上一条补全，Default: ['<S-TAB>', '<Up>']
" let g:ycm_key_list_stop_completion     = ['<Enter>']  " 中止此次补全，Default: ['<C-y>']
" let g:ycm_show_diagnostics_ui                           = 0 " 禁用语法检查
" 回车即选中 插入模式
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 跳转到定义处 普通模式
" nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" call vundle#end() " 插件安装从此结束

" filetype plugin on " 文件类型检查打开
" vundle 配置到此结束

" 新文件标题
" 新建 .c,.h,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,CMakeLists.txt exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if expand("%:e") == 'sh' 
        call setline(1, "##########################################################################") 
        call append(line("."),   "# File Name: ".expand("%")) 
        call append(line(".")+1, "# Author: 赵家城") 
        call append(line(".")+2, "# mail: zhaojiacheng1@outlook.com") 
        call append(line(".")+3, "# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "#########################################################################") 
        call append(line(".")+5, "#!/usr/bin")
        call append(line(".")+6, "PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
        call append(line(".")+7, "export PATH")
        call append(line(".")+8, "")
    elseif expand("%") == 'CMakeLists.txt'
        call setline(1, "#[[*************************************************************************") 
        call append(line("."),   "  > File Name: ".expand("%")) 
        call append(line(".")+1, "  > Author: 赵家城") 
        call append(line(".")+2, "  > Mail: zhaojiacheng1@outlook.com ") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************]]") 
        call append(line(".")+5, "")
        call append(line(".")+6, "#SET(CMAKE_C_COMPILER \"gcc\")#set C compiler")
        call append(line(".")+7, "#SET(CMAKE_C_FLAGS \"-g -Wall -I D:\\MinGW\\include -L D:\\MinGW\\lib\")")
        call append(line(".")+8, "#SET(CMAKE_CXX_COMPILER \"g++\") #set c++ compiler")
        call append(line(".")+9, "#SET(CMAKE_CXX_FLAGS \"-g -Wall -I D:\\MinGW\\include -L D:\\MinGW\\lib\")")
        call append(line(".")+10, "CMAKE_MINIMUM_REQUIRED(VERSION 2.8)")
        call append(line(".")+11, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name: ".expand("%")) 
        call append(line(".")+1, "  > Author: 赵家城") 
        call append(line(".")+2, "  > Mail: zhaojiacheng1@outlook.com ") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:t:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:t:r"))."_H")
        call append(line(".")+8, " ")
        call append(line(".")+9, "#endif //".toupper(expand("%:t:r"))."_H")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
    endif
    "   if &filetype == 'java'
    "       call append(line(".")+6, "public class ".expand("%"))
    "       call append(line(".")+7, "")
    "   endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

