require("supermaven-nvim").setup({
  -- keymaps = {
  --   accept_suggestion = "<C-l>",
  --   accept_word = "<C-n>",
  --   clear_suggestion = "<C-]>",
  -- },
  ignore_filetypes = { cpp = true }, -- or { "cpp", }
  color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  },
  log_level = "info", -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = true, -- disables built in keymaps for more manual control
  condition = function()
    return false
  end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
})



local function accept_suggestion(only_one_word)
    local suggestion = require('supermaven-nvim.completion_preview')

    if suggestion.has_suggestion() then
        -- There's a suggestion being displayed!

        local shadow_text = suggestion.inlay_instance.completion_text

        if only_one_word then
            if shadow_text:sub(1, 1) == "\n" then
                -- The text starts with \n, we run the native completion
                suggestion.on_accept_suggestion(true)
                return
            end

            shadow_text = shadow_text:match("^.-%f[a-z0-9_][a-z0-9_]+")
            if shadow_text == nil then
                -- We can't find the end of the next word... We just run the native completion
                suggestion.on_accept_suggestion()
                return
            end

            -- We found the end of the next word, we insert it, without removing anything from the line.
            vim.fn.feedkeys(shadow_text, 'i');
            return;
        end

        -- If the shadow_text starts with \n, we just trigger the completion
        if shadow_text:sub(1, 1) == "\n" then
            suggestion.on_accept_suggestion()
            return
        end

        local line_after_cursor = suggestion.inlay_instance.line_after_cursor

        if line_after_cursor:len() == 0 then
            suggestion.on_accept_suggestion()
            return
        end

        -- Otherwise, we check if the completion end is the same as the end of the current line
        local identical_count = 0
        for i = 1, #shadow_text do
            local current_char = line_after_cursor:sub(line_after_cursor:len() - i, line_after_cursor:len() - i)
            local shadow_char = shadow_text:sub(shadow_text:len() - i, shadow_text:len() - i)
            if current_char == shadow_char then
                identical_count = identical_count + 1
            else
                break
            end
        end

        if identical_count == 0 then
            suggestion.on_accept_suggestion()
            return
        end

        local current_col = vim.api.nvim_win_get_cursor(0)[2]

        local amount_to_delete = line_after_cursor:len() - identical_count
        local text_to_feed = shadow_text:sub(1, - identical_count - 2)

        if text_to_feed:len() == 0 and amount_to_delete == 0 then
            -- There's a suggestion which is identical to the end of the line,
            -- We just accept it (a.k.a move the cursor to the end of the line)
            suggestion.on_accept_suggestion()
            return
        end

        print(line_after_cursor:sub(line_after_cursor:len() - identical_count + 1, line_after_cursor:len()))

        -- Feeding <delete amount_to_delete times
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<delete>", true, true, true):rep(amount_to_delete - 1), "n")

        -- Feeding the completion text
        vim.fn.feedkeys(text_to_feed, "n")
    end
end

vim.keymap.set("i", "<C-l>", function()
	accept_suggestion(false)
end)
vim.keymap.set("i", "<C-n>", function()
	accept_suggestion(true)
end)

