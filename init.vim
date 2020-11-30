" Basic settings
noremap j k
noremap k j
noremap J 5k
noremap K 5j
noremap H 5h
noremap L 5l
noremap ; :
noremap vv <c-v>

map W :w<CR>
map q :q<CR>
map Q :q!<CR>
map Z :nohlsearch<CR>
map X :x<CR>

let mapleader="`"

syntax on
set number 
set relativenumber
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set nu
set ruler
set hlsearch
set backspace=2
set scrolloff=5


" ===
" ===  Compile Function
" ===
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc



" open file in vim







exec "nohlsearch"

" split windows settings
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>
map sj :set nosplitbelow<CR>:split<CR>

map <LEADER>k <C-w>j
map <LEADER>j <C-w>k 
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>


" ===
" ===  New tab settings
" ===
map new :tabe<CR>
map eh :-tabnext<CR>
map el :+tabnext<CR>

" back to where I used to be
map bo <C-o>
map bi <C-i>


" Plug-in settings
set nocompatible
filetype on
filetype indent on 
filetype plugin on
filetype plugin indent on

" Encoding settings
set encoding=utf-8

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" indentLine settings 
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进
set conceallevel=0

" airline settings
" let g:lightline.enable.tabline = 0

" dashboard settings
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_shortcut={
		\ 'last_session'       : 'SPC s l',
    \ 'find_history'       : 'SPC f h',
    \ 'find_file'          : 'SPC f f',
		\ 'new_file'           : 'SPC c n',
    \ 'change_colorscheme' : 'SPC t c',
    \ 'find_word'          : 'SPC f a',
		\ 'book_marks'         : 'SPC f b',
		\ }

let g:dashboard_default_executive ='fzf'



" ===
" ===  Nerdtree settings
" === 
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers = 0 " 是否显示行号
let g:NERDTreeHidden = 1     "不显示隐藏文件
" Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
noremap tt :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键

" vim-buffet settings
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

" neovim-plug settings
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
" Plug 'iamcco/markdown-preview.nvim'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-github'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-match-highlight'
" Plug 'ncm2/ncm2-markdown-subscope'
" Plug 'ncm2/ncm2-racer'
" Plug 'ncm2/ncm2-pyclang'
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'ObserverOfTime/ncm2-jc2'
Plug 'neoclide/coc.nvim'
" Plug 'Yggdroot/indentLine'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bagrat/vim-buffet'
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'yaocccc/vim-comment'


call plug#end()

" FZF settings
" noremap <D-f> :FZF<CR>
" noremap <D-a> :Ag<CR>
" noremap <D-b> :Buffers<CR>
" noremap <D-h> :History:<CR> 

" ===
" ===  Trigger configuration
" ===
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<leader>e"
let g:UltiSnipsJumpBackwardTrigger="<leader>n"
let g:UltiSnipsSnippetDirectories = [$HOME. '/.config/nvim/ultisnips/', 'ultisnips']

" ===
" ===  Coc.nvim Settings
" ===
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp']

set hidden
set updatetime=100
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <leader>j coc#refresh()

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>d to show documentation in preview window.
nnoremap <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@


" ===
" ===  Markdown keybingds  Settings
" ===
autocmd  Filetype markdown  inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd  Filetype markdown  inoremap ,n ---<Enter><Enter>
autocmd  Filetype markdown  inoremap ,b **** <++><Esc>F*hi
autocmd  Filetype markdown  inoremap ,s ~~~~ <++><Esc>F~hi
autocmd  Filetype markdown  inoremap ,i ** <++><Esc>F*i
autocmd  Filetype markdown  inoremap ,d `` <++><Esc>F`i
autocmd  Filetype markdown  inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd  Filetype markdown  inoremap ,h ====<Space><++><Esc>F=hi
autocmd  Filetype markdown  inoremap ,a ![](<++>) <++><Esc>F[a
autocmd  Filetype markdown  inoremap ,p [](<++>) <++><Esc>F[a
autocmd  Filetype markdown  inoremap ,1 #<Space><++><Esc>kA
autocmd  Filetype markdown  inoremap ,2 ##<Space><++><Esc>kA
autocmd  Filetype markdown  inoremap ,3 ###<Space><++><Esc>kA
autocmd  Filetype markdown  inoremap ,4 ####<Space><++><Esc>kA
autocmd  Filetype markdown  inoremap ,l --------<Enter>


" ===
" ===  Markdown Priview Settings
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'Safari'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_filetypes = ['markdown']
" Key mappings
nmap <leader>b <Plug>MarkdownPreview
nmap <leader>s <Plug>MarkdownPreviewStop
" nmap <leader>s <Plug>MarkdownPreview

" ===
" === vim-table-mode
" ===
map tm :TableModeToggle<CR>


" ===
" ===  vim-visual-multi
" ===
let g:VM_maps = {}

let g:VM_maps['Find Under']         = '<Space>f'
let g:VM_maps['Find Subword Under'] = '<Space>f'
let g:VM_maps['Find Next'] = ''
let g:VM_maps['Find Prev'] = ''
let g:VM_maps['Remove Region'] = 'q'
let g:VM_maps['Skip Region'] = '<Space>n'
let g:VM_maps['Undo'] = '<Space>u'
let g:VM_maps['Redo'] = '<Space>r'

" ===
" ===  vim-comment
" ===
nmap <silent> ?? :NToggleComment<CR>
xmap <silent> /  :<c-u>VToggleComment<CR>
smap <silent> /  <c-g>:<c-u>VToggleComment<CR>
xmap <silent> ?  :<c-u>CToggleComment<CR>
smap <silent> ?  <c-g>:<c-u>CToggleComment<CR>

" set comments of filename suffix
let g:vim_line_comments = { 'vim': '"', 'vimrc': '"',
                         \  'js': '//', 'ts': '//',
                         \  'java': '//', 'class': '//',
                         \  'c': '//', 'h': '//',
												 \  'cpp': '//'}

let g:vim_comment_gap = 1









