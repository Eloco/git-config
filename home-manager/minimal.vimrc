".                         .           . 
".                               .       
".  .                                    
".. .                                    
".             .::ttX%ttt:..             
".           .;%8888@88@X8%::.           
".         .;X88SX%%%S%XXX8%t;..         
".       .:%88@ X:X@X:S88%@88Xt:.        
"..      .t8SS8X8%8@888888tXS8@;.        
".      .;@S@8t%S8X;XX88X;8%8@8%;.       
".      .t8X%%8tSttS:..;8t%S8S8@:..      
"..     :t@8X:8;%;tt;..;8%8SXX8X:..      
".      .t@@%88@t8tt%%X@%88t8X@S::       
".     ..:%888;X8888;..t88;888@:..       
".     ...;%X@S;8X@SS%:%8;888@;;..       
".       .:t%X8X@::.  %t:S88@;::.        
"..       ..;;%t@88@SS88@X@t::..         
".        ....;;;Stt%%%S;t::..           
".          .....:::;;;:::.              
"..             ........                 
".                 ...                   
".                                       
".              .                     .  
" Author: eloco <elogicocal@gmail.com>
" Create Date: 2022-10-01
" License: MIT

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set clipboard=unnamed    " Mac共享剪切板

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=40        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置 Gui设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18 " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18      " 设置字体
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diy设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim sudo 保存
map <leader>sudo :w !sudo tee %
" 粘贴首尾会出现特殊字符
set t_BE=
" 解决粘贴缩进问题
set pastetoggle=<F12>
set ts=4    "tab 改为空格
"no recurcy
noremap <up> <Nop>
nnoremap <up> <Nop>
inoremap <Down> <Nop>
nnoremap <Down> <Nop>
inoremap <Left> <Nop>
nnoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Right> <Nop>
inoremap jk <Esc>
"inoremap <Esc> <Nop>
nnoremap H ^
nnoremap L $
nnoremap ,h H

" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

" 退出插入模式指定类型的文件自动保存
" au InsertLeave *.go,*.sh,*.php,*.py,*.js write
"
" 开启实时搜索
set incsearch

" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

" set unsee char
set list listchars =tab:▸\ ,eol:¬,extends:>,precedes:<
"Trailing space is all whitespace located at the end of a line, without any other characters following it
set list listchars+=trail:·,space:. 
"end-of-line (EOL)
set list listchars+=eol:¬ 
"when you don't have line wrapping on, to show that there is more text to the left or right of the line
set list listchars+=extends:>,precedes:< 
vnoremap <silent><leader>l :set list!<CR>
nnoremap <silent><leader>l :set list!<CR>
vnoremap <silent><leader>w :set wrap!<CR>
nnoremap <silent><leader>w :set wrap!<CR>
vnoremap <silent><leader>n :set nu!<CR>
nnoremap <silent><leader>n :set nu!<CR>

" 退出重进恢复光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ctr + y to choose Tab
"inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

