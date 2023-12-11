-- nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
-- nnoremap <C-p> :Telescope git_files find_command=rg,--no-ignore,--hidden,--files<CR>
-- nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
-- nnoremap <Leader>pl :lua require('telescope.builtin').live_grep()<CR>
-- nnoremap <Leader>pt :Telescope<CR>
 
-- nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
-- nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
-- nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
-- nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>


--
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--no-ignore-dot'
            -- '--glob="!{.git,node_modules,vendor}"',
            -- '--no-ignore',
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        file_ignore_patters = { ".git/*", "node_modules/*", "bower_components/*","vendor/*", "%.lock","dist",".nuxt" },
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
  
      }
    }
}

require("telescope").load_extension("ui-select")
