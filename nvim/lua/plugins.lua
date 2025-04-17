local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({'Mofiqul/dracula.nvim', {
    "saghen/blink.cmp",
    dependencies = {"rafamadriz/friendly-snippets"},

    version = "*",

    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        keymap = {
            preset = "super-tab",
            ["<Up>"] = {"select_prev", "fallback"},
            ["<Down>"] = {"select_next", "fallback"},
            ["<Tab>"] = {"select_next", "fallback"},
            ["<S-Tab>"] = {"select_prev", "fallback"},
            ["<C-b>"] = {"scroll_documentation_up", "fallback"},
            ["<C-f>"] = {"scroll_documentation_down", "fallback"},
            ["<C-k>"] = {"show_signature", "hide_signature", "fallback"}
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            nerd_font_variant = "mono"
        },

        sources = {
            -- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
            -- so you don't need to define them in `sources.providers`
            default = {"lsp", "path", "snippets", "buffer"}
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning"
        },
        completion = {
            keyword = {
                range = "prefix"
            },
            menu = {
                draw = {
                    treesitter = {"lsp"}
                }
            },
            trigger = {
                show_on_trigger_character = true
            },
            documentation = {
                auto_show = true
            }
        },

        signature = {
            enabled = true
        }
    },
    opts_extend = {"sources.default"}
}, "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"})
