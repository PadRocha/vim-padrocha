" Inicialización de vim-plug
call plug#begin('~/AppData/Local/nvim/plugged')

" Autocompletion and language server support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Elegant status bar
Plug 'vim-airline/vim-airline'

" File explorer
Plug 'preservim/nerdtree'

" Commenting utility
Plug 'tpope/vim-commentary'

" Surrounding utility
Plug 'tpope/vim-surround'

" Git integration
Plug 'tpope/vim-fugitive'

" Linting and error checking
Plug 'dense-analysis/ale'

" CSV handling
Plug 'chrisbra/csv.vim'

" Markdown editing
Plug 'plasticboy/vim-markdown'

" Alignment utility
Plug 'godlygeek/tabular'

" Syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'

" Additional plugins based on user preferences
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
" Plug 'phpactor/phpactor'
Plug 'rakr/vim-one'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-dadbod'
Plug 'joeveiga/ng.nvim'
Plug 'anuvyklack/pretty-fold.nvim'

" Theme
Plug 'Mofiqul/dracula.nvim', { 'as': 'dracula' }
Plug 'tribela/vim-transparent'

" Snippets
Plug 'SirVer/ultisnips'

" Finalizar la inicialización de vim-plug
call plug#end()

" Configuración de extensiones CoC
let g:coc_global_extensions = [
\ 'coc-clangd',
\ 'coc-json',
\ 'coc-rls',
\ 'coc-css',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-powershell',
\ 'coc-sh',
\ 'coc-omnisharp',
\ 'coc-phpls',
\ 'coc-sql',
\ 'coc-angular',
\ 'coc-markdownlint',
\ 'coc-git',
\ 'coc-explorer',
\ 'coc-snippets',
\ 'coc-yaml',
\ 'coc-docker',
\ 'coc-vetur',
\ 'coc-emmet',
\ 'coc-prettier',
\ 'coc-eslint',
\ 'coc-stylelint',
\ 'coc-svelte',
\ 'coc-java',
\ 'coc-go'
\]

" Plugin configurations
" Assuming a plugin manager like vim-plug is used

" Theme configuration
let g:dracula_colorterm = 0
colorscheme dracula

" NERDTree settings
" Set the width of the NERDTree window relative to the current window width
let g:NERDTreeWinSize = 40
let g:NERDTreeFileLines = 1
let g:NERDTreeDirArrowExpandable="📁"
let g:NERDTreeDirArrowCollapsible="📂"

" Configuración de fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'relative': v:true, 'yoffset': 0.5, 'xoffset': 0.5, 'border': 'rounded' } }
" Ajusta el color de la interfaz de FZF
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-s': 'split',
  \ 'alt-d': 'vsplit' }

" -m --ansi --pointer=👉 --marker=📍 --layout=reverse --info=inline --preview "bat --style=full,changes --plain --theme=Dracula --color=always {}"
" rg --files --hidden --follow --smart-case --vimgrep -n --glob=!.git/ --glob=!node_modules/ --glob=!vendor/ --glob=!undo/ --glob=!plugged/ --glob=!dist/
let g:globs = ' --glob=!.git/ --glob=!node_modules/ --glob=!vendor/ --glob=!undo/ --glob=!plugged/ --glob=!dist/ '

command! -bang -nargs=? Rg
                  \ call fzf#vim#grep2('rg -i -n -L -.'.g:globs.'--no-ignore-vcs', <q-args>, {}, 0)
command! -bang -nargs=? -complete=dir Files
                  \ call fzf#vim#files(<q-args>, 
                  \ {'options': ['--preview', 'bat --style=full,changes --plain --theme=Dracula --color=always {}']}, <bang>0)

" Configuración de air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Transparent Configuration
" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']
" Pmenu
let g:transparent_groups += ['Pmenu']
" coc.nvim
let g:transparent_groups += ['NormalFloat', 'CocFloating']
