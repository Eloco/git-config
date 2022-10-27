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
" 下载和加载插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bootstrap vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:plug_url_format = 'https://github.91chi.fun/https://github.com/%s.git'
call plug#begin('~/.vim/plugged')                                        " 设定插件目录
Plug 'neoclide/coc.nvim', {'branch': 'release'}                          " 自动补全
Plug 'vim-airline/vim-airline'                                           " 底部状态栏
Plug 'navarasu/onedark.nvim'                                             " onedark theme
Plug 'easymotion/vim-easymotion'                                         " vim快速跳转
Plug 'godlygeek/tabular'                                                 " 符号格式化
Plug 'terryma/vim-smooth-scroll'                                         " 滑动流畅
Plug 'tpope/vim-fugitive'                                                " git browser
Plug 'junegunn/gv.vim'                                                   " git browser
Plug 'Yggdroot/LeaderF'                                                  " fuzzy search
Plug 'chxuan/prepare-code'                                               " 准备代码
Plug 'Shougo/echodoc.vim'                                                " Print documents in echo area.
Plug 'mileszs/ack.vim'                                                   " run ack on vim
Plug 'luochen1990/rainbow'                                               " 括号嵌套颜色
Plug 'ianva/vim-youdao-translater'                                       " 有道云翻译
Plug 'Yggdroot/indentLine'                                               " 代码Tab辅助线
Plug 'pechorin/any-jump.vim'                                             " 代码跳转
Plug 'skywind3000/vim-rt-format', { 'do': 'pip3 install autopep8 jedi' } " python 代码实时格式化
Plug 'KarimElghamry/vim-auto-comment'                                    " 多行自动注释
Plug 'tpope/vim-commentary'                                              " gc自动注释
Plug 'ntpeters/vim-better-whitespace'                                    " Vim Better Whitespace Plugin
Plug 'gcmt/wildfire.vim'                                                 " wildfire.vim 提供了使用回车快速选择成对符号内字符的功能。嵌套使用函数时，将光标放到内部，多次按回车可以扩选括号匹配的内容。
Plug 'mbbill/undotree'                                                   " 撤销历史
Plug 'rcarriga/nvim-notify'                                              " 弹窗美化
Plug 'dkarter/bullets.vim'                                               " automated bullet lists. 自动编排代码
Plug 'SirVer/ultisnips'                                                  " 片段最终解决方案
Plug 'honza/vim-snippets'                                                " snippets template
Plug 'lervag/vimtex', { 'for': 'tex' }                                   " VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
Plug 'LnL7/vim-nix',  { 'for': 'nix' }                                   " Support for writing Nix expressions in vim.

Plug 'nvim-lua/plenary.nvim' " ind, Filter, Preview, Pick. All lua, all the time.
Plug 'nvim-telescope/telescope.nvim'
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'
  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"if filereadable(expand($HOME . '/.vimrc.custom.plugins'))
"    source $HOME/.vimrc.custom.plugins
"endif
"
call plug#end()
" load vim default plugin
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" onedark与airline主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc与leader配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>
" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>
" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc补全设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/rstacruz/vim-coc-settings
" tabnine 自动补全 https://github.com/neoclide/coc-tabnine
" coc python is too old
let g:coc_global_extensions = ['coc-html','coc-css','coc-tabnine',  
            \ 'coc-xml','coc-yaml',
            \ 'coc-markdownlint','coc-highlight', 'coc-pyright']
" :CocInstall coc-html coc-css coc-tabnine coc-xml coc-yaml coc-markdownlint coc-highlight coc-pyright
" Use <Tab> and <S-Tab> to navigate the completion list:
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" use either coc-python or jedi to autocomplete your code
let g:jedi#completions_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion vim快速跳转
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"用法1: 跳转到当前光标前后的位置(w/b)
"快捷键<leader><leader>w(即,,w)和<leader><leader>b(即,,b)
"用法2: 搜索跳转(s)
"快捷键<leader><leader>s(即,,s), 然后输入要搜索的字母, 这个跳转是双向的

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" godlygeek/tabular 解决对齐问题，可以指定各种对齐符号、对齐方式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>= :Tab /=<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-smooth-scroll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-fugitive
" junegunn/gv.vim   A git commit browser in Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF 模糊搜索支持，需要python3-neovim
" python3 -m pip install neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f :LeaderfFile ~<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prepare-code: A generate prepare code plugin for vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'Shougo/echodoc.vim'
" To use echodoc, you must increase 'cmdheight' value.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=2
let g:echodoc_enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'mileszs/ack.vim' 
" Run your favorite search tool from Vim, with an enhanced results list.
" https://github.com/mileszs/ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag') " use ag replace ack
  let g:ackprg = 'ag --vimgrep' 
