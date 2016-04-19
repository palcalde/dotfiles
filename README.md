### This forked version adds:

* `Ctrl-S` to save file, and quit insert mode (so u don't need to press escape anymore)
* Autotag (http://www.vim.org/scripts/script.php?script_id=1343) so whenever you save, Tags are created 
* `Ctrl-P` Default to MRU mode of CtrlP Plug In, which basically the same, but shows most recent used files on open
* Enabled `set hidden` option, which allows buffers to save undo-redo history when switching them.
* `,P` to paste from yank register, so you can do YY and then delete a line for example, and do ,P to paste yanked text

The rest is just the default implementation of Maximum Awesome https://github.com/square/maximum-awesome
