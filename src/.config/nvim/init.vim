" vim:ft=vim :
" vint: -ProhibitAutocmdWithNoGroup
" vint: -ProhibitSetNoCompatible


if 0 | endif

if has("gui_vimr")
	:cd ~/Documents
endif

if has('nvim')
	let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
else
	let vimplug_exists=expand('~/.vim/autoload/plug.vim')
endif

function! InstallPlug(plugpath)
	if !filereadable(a:plugpath)
		if !executable("curl")
			echoerr "You have to install curl or first install vim-plug yourself!"
			execute "q!"
		endif
		echo 'Installing vim-plug...'
		execute '!curl -fL --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ' . a:plugpath
		"silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
		"let g:not_finish_vimplug = "yes"
		autocmd VimEnter * PlugInstall
	endif
endfunction

" :PlugInstall [name ...] [#threads]	- Install plugins
" :PlugUpdate [name ...] [#threads]		- Install or update plugins
" :PlugClean[!]												- Remove unused directories (bang version will clean without prompt)
" :PlugUpgrade												- Upgrade vim-plug itself
" :PlugStatus													- Check the status of plugins
" :PlugDiff														- Examine changes from the previous update and the pending changes
" :PlugSnapshot[!] [output path]			- Generate script for restoring the current snapshot of the plugins

call InstallPlug(vimplug_exists)

"" Install vim-plug if required
"" Required:
call plug#begin(expand('~/.config/nvim/plugged'))
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	Plug 'aonemd/kuroi.vim'
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Autocomplition and debug
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	let g:deoplete#enable_at_startup = 1
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

	" FZF
	Plug '~/.homebrew/opt/fzf'
	Plug 'junegunn/fzf.vim'

	"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

	"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
	"Plug 'Yggdroot/LeaderF-marks'
	"Plug 'tamago324/LeaderF-filer'

	" TMUX integration
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug 'roxma/vim-tmux-clipboard'
	Plug 'wellle/tmux-complete.vim'

	" Floating terminal
	Plug 'voldikss/vim-floaterm'

	" Undo tree
	Plug 'simnalamburt/vim-mundo'

	" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
	Plug 'dense-analysis/ale'

	" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion
	Plug 'scrooloose/nerdcommenter'

	" Displaying thin vertical lines at each indentation level for code indented with spaces
	Plug 'Yggdroot/indentLine'

	" Better % navigate and highlight matching words modern matchit and matchparen replacement
	"Plug 'andymass/vim-matchup'
	" adds motions g%, [%, ]%, and z%

	" Plug 'kshenoy/vim-signature'
	" mx         - Toggle mark 'x' and display it in the leftmost column
	" dmx        - Remove mark 'x' where x is a-zA-Z

	" m,         - Place the next available mark
	" m.         - If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
	" m-         - Delete all marks from the current line
	" m<Space>   - Delete all marks from the current buffer
	" ]`         - Jump to next mark
	" [`         - Jump to prev mark
	" ]'         - Jump to start of next line containing a mark
	" ['         - Jump to start of prev line containing a mark
	" `]         - Jump by alphabetical order to next mark
	" `[         - Jump by alphabetical order to prev mark
	" ']         - Jump by alphabetical order to start of next line having a mark
	" '[         - Jump by alphabetical order to start of prev line having a mark
	" m/         - Open location list and display marks from current buffer

	" m[0-9]     - Toggle the corresponding marker !@#$%^&*()
	" m<S-[0-9]> - Remove all markers of the same type
	" ]-         - Jump to next line having a marker of the same type
	" [-         - Jump to prev line having a marker of the same type
	" ]=         - Jump to next line having a marker of any type
	" [=         - Jump to prev line having a marker of any type
	" m?         - Open location list and display markers from current buffer
	" m<BS>      - Remove all markers

	" Vim sugar for the UNIX shell commands
	Plug 'tpope/vim-eunuch'
	" :Delete         - Delete a buffer and the file on disk simultaneously.
	" :Unlink         - Like :Delete, but keeps the now empty buffer.
	" :Move           - Rename a buffer and the file on disk simultaneously.
	" :Rename         - Like :Move, but relative to the current file's containing directory.
	" :Chmod          - Change the permissions of the current file.
	" :Mkdir          - Create a directory, defaulting to the parent of the current file.
	" :Cfind          - Run find and load the results into the quickfix list.
	" :Clocate        - Run locate and load the results into the quickfix list.
	" :Lfind/:Llocate - Like above, but use the location list.
	" :Wall           - Write every open window. Handy for kicking off tools like guard.
	" :SudoWrite      - Write a privileged file with sudo.
	" :SudoEdit       - Edit a privileged file with sudo.

	" A Vim alignment plugin
	Plug 'junegunn/vim-easy-align'
	" https://github.com/junegunn/vim-easy-align

	" Provides insert mode auto-completion for quotes, parens, brackets
	Plug 'Raimondi/delimitMate'

	" Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

	" Enable repeating supported plugin maps with "."
	Plug 'tpope/vim-repeat'

	" Go Bundle
	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'golang' }
	Plug 'godoctor/godoctor.vim', { 'for': 'golang' }

	" Ansible Bundle
	Plug 'pearofducks/ansible-vim', {'for': 'ansible'}
	Plug 'danihodovic/vim-ansible-vault'

	" Helm Bundle
	Plug 'towolf/vim-helm', {'for': 'helm'}

	" Git Bundle
	Plug 'tpope/vim-fugitive'
	"Plug 'mhinz/vim-signify'
	Plug 'airblade/vim-gitgutter'

	" HashiCorp Bundle
	Plug 'hashivim/vim-hashicorp-tools', {'for': 'terraform'}

	" Logrotate Bundle
	Plug 'moon-musick/vim-logrotate', {'for': 'logrotate'}

	" Hugo Bundle
	Plug 'robertbasic/vim-hugo-helper'

	" Polyglot
	Plug 'sheerun/vim-polyglot'
