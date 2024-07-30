" Neovim init.vim congiguration file

" General settings
set showmatch                 " show matching
set ignorecase                " case insensitive
set mouse=v                   " middle-click paste with
set hlsearch                  " highlight search
set incsearch                 " incremental search
set tabstop=2                 " number of columns occupied by a tab
set softtabstop=2             " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                 " converts tabs to white space
set shiftwidth=2              " width for autoindents
set autoindent                " indent a new line the same amount as the line just typed
set number                    " add line numbers
set wildmode=longest,list     " get bash-like tab completions
set list
set listchars+=eol:$
" set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on     " allow auto-indenting depending on file type
syntax on                     " syntax highlighting
set mouse=a                   " enable mouse click
set clipboard=unnamedplus     " using system clipboard
filetype plugin on
set relativenumber
set cursorline                " highlight current cursorline
set ttyfast                   " Speed up scrolling in Vim
set completeopt=preview,menu  " configura Neovim para mostrar un menú emergente de autocompletado con vista previa y opciones disponibles.
set autoread                  " Neovim monitorea automáticamente los archivos abiertos en busca de cambios externos.
" set spell                   " enable spell check (may need to download language package)
" set noswapfile              " disable creating swap file

" Set Python 3
let g:python3_host_prog = 'C:\Users\proch\AppData\Local\Programs\Python\Python312\python.exe'

" Autocommands para formatear al guardar
augroup format_on_save
  autocmd!
  autocmd BufWritePre *.js :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.ts :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.tsx :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.json :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.md :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.html :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.css :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.scss :CocCommand editor.action.formatDocument
  autocmd BufWritePre *.lua :CocCommand editor.action.formatDocument
augroup END

" Additional language-specific configurations can be added here

source C:\Users\proch\AppData\Local\nvim\plugins.vim
source C:\Users\proch\AppData\Local\nvim\keymaps.vim
source C:\Users\proch\AppData\Local\nvim\coc-config.vim
