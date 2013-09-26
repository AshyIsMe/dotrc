# Vim Plugins Cheatsheet

#(Ignore the Janus rebinds for now. I left them in there in case I want to rebind them later on.)

#Walt's awesome
dib yib dab yab

t T - non inclusive f F

ci" - change within "

di" - delete within "

da" - delete within " including "

ca" - change within " including "

Read this: http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/

## [Ack.vim](http://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack.

**Customizations**: Janus rebinds command-shift-f (`<D-F>`) to bring up
`:Ack `.

## [CtrlP](https://github.com/kien/ctrlp.vim)

Fuzzy file, buffer, mru and tag finder. Replaces [Command-T](https://github.com/wincent/Command-T)

**Customizations**: For users of Command-T Janus maps CtrlP to command-t (`<D-t>`)

## [NERDCommenter](http://github.com/ddollar/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

**Customizations**: Janus binds command-/ (`<D-/>`) to toggle comments.

## [NERDTree](https://github.com/scrooloose/nerdtree)

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
:help NERDTree.

**Customizations**: Janus adds a number of customizations to the core
NERDTree:

* Use `<Leader>n` to toggle NERDTree
* Ignore compiled ruby, python, and java files
* When opening vim with vim /path, open the left NERDTree to that
  directory, set the vim pwd, and clear the right buffer
* In general, assume that there is a single NERDTree buffer on the left
  and one or more editing buffers on the right

## [Unimpaired](https://github.com/tpope/vim-unimpaired)

This plugin provides a lot of useful mappings, here's a brief example of
what it does provide:

* `[b` to go to the previous buffer
* `]b` to go to the next buffer
* `[n` to go to the previous SCM conflict marker
* `]n` to go to the next SCM conflict marker

Please check [`:help
unimpaired`](https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt)
for a complete list

## [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

## [Syntastic](https://github.com/scrooloose/syntastic/)

Syntastic is a syntax checking plugin that runs buffers through external syntax 
checkers as they are saved and opened. If syntax errors are detected, the user 
is notified and is happy because they didn't have to compile their code or 
execute their script to find them.

## [Tagbar](https://github.com/majutsushi/tagbar)

Tagbar is a vim plugin for browsing the tags of source code files.

**Customizations**: Janus binds `<Leader>rt` to toggle Tagbar.

## [SnipMate](https://github.com/garbas/vim-snipmate)
SnipMate defines text snippets (a series of characters) that expand to
a useful piece of code when tab is pressed.  For example, in a Ruby
file, def`<TAB>` expands to:
```ruby
def method_name

end
```
After typing in the method name, press tab again to put the cursor right
where you want it on the next line.  [This repository](https://github.com/honza/vim-snippets/tree/master/snippets)
has a full list of the Snippets that are available in Janus.

## [EasyMotion](https://github.com/Lokaltog/vim-easymotion)

EasyMotion provides a much simpler way to use some motions in vim. It
takes the `<number>` out of `<number>w` or `<number>f{char}` by highlighting
all possible choices and allowing you to press one key to jump directly
to the target.

When one of the available motions is triggered, all visible text
preceding or following the cursor is faded, and motion targets are
highlighted.

EasyMotion is triggered by one of the provided mappings.

check EasyMotion's [home
page](https://github.com/Lokaltog/vim-easymotion) for more information.

## [NrrwRgn](https://github.com/chrisbra/NrrwRgn)

Narrowing means focussing on a region and making the rest inaccessible.
You simply select the region, call :NarrowRegion and the selected part
will open in a new scratch buffer. The rest of the file will be
protected, so you won't accidentally modify that buffer. In the new
buffer, you can do a global replace, search or anything else to modify
that part. When you are finished, simply write that buffer (e.g. by
|:w|) and your modifications will be put in the original buffer making
it accessible again.

## Git Support ([Fugitive](http://github.com/tpope/vim-fugitive))

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**customizations**:

* `<leader>gb` maps to `:Gblame<CR>`
* `<leader>gs` maps to `:Gstatus<CR>`
* `<leader>gd` maps to `:Gdiff<CR>`
* `<leader>gl` maps to `:Glog<CR>`
* `<leader>gc` maps to `:Gcommit<CR>`
* `<leader>gp` maps to `:Git push<CR>`

## [ZoomWin](http://github.com/vim-scripts/ZoomWin)

When working with split windows, ZoomWin lets you zoom into a window and
out again using `Ctrl-W o`

**Customizations**: Janus binds `<leader>zw` to `:ZoomWin`

## [BufferGator](https://github.com/jeetsukumaran/vim-buffergator)

Buffergator is a plugin for listing, navigating between, and selecting
buffers to edit. Upon invocation (using the command, `:BuffergatorOpen`
or `BuffergatorToggle`, or the provided key mapping, `<Leader>b`), a
`catalog` of listed buffers are displayed in a separate new window split
(vertical or horizontal, based on user options; default = vertical).
From this "buffer catalog", a buffer can be selected and opened in an
existing window, a new window split (vertical or horizontal), or a new
tab page.

Selected buffers can be "previewed", i.e. opened in a window or tab
page, but with focus remaining in the buffer catalog. Even better, you
can "walk" up and down the list of buffers shown in the catalog by using
`<C-N>` (or `<SPACE>`) / `<C-P>` (or `<C-SPACE>`). These keys select the
next/previous buffer in succession, respectively, opening it for preview
without leaving the buffer catalog viewer.

