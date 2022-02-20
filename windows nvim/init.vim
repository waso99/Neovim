
"------------------------------------------------------plugins

call plug#begin()
Plug 'preservim/NERDTree'
"Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
"Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
call plug#end()

"source ~/AppData/local/nvim/xstatusline.vim
"------------------------------------------------------
    if has('termguicolors')
      set termguicolors
    endif
    set background=dark
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_disable_italic_comment = 1
    colorscheme gruvbox-material


"------------------------------------------------------statusline
" status bar colors
" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#fb4934 ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#b8bb26 ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8ec07c ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%2*                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%4*   
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\[%{&ff}]                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%4*
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%2*                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 guibg=#a89984 guifg=#282828
hi User2 guibg=#504945 guifg=#a89984
hi User3 guibg=#3C3836 guifg=#a89984
hi User4 guibg=#3C3836 guifg=#504945


"-----------------------------------------------------tabline

function! CustomizedTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
        let s .= '%*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let file = bufname(buflist[winnr - 1])
        let file = fnamemodify(file, ':p:t')
        if file == ''
            let file = '[No Name]'
        endif
        let s
         .= file
        let s .= ' '
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction

" Always show the tablilne 
set stal=2
set tabline=%!CustomizedTabLine()


"set showtabline=2
"set tabline='%#TabLineItemSel# %{gutentags#statusline("[ ", " ☢ ]  ")}'
"set tabline=%<%t%=\ %2*%{tabpagenr()\ .\ \":\ \"\ .\ winnr()\ .\ \"\of\ \"\ .\ winnr(\"$\")}
"set tabline="%1T"

"------------------------------------------------------transparent background
hi normal guibg=000000