endif
nnoremap <leader>F :Ack!<space>

"==============================================================================
" rainbow是一个提供嵌套括号高亮的一个工具。
"==============================================================================
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"==============================================================================
" Yggdroot/indentLine
" A vim plugin to display the indention levels with thin vertical lines
"==============================================================================
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"==============================================================================
" 有道云翻译
" 在普通模式下，按 ctrl+t， 会翻译当前光标下的单词；
" 在 visual 模式下选中单词或语句，按 ctrl+t，会翻译选择的单词或语句；
"点击引导键再点y，d，可以在命令行输入要翻译的单词或语句；
"==============================================================================
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap  <leader>yd     :<C-u>Yde<CR>

"==============================================================================
" Plug 'pechorin/any-jump.vim'
" Normal mode: Jump to definition under cursor
"==============================================================================
nnoremap <leader>j :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>
" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

"==============================================================================
"==============================================================================
"" By default, it will be triggered by `ENTER` in insert mode.
" set this to 1 to use `CTRL+ENTER` instead, and keep the  
" default `ENTER` behavior unchanged.
let g:rtf_ctrl_enter = 0
" Enable formatting when leaving insert mode
let g:rtf_on_insert_leave = 1
" :RTFormatEnable 开启

"==============================================================================
" Plug 'nvim-lua/plenary.nvim'                    " ind, Filter, Preview, Pick. All lua, all the time.
" Plug 'nvim-telescope/telescope.nvim'
"==============================================================================
call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))

"==============================================================================
" Plug 'KarimElghamry/vim-auto-comment'
" auto comment script
"==============================================================================
" let g:default_inline_comment = '#'
" let g:inline_comment_dict = {
" 		\'//': ["js", "ts", "cpp", "c", "dart"],
" 		\'#': ['py', 'sh','snippets'],
" 		\'"': ['vim'],
" 		\}
let g:default_block_comment = '/*'
let g:block_comment_dict = {
		\'/*': ["js", "ts", "cpp", "c", "dart"],
		\'"""': ['py'],
		\}
let g:autocomment_map_keys = 0
" " Inline comment mapping <Ctrl + />
" vnoremap <silent><C-_> :AutoInlineComment<CR>
" nnoremap <silent><C-_> :AutoInlineComment<CR>
" " Block comment mapping <, + />
" vnoremap <silent><leader>/ :AutoBlockComment<CR>
" nnoremap <silent><leader>/ :AutoBlockComment<CR>
vnoremap <silent><C-_> :AutoBlockComment<CR>
nnoremap <silent><C-_> :AutoBlockComment<CR>

"==============================================================================
" Vim Better Whitespace Plugin
"==============================================================================
let g:better_whitespace_ctermcolor='gray'
let g:better_whitespace_guicolor  ='gray'
vnoremap <silent><leader>c :StripWhitespace<CR>
nnoremap <silent><leader>c :StripWhitespace<CR>

"==============================================================================
"Plug 'mbbill/undotree' "撤销历史
"==============================================================================
nnoremap <leader>u :UndotreeToggle<CR>

"==============================================================================
"The ultimate snippet solution for Vim
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"==============================================================================
let g:UltiSnipsExpandTrigger       = "<c-b>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
"let g:UltiSnipsSnippetsDir="~/.vim/myUltiSnips"
let g:UltiSnipsSnippetDirectories  = ["myUltiSnips","UltiSnips"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"==============================================================================
"VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
"Plug 'lervag/vimtex'
"==============================================================================
"let g:tex_flavor                = 'latex' " Default tex file format
let g:vimtex_view_method        = 'skim'  " Choose which program to use to view PDF file
let g:vimtex_view_skim_sync     = 1       " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate = 1       " Value 1 allows change focus to skim after command `:VimtexView` is given
"编译报错自动弹出错误窗口（quickfix window）设置为 0
"可以使用命令 :copen 来手动打开错误窗口
let g:vimtex_quickfix_mode      = 0 
" 隐藏功能 <无法工作>
"set conceallevel=0
"let g:tex_conceal='abdmg'
