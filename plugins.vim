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
" Plug 'anuvyklack/pretty-fold.nvim'

" Theme
Plug 'Mofiqul/dracula.nvim', { 'as': 'dracula' }
Plug 'tribela/vim-transparent'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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
\ 'coc-eslint',
\ 'coc-stylelint',
\ 'coc-svelte',
\ 'coc-java',
\ 'coc-go'
\]

" Plugin configurations
" Assuming a plugin manager like vim-plug is used

" Prettier Configuración with ALE
" Configura ALE para los lenguajes y frameworks que mencionaste
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'csharp': ['omnisharp'],
  \ 'rust': ['rustfmt'],
  \ 'python': ['autopep8'],
  \ 'go': ['gofmt'],
  \ 'php': ['phpcbf'],
  \ 'angular': ['prettier'],
  \ 'java': ['google_java_format'],
  \ 'lua': ['lua-format'],
  \ 'powershell': ['prettier'],
  \ 'dotnet': ['dotnet-format'],
  \ 'tsx': ['prettier'],
  \ 'matlab': ['matlab_formatter'],
  \ 'ruby': ['rufo'],
  \ 'sql': ['sqlformat'],
  \ 'json': ['prettier'],
  \ }
" Habilita ALE para formatear automáticamente al guardar
let g:ale_fix_on_save = 1
" Configura ALE para aplicar trim, eliminar líneas finales y ajustar la indentación
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace', 'prettier']
" Use ALE and also some plugin 'foobar' as completion sources for all code.
let g:ale_completion_enabled = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Theme configuration
let g:dracula_colorterm = 0
colorscheme dracula
" Cambiar el color de fondo y el color de fuente en modo visual
highlight Visual ctermbg=gray guibg=gray
highlight Visual ctermfg=white guifg=white

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

" Markdown Configuration
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['csharp=cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
