" ~/.config/nvim/colors/catppuccin-mocha.vim
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Catppuccin Mocha palette (hex converted to Vim's format)
let s:base     = '#1e1e2e'
let s:text     = '#cdd6f4'
let s:red      = '#f38ba8'
let s:green    = '#a6e3a1'
let s:blue     = '#89b4fa'
let s:overlay1 = '#7f849c'
" Apply highlights
exec 'highlight Normal guifg=' . s:text . ' guibg=' . s:base
exec 'highlight Comment guifg=' . s:overlay1 . ' gui=italic'
exec 'highlight String guifg=' . s:green
exec 'highlight Identifier guifg=' . s:blue
" ... add more groups (see `:help highlight-groups`) ...

" Set the colorscheme
colorscheme catppuccin-mocha
highlight LineNr       guifg=#89b4fa
highlight CursorLineNr guifg=#7395d6 
set cursorline
set cursorlineopt=number
