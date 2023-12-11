 local builtin = require('telescope.builtin') 
 local actions = require('telescope.actions')
 
 vim.keymap.set("n","<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep For > ")}) end)
 vim.keymap.set("n","<C-p>", builtin.git_files)
 vim.keymap.set("n","<Leader>pf",builtin.find_files)
 vim.keymap.set("n","<Leader>pl",builtin.live_grep)
 vim.keymap.set("n","<Leader>pt", function() vim.cmd(":Telescope") end)
 
 vim.keymap.set("n","<leader>pw",function() builtin.grep_string { search = vim.fn.expand("<cword>") } end)
 vim.keymap.set("n","<leader>pb",builtin.buffers)
 vim.keymap.set("n","<leader>vh",builtin.help_tags)
 vim.keymap.set("n","<leader>gb",builtin.git_branches)


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
