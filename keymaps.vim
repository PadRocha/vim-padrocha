" keymaps.vim
" Configuración de atajos de teclado para Neovim

" Remapear la tecla líder a una coma
let mapleader = ','

" Comandos con atajos de teclado
" Seleccionar todo el texto
inoremap <C-e> <ESC> :%y+<CR>==gi
nnoremap <C-e> :%y+<CR>
" Atajo para abrir una nueva pestaña
nnoremap <A-t> :tabnew<CR>
" Atajo para cerrar la pestaña actual
nnoremap <A-w> :close<CR>
" Atajo para cambiar a la siguiente pestaña
nnoremap <A-Right> :tabnext<CR>
" Atajo para cambiar a la pestaña anterior
nnoremap <A-Left> :tabprevious<CR>
" Mover una línea hacia arriba
inoremap <A-Up> <ESC> :m .-2<CR>==gi
nnoremap <A-Up> :m .-2<CR>
vnoremap <A-Up> :m '<-2<CR>gv=gv
" Mover una línea hacia abajo
inoremap <A-Down> <ESC> :m .+1<CR>==gi
nnoremap <A-Down> :m .+1<CR>
vnoremap <A-Down> :m '>+1<CR>gv=gv
" Duplicar el panel actual verticalmente
nnoremap <A-d> :vsplit<CR>
" Duplicar el panel actual horizontalmente
nnoremap <A-s> :split<CR>
" Atajo para mover el foco al panel superior
nnoremap <A-k> <C-W>k
" Atajo para mover el foco al panel inferior
nnoremap <A-j> <C-W>j
" Atajo para mover el foco al panel de la derecha
nnoremap <A-l> <C-W>l
" Atajo para mover el foco al panel de la izquierda
nnoremap <A-h> <C-W>h
" Aumentar altura del panel actual
inoremap <C-k> <ESC> :resize +1<CR>==gi
nnoremap <C-k> :resize +1<CR>
" Disminuir altura del panel actual
inoremap <C-j> <ESC> :resize -1<CR>==gi
nnoremap <C-j> :resize -1<CR>
" Aumentar ancho del panel actual
inoremap <C-l> <ESC> :vertical resize +1<CR>==gi
nnoremap <C-l> :vertical resize +1<CR>
" Disminuir ancho del panel actual
inoremap <C-h> <ESC> :vertical resize -1<CR>==gi
nnoremap <C-h> :vertical resize -1<CR>
" Atajo para mover el panel al extremo superior
nnoremap <C-A-k> :wincmd K<CR>
" Atajo para mover el panel al extremo inferior
nnoremap <C-A-j> :wincmd J<CR>
" Atajo para mover el panel al extremo izquierdo
nnoremap <C-A-h> :wincmd H<CR>
" Atajo para mover el panel al extremo derecho
nnoremap <C-A-l> :wincmd L<CR>
" Atajo para undo
nnoremap <C-z> :undo<CR>
" Atajo para redo
nnoremap <C-y> :redo<CR>
" Atajo para abrir NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
" Atajo para que NERDTree abra en el directorio
nnoremap <C-S-b> :NERDTreeCWD<CR>
" Atajo para expandir automáticamente los directorios hasta encontrar el archivo
nnoremap <C-A-b> :NERDTreeFind<CR>
" Atajo para buscar en todo el directorio
inoremap <A-f> <ESC> :Rg<CR>
nnoremap <A-f> :Rg<CR>
" Atajo para buscar solo en los buffer abiertos
inoremap <A-F> <ESC> :Lines<CR>
nnoremap <A-F> :Lines<CR>
" Atajo para mostar todas las marcas
inoremap <A-m> <ESC> :Marks<CR>
nnoremap <A-m> :Marks<CR>
" Atajo para mostrar todos los buffers
inoremap <A-b> <ESC> :Buffers<CR>
nnoremap <A-b> :Buffers<CR>

" Comandos con remapeos
" Atajo para agregar una marca de desplazamiento
nnoremap <leader>m :mark<Space>
" Atajo para activar FZF
nnoremap <silent> <leader>f :Files<CR>
" Atajo para desactivar el resaltado de búsqueda
nnoremap <silent> <leader>n :nohlsearch<CR>

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
