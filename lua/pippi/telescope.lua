function set_mappings(set_keymap)
    set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {})
    set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
    set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
    set_keymap('n', '<leader>kc', '<cmd>Telescope git_commits<cr>', {})
    set_keymap('n', '<leader>kv', '<cmd>Telescope git_bcommits<cr>', {})
    set_keymap('n', '<leader>kb', '<cmd>Telescope git_branches<cr>', {})
    set_keymap('n', '<leader>ks', '<cmd>Telescope git_status<cr>', {})
end

function configure(telescope, actions)
    set_mappings(vim.api.nvim_set_keymap)
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<c-j>"] = actions.move_selection_next,
                    ["<c-k>"] = actions.move_selection_previous
                }
            }
        }
    })
end

return function()
    configure(require('telescope'), require('telescope.actions'))
end
