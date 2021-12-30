set nocompatible
filetype off

" Highlight extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

set rtp+=~/.vim_runtime/my_plugins/Vundle.vim
call vundle#begin('~/.vim_runtime/my_plugins')

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'hashivim/vim-terraform'
Plugin 'vim-syntastic/syntastic'
Plugin 'juliosueiras/vim-terraform-completion'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'hashicorp/terraform-ls'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tarekbecker/vim-yaml-formatter'
Plugin 'sheerun/vim-polyglot'
Plugin 'c9s/helper.vim'
Plugin 'c9s/treemenu.vim'
Plugin 'c9s/vikube.vim'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-sleuth'
Plugin 'andrewstuart/vim-kubernetes'
Plugin 'fatih/hclfmt'
Plugin 'chr4/nginx.vim'
" Plugin 'rhadley-recurly/vim-terragrunt'

" NERDTree and extensions
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'PhilRunninger/nerdtree-visual-selection'

Plugin 'junegunn/vim-github-dashboard'
Plugin 'kevinoid/vim-jsonc'


call vundle#end()

"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=/Users/ryan.shatford/.cache/data/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/ryan.shatford/.vim_runtime/my_plugins')

" Let dein manage dein
call dein#add('/Users/ryan.shatford/.cache/data/repos/github.com/Shougo/dein.vim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here like this:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
"End dein Scripts-------------------------

" vim-terraform options
" let g:terraform_fmt_on_save=1        " format terraform on save
let g:terraform_align=1              " override vim indenting for tf files
let g:terraform_commentstring='//%s' " comment string definition

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
"  set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 1

" YAML indent control
let g:yaml_formatter_indent_collection=1

if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized

" Options
set expandtab
set tabstop=2
set softtabstop=2
set mouse=a
" Fuzzy search"
set rtp+=/usr/local/opt/fzf

" Kubernetes Linter
augroup K8SLinter
  " clear current group
    autocmd!

  " define makeprg
  " this could be a BufNewFile,BufRead event matching a specific pattern in the path
  autocmd FileType yaml setlocal makeprg=kubeval

  " run :make automatically on :write
  " again the paths could be more specific
  autocmd BufWritePost *.yml silent make! <afile> | silent redraw!

  " open the quickfix window automatically if there are valid entries in the quickfix list
  autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" Read in the SortGroup command
if filereadable("sort_group.vim")
  source sort_group.vim
endif

let g:snipMate = { 'snippet_version': 1 }

" Github dashboard authentication
let g:github_dashboard = { 'username': 'clear-ryan', 'password': $GITHUB_TOKEN  }"
if !has('gui_running')
  let g:github_dashboard['emoji'] = 1
endif

" Go Language Server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

