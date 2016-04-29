### This forked version adds

* `Ctrl-S` to save file, and quit insert mode (so u don't need to press escape anymore)
* Autotag (http://www.vim.org/scripts/script.php?script_id=1343) so whenever you save, Tags are created 
* Enabled `set hidden` option, which allows buffers to save undo-redo history when switching them.
* `,P` to paste from yank register, so you can do YY and then delete a line for example, and do ,P to paste yanked text
* set splitright so vim always splits windows vertically on the right 
* `,v` to open tag in vertical split

The rest is just the default implementation of Maximum Awesome https://github.com/square/maximum-awesome
