:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin("~/.config/nvim/plugged")
Plug 'windwp/nvim-autopairs'
Plug 'folke/tokyonight.nvim'
Plug 'https://github.com/junegunn/fzf.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'natebosch/dartlang-snippets'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'https://github.com/airblade/vim-gitgutter'
" Plug 'tmsvg/pear-tree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/ryanoasis/vim-devicons'
" Plug 'github.com/alan/vim-closetag'
" Plug 'https://github.com/RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/iamcco/coc-flutter'
Plug 'https://github.com/dart-lang/dart-vim-plugin'
Plug 'https://github.com/mefercs/flutter-snippets-for-neovim'
Plug 'https://github.com/ap/vim-css-color'
" Plug 'dart-lang/dart-vim-plugin'
Plug 'hoob3rt/lualine.nvim'
Plug 'OmniSharp/omnisharp-vim'
" Plug 'fatih/vim-go'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'xiyaowong/nvim-transparent'
Plug 'pangloss/vim-javascript'

" Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

set encoding=UTF-8

call plug#end()

let mapleader = ","

autocmd VimEnter * TSEnable highlight

nnoremap <C-f> :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <C-c> :DartFmt<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>gg :Ag<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>gf :GitFiles<CR>
nnoremap <Leader>hh :History<CR>
nnoremap <Leader>t :TransparentToggle<CR>

:colorscheme molokai
" :colorscheme afterglow
" :colorscheme deepspace


" :TransparentEnable

" autocmd VimEnter * TransparentEnable

" display colors
" :HexokinaseTurnOn
let g:Hexokinase_highlighters = [ 'virtual' ]

" All possible values
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr> <Up> coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"

" inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
inoremap <silent><expr> <A-q> coc#pum#visible() ? coc#pum#confirm() : "\<A-q>"

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> <c-alt-K> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

  " \ 'coc-tsserver',

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

  " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" format flutter code on save
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 100']

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" flutter related stuff
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :CocCommand flutter.devices<CR>
nnoremap <leader>fr :CocCommand flutter.run <CR>
nnoremap <leader>fu :CocCommand flutter.upgrade <CR>
" nnoremap <leader>fR :CocCommand flutter.lsp.restart <CR>
nnoremap <leader>fo :new output:///flutter-dev <CR>
nnoremap <leader>o :CocCommand workspace.showOutput <CR>
nnoremap <leader>fpg :CocCommand flutter.pub.get <CR>
			
" run on my samsung galaxy S9 phone
nnoremap <leader>frs :CocCommand flutter.run -d 29cac59d39047ece <CR>
" run on my xiaomi mi 10 lite phone
nnoremap <leader>frx :CocCommand flutter.run -d f2c83f66 <CR>
" run on my pixel 3 emulator
nnoremap <leader>frp :CocCommand flutter.run -d 192.168.56.102:5555 <CR>
" run on my pixel 3a emulator
nnoremap <leader>fra :CocCommand flutter.run -d 192.168.56.103:5555 <CR>

nnoremap <leader>fh :CocCommand flutter.dev.hotReload <CR>
nnoremap <leader>fq :CocCommand flutter.dev.quit <CR>
nnoremap <leader>fb :CocCommand flutter.dev.debugProfileWidgetBuilds <CR>
nnoremap <leader>fs :CocCommand flutter.dev.screenshot <CR>
nnoremap <leader>f :CocCommand flutter.dev.hotRestart <CR>


" go related stuff
nnoremap <leader>gr :GoRun <CR>
nnoremap <leader>gt :GoTest <CR>

nnoremap <leader>pi :PlugInstall <CR>
nnoremap <leader>pc :PlugClean <CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