call plug#end()


"" Global settings override
"let mapleader="\"
set guioptions=

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

set nocompatible								" Enables us Vim specific features
syntax on												" Enable syntax highlighting
filetype off										" Reset filetype detection first ...
filetype plugin indent on				" ... and enable filetype detection

set ttyfast											" Indicate fast terminal conn for faster redraw
set mouse=a											" Enable proper mouse selection

set history=1000
set undolevels=1000

set shell=/bin/zsh\ -i					" -i to load profile files. Enables $PATH, etc.

set encoding=utf-8							" Set default encoding to UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8

set autoread										" Automatically read changed files
set autowrite										" Automatically save before :next, :make etc.
set noswapfile									" Don't use swapfile
set nobackup										" Don't create annoying backup files
set fileformats=unix,dos,mac		" Prefer Unix over Windows over OS 9 formats

set wildignore+=*.bak,.hg,*.swp,__pycache__
set wildignore+=*/tmp/*,*.so,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.ico,*.pdf
set wildignore+=*.wav,*.mp4,*.mp3
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=_pycache_,.DS_Store,.vscode,.localized
set wildignore+=.cache,node_modules,package-lock.json,yarn.lock,dist,.git

set autoindent									" Enabile Autoindent
set shiftround									" Round indent to multiple of 'shiftwidth'. Applies to > and < commands.
set noexpandtab ci pi sts=2 ts=2 sw=2	" noexpandtab, copyindent, preserveindent, softtabstop=2, shiftwidth=2, tabstop=2
set wrap linebreak nolist				" Word wrap without line breaks
set backspace=indent,eol,start	" Makes backspace key more powerful.

set showtabline=2								" Always show tabline
set laststatus=2								" Show status line always

set incsearch										" Shows the match while typing
set hlsearch										" Highlight found searches
set ignorecase									" Search case insensitive...
set smartcase										" ... but not it begins with upper case

set noerrorbells								" No beeps
set visualbell									" At times when a beep would have occurred, the screen will flash instead
set number											" Show line numbers
set showcmd											" Show me what I'm typing
set splitright									" Vertical windows should be split to right
set splitbelow									" Horizontal windows should split to bottom

set hidden											" Buffer should still exist if window is closed
set updatetime=300							" Smaller updatetime for CursorHold & CursorHoldI
"set shortmess+=c								" Don't give |ins-completion-menu| messages
"set signcolumn=yes							" Always show signcolumns
set showmatch										" Show matching brackets by flickering
set noshowmode									" We show the mode with airline or lightline
"set completeopt=menu,menuone		" Show popup menu, even if there is one entry
set completeopt+=noselect
set pumheight=10								" Completion window max size
set nocursorcolumn							" Do not highlight column (speeds up highlighting)
set cursorline									" Highlight current line
set lazyredraw									" Wait to redraw

set confirm											" Confirm changes (Yes, No, Cancel) instead of error

"set wildmenu										" Visual autocomplete for command menu. Done by airline
"set wildmode=list:longest,full

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Create new buffer
nnoremap <leader>N :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>


""""""""""
"" Functions
" toggle between number and relativenumber
function! ToggleNumber()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunc

" Toggle spell with a language
function! ToggleSpell(lang)
	if !exists('b:old_spelllang')
		let b:old_spelllang = &spelllang
		let b:old_spellfile = &spellfile
		let b:old_dictionary = &dictionary
	endif
	let l:newMode = ''
	if !&l:spell || a:lang != &l:spelllang
		setlocal spell
		let l:newMode = 'spell'
		execute 'setlocal spelllang=' . a:lang
		execute 'setlocal spellfile=' . '~/.vim/spell/' . matchstr(a:lang, '[a-zA-Z][a-zA-Z]') . '.' . &encoding . '.add'
		execute 'setlocal dictionary=' . '~/.vim/spell/' . a:lang . '.' . &encoding . '.dic'
		let l:newMode .= ', ' . a:lang
	else
		setlocal nospell
		let l:newMode = 'nospell'
		execute 'setlocal spelllang=' . b:old_spelllang
		execute 'setlocal spellfile=' . b:old_spellfile
		execute 'setlocal dictionary=' . b:old_dictionary
	endif
	return l:newMode
endfunction
nnoremap <leader>gb :call ToggleSpell("en_gb")<CR> "Toggle English spell
nnoremap <leader>uk :call ToggleSpell("uk_ua")<CR> "Toggle Ukraine spell

" Floating window with borders
function! OpenFloatingWindow()
	let width = min([&columns - 4, max([80, &columns - 20])])
	let height = min([&lines - 4, max([20, &lines - 10])])
	let top = ((&lines - height) / 2) - 1
	let left = (&columns - width) / 2
	let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
	let top = "╭" . repeat("─", width - 2) . "╮"
	let mid = "│" . repeat(" ", width - 2) . "│"
	let bot = "╰" . repeat("─", width - 2) . "╯"
	let lines = [top] + repeat([mid], height - 2) + [bot]
	let s:buf = nvim_create_buf(v:false, v:true)
	call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
	call nvim_open_win(s:buf, v:true, opts)
	set winhl=Normal:Floating
	let opts.row += 1
	let opts.height -= 2
	let opts.col += 2
	let opts.width -= 4
	call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
	au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Hunk stage and stage commit
function! HunkStageAndCommit() abort
	:GitGutterStageHunk
	:Gcommit
endfunction
nnoremap <leader>hc :call HunkStageAndCommit()<CR>


""""""""""
"" Configuration groups
augroup FileType go
	au!
	set runtimepath+=$GOPATH/src/github.com/golang/lint/misc/vim
	let g:go_def_mapping_enabled = 0
	let g:go_def_mode='gopls'
	let g:go_info_mode='gopls'

	let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
	let go_metalinter_autosave = 1
	let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
	let g:go_metalinter_deadline = '5s'
	let g:go_fmt_command = 'goimports'

	let g:go_snippet_case_type = 'camelcase'

	let g:go_addtags_transform = 'snakecase'

	let g:go_highlight_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	" let g:go_highlight_operators = 1
	" let g:go_highlight_extra_types = 1
	let g:go_highlight_build_constraints = 1

	let g:go_auto_sameids = 1
	let g:go_auto_type_info = 1
augroup END

augroup dotFiles
	au!
	au BufRead,BufNewFile ~/.Files/* nnoremap <leader><F9> :FloatermNew! --autoclose=1 _files_dot_install && exit <CR><CR> | source $MYVIMRC
augroup END

augroup sshconfig
	au!
	au BufRead,BufNewFile *.sshconfig set syntax=sshconfig
augroup END

augroup shellfile
	au!
	au FileType sh nnoremap <leader><F12> :FloatermNew! --autoclose=1 shellcheck %<CR>
augroup END

augroup vagrantfile
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
	au FileType ruby nnoremap <leader><F9> :FloatermNew! --autoclose=1 vagrant up<CR>
	au FileType ruby nnoremap <leader><F12> :FloatermNew! --autoclose=0 vagrant validate<CR>
augroup END

augroup dockerfile
	au!
	au FileType Dockerfile nnoremap <leader><F9> :FloatermNew! --autoclose=1 CONTAINERNAME=`basename $PWD \| tr '[:upper:]' '[:lower:]'`; docker build -t $CONTAINERNAME -f % .<CR><CR>
	au FileType Dockerfile nnoremap <leader><F12> :FloatermNew! --autoclose=0 hadolint %<CR>
augroup END

augroup arduinofile
	au!
	au BufRead,BufNewFile *.ino,*.pde,*ide set filetype=c++
augroup END

augroup helmfile
	au!
	au FileType helm nnoremap <leader><F12> :FloatermNew! --autoclose=0 helm install --dry-run --debug .<CR><CR>
augroup END

augroup k8sfile
	au!
	au BufRead,BufNewFile */.kube/config set filetype=yaml
	au BufRead,BufNewFile */templates/*.yaml,*/deployment/*.yaml,*/templates/*.tpl,*/deployment/*.tpl set filetype=yaml.gotexttmpl
	au FileType yaml nnoremap <leader><F12> :FloatermNew! --autoclose=0 kubectl --dry-run -o yam %<CR>
augroup END

augroup markdownfile
	au!
	au BufRead,BufNewFile *.markdown,*.mdown,*.mkdn,*.mkd,*.md,*.mdwn set filetype=markdown
augroup END

augroup ansiblefile
	au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
	au FileType yaml.ansible nnoremap <leader><F12> :FloatermNew! --autoclose=0 ansible-lint .<CR>
augroup END


""""""""""
"" liuchengxu/vim-clap
"let g:clap_layout = { 'width': '80%', 'height': '60%', 'row': '10%', 'col': '10%' }


""""""""""
"" ansible-vim
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = 'ob'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }


""""""""""
"" Yggdroot/indentLine
let g:indentLine_setColors = 0
" :IndentLinesToggle


""""""""""
"" junegunn/fzf.vim
" Search files
nnoremap <silent> <leader>e :Files<CR>
nnoremap <silent> <leader>ee :History<CR>

" Search in git files
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>gf :GFiles?<CR>

" Search in git commits
nnoremap <silent> <leader>bc :BCommits<CR>
nnoremap <silent> <leader>gc :Commits<CR>

" Search buffers
nnoremap <silent> <leader><leader> :Buffers<CR>

" Search windows
nnoremap <silent> <leader><leader><leader> :Windows<CR>

" Search mapps
nnoremap <silent> <leader>mm :Maps<CR>

" Search for marked lines
nnoremap <silent> <leader>` :Marks<CR>

" Search for ctags
nnoremap <silent> <leader>`` :BTags<CR>
nnoremap <silent> <leader>``` :Tags<CR>

" Search for lines in buffers
nnoremap <silent> <leader>f :BLines<CR>
nnoremap <silent> <leader>ff :Lines<CR>

" Search command and command history
nnoremap <silent> <leader>co :Commands<CR>
nnoremap <silent> <leader>ch :History:<CR>

" Search in search history
nnoremap <silent> <leader>sh :History/<CR>

" Search in snippets
nnoremap <silent> <leader>ss :Snippets<CR>

" Search with Ag
nnoremap <silent> <leader>ag :Ag<CR>

" Search with Rg
nnoremap <silent> <leader>rg :Rg<CR>

"" fzf layout: - down / up / left / right
"let g:fzf_layout = { 'down': '80%' }
"" Always enable preview window on the right with 60% width
"let g:fzf_preview_window = 'down:50%'

" fzf layout
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.8, 'yoffset': 1, 'border': 'top' } }
" Customize fzf colors to match your color scheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', "IncSearch"],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Label'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Conditional'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Hide statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" History directory
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(yellow)%h%C(red)%d%C(reset) - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Command for git grep
if executable('git')
	command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
endif

" Command for string search
if executable('rg')
	command! -bang -nargs=* Find call fzf#vim#grep('rg --no-ignore --hidden --follow --ignore-case --column --no-heading --line-number --color=always --glob "!.git/*" --glob "!.svn/*" --glob "!node_modules/*" --glob "!.undodir/*" --glob "!.session.vim" '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
endif


""""""""""
" Yggdroot/LeaderF
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_CommandMap = {'<C-S>': ['<Tab>']}
"let g:Lf_ShowDevIcons = 0

"" Search files
"nnoremap <silent> <leader>e :Leaderf file<CR>
"nnoremap <silent> <leader>ee :Leaderf file --cword<CR>
"" Similar to MRU
"nnoremap <silent> <leader>r :Leaderf mru<CR>
"nnoremap <silent> <leader>r :Leaderf mru --cword<CR>

"" Search open buffers
"nnoremap <silent> <leader><leader> :Leaderf buffer<CR>
"nnoremap <silent> <leader><leader><leader> :Leaderf buffer --cword<CR>

"" Search windows
"nnoremap <silent> <leader>ww :Leaderf window<CR>
"nnoremap <silent> <leader><leader>www :Leaderf window --cword<CR>

"" Search for marked lines
"nnoremap <silent> <leader>` :Leaderf marks<CR>
"nnoremap <silent> <leader>`` :Leaderf marks --cword<CR>

"" Search for lines in current buffer
"nnoremap <silent> <leader>f :Leaderf line<CR>
"nnoremap <silent> <leader>ff :Leaderf line --cword<CR>

"" Search command history
"nnoremap <silent> <leader>ch :Leaderf cmdHistory<CR>

"" Search in search history
"nnoremap <silent> <leader>sh :Leaderf searchHistory<CR>

"" Search built-in/user-defined Ex commands
"nnoremap <silent> <leader>co :Leaderf command<CR>

"" Search functions
"nnoremap <silent> <leader>fu :Leaderf function<CR>
"nnoremap <silent> <leader>ffu :Leaderf function --cword<CR>

" <C-R>	switch between fuzzy search mode and regex mode
" <C-F>	switch between full path search mode and name only search mode
" <C-V> OR <S-Insert>	paste from clipboard
" <C-U>	clear the prompt
" <C-W>	delete the word before the cursor in the prompt
" <C-J>	move the cursor downward in the result window
" <C-K>	move the cursor upward in the result window
" <Up>/<Down>	recall last/next input pattern from history
" <2-LeftMouse> OR <CR>	open the file under cursor or selected(when multiple files are selected)
" <C-X>	open in horizontal split window
" <C-]>	open in vertical split window
" <C-T>	open in new tabpage
" <F5>	refresh the cache
" <C-LeftMouse> OR <S-LeftMouse>	select consecutive multiple files
" <C-A>	select all files
" <C-L>	clear all selections
" <BS>	delete the preceding character in the prompt
" <Del>	delete the current character in the prompt
" <Home>	move the cursor to the begin of the prompt
" <End>	move the cursor to the end of the prompt
" <Left>	move the cursor one character to the left in the prompt
" <Right>	move the cursor one character to the right in the prompt
" <C-P>	preview the result
" <C-Up>	scroll up in the popup preview window
" <C-Down>	scroll down in the popup preview window


""""""""""
"" airblade/vim-gitgutter
" ]c					- jump to next hunk (change)
" [c					- jump to previous hunk (change)
" <leader>hs	- stage the hunk
" <leader>hu	- undo it
" <leader>hc	- stage the hunk and commit

" To stage part of any hunk:
" <leader>hp	- preview the hunk
" :wincmd P		- move to the preview window
" delete the lines you do not want to stage;
" stage the remaining lines: either write (:w) the window or stage via <leader>hs or :GitGutterStageHunk

" ic					- operates on all lines in the current hunk.
" ac					- operates on all lines in the current hunk and any trailing empty lines.


""""""""""
"" vim-floaterm
let g:floaterm_keymap_new = '<leader>{'
let g:floaterm_keymap_prev = '<leader>['
let g:floaterm_keymap_next = '<leader>]'
let g:floaterm_keymap_toggle = '<leader>}'

let g:floaterm_position = 'center'
let g:floaterm_type = 'floating'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9


""""""""""
"" vim-diminactive
"let g:diminactive_enable_focus = 1
"let g:diminactive_use_colorcolumn = 1
"let g:diminactive_use_syntax = 1


""""""""""
"" vim-tmux-navigator
" <ctrl-h>	- Left
" <ctrl-j>	- Down
" <ctrl-k>	- Up
" <ctrl-l>	- Right
" <ctrl-\>	- Previous split
let g:tmux_navigator_disable_when_zoomed = 1


""""""""""
"" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#csv#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0
"let airline#extensions#tmuxline#snapshot_file = '~/.tmux.theme'


""""""""""
"" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'


""""""""""
"" nerdcommenter
"let g:NERDCompactSexyComs = 1
"let g:NERDCommentEmptyLines = 1
"let g:NERDTrimTrailingWhitespace = 1
"let g:NERDToggleCheckAllLines = 1

" Comment out the current line or text selected in visual mode
" [count]<leader>cc
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa
" [count]<leader>c<space>
" Adds comment delimiters to the end of line and goes into insert mode between them
" <leader>cA
" Uncomments the selected line(s)
" [count]<leader>cu


""""""""""
"" dense-analysis/ale
" Recommended for macOS
let g:delve_backend = "native"
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%code%] %s [%severity%]'
let g:ale_ansible_ansible_lint_executable = 'ansible-lint -x ANSIBLE0204'
let g:ale_set_signs = 0
let g:delve_enable_syntax_highlighting = 1
let g:delve_new_command = "new"

" Hover window support
let g:ale_set_balloons = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_fixers = { '*': ['trim_whitespace', 'remove_trailing_lines'], 'javascript': ['prettier', 'eslint'], 'css' : ['prettier'], 'html' : ['prettier'], 'markdown' : ['prettier'], 'json': ['prettier'], 'sh': ['shfmt'], 'yaml': ['prettier'], 'c' : ['clang-format'], 'cpp' : ['clang-format'], 'python' : ['black'], 'go': ['gofmt'] }

let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

nmap <silent> <leader>[g  <Plug>(ale_previous_wrap)
nmap <silent> <leader>]g <Plug>(ale_next_wrap)


""""""""""
"" vim-mundo
nnoremap <silent> <leader>mt :MundoToggle<CR>
let g:mundo_close_on_revert = 1


""""""""""
"" tpope/vim-fugitive
" https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt
" Write to the current file's path and stage the results. When run in a work tree file, it is effectively git add. Elsewhere, it is effectively git-checkout. A great deal of effort is expended to behave sensibly when the work tree or index version of the file is open in another buffer.
noremap <leader>gad :Gwrite<CR>

noremap <leader>gpu :Gpush<CR>
noremap <leader>gpl :Gpull<CR>

noremap <leader>gdf :Gvdiff<CR>
noremap <leader>ggr :Ggrep<CR>

" Press - to add/reset a file's changes, or p to add/reset --patch.
noremap <leader>gst :Gstatus<CR>
noremap <leader>gad :Gwrite<CR>
noremap <leader>gco :Gcommit<CR>

noremap <leader>gbl :Gblame<CR>

noremap <leader>gmv :Gmove<CR>
noremap <leader>grm :Gdelete<CR>


""""""""""
"" godlygeek/tabular
" :Tabularize /^[^=]*\zs=
command! -nargs=1 -range TabFirst exec <line1> . ',' . <line2> . 'Tabularize /^[^' . escape(<q-args>, '\^$.[?*~') . ']*\zs' . escape(<q-args>, '\^$.[?*~')


""""""""""
"" ultisnips
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
				endif
			endif
	endif
	return ''
endfunction

function! g:UltiSnips_Reverse()
	call UltiSnips#JumpBackwards()
	if g:ulti_jump_backwards_res == 0
		return "\<C-P>"
	endif
	return ''
endfunction

if !exists('g:UltiSnipsJumpForwardTrigger')
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
endif

if !exists('g:UltiSnipsJumpBackwardTrigger')
	let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
endif

au InsertEnter * exec 'inoremap <silent> ' . g:UltiSnipsExpandTrigger . ' <C-R>=g:UltiSnips_Complete()<cr>'
au InsertEnter * exec 'inoremap <silent> ' . g:UltiSnipsJumpBackwardTrigger . ' <C-R>=g:UltiSnips_Reverse()<cr>'


""""""""""
"" Enter |Terminal-mode| automatically
autocmd TermOpen * startinsert


""""""""""
"" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Copy/Paste
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

set pastetoggle=<F1>

"" Manage splits
" Create a vertical split using :vsp and horizontal with :sp
" Max out the height of the current split
" ctrl+w _
" Max out the width of the current split
" ctrl+w |
" Normalize all split sizes, which is very handy when resizing terminal
" ctrl+w =
" Swap top/bottom or left/right split
" ctrl+w R
" Break out current window into a new tabview
" ctrl+w T
" Close every window in the current tabview but the current one
" ctrl+w o

"" Manage buffers
" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" New buffer
noremap <leader>N :enew<CR>
" Close buffer
noremap <leader>c :bd<CR>
noremap <leader>c! :bd!<CR>
" Switch to last-active buffer
nnoremap <leader>l <C-^>

" :bd          - deletes the current buffer, error if there are unwritten changes
" :bd!         - deletes the current buffer, no error if unwritten changes
" :bufdo bd    - deletes all buffers, stops at first error (unwritten changes)
" :bufdo! bd   - deletes all buffers except those with unwritten changes
" :bufdo! bd!  - deletes all buffers, no error on any unwritten changes

" :bw          - completely deletes the current buffer, error if there are unwritten changes
" :bw!         - completely deletes the current buffer, no error if unwritten changes
" :bufdo bw    - completely deletes all buffers, stops at first error (unwritten changes)
" :bufdo! bw   - completely deletes all buffers except those with unwritten changes
" :bufdo! bw!  - completely deletes all buffers, no error on any unwritten changes

" :ls          - list open buffers
" :b N         - open buffer number N (as shown in ls)
" :tabe +Nbuf  - open buffer number N in new tab
" :bnext       - go to the next buffer (:bn also)
" :bprevious   - go to the previous buffer (:bp also)


"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" TAB to cycle through completion suggestions
inoremap <silent><expr> <Tab> \ pumvisible() ? "\<C-n>" : "\<TAB>"


""""""""""
"" Theme
set t_Co=256
"set termguicolors " Use the true color mode

colorscheme kuroi
set colorcolumn=0
set background=dark
silent do ColorScheme
" alduin, kuroi, onehalfdark
"let g:airline_theme='alduin'

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight Comment ctermbg=NONE guibg=NONE
"highlight CursorLine ctermbg=NONE guibg=NONE
highlight CursorColumn ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE


""""""""""
"" Reopen last position
if has('autocmd')
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
