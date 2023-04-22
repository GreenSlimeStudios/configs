--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["F"] = {
  name = "+Flutter",
  c = { "<cmd>Telescope flutter commands<cr>", "Open Flutter Commans" },
  d = { "<cmd>FlutterDevices<cr>", "Flutter Devices" },
  e = { "<cmd>FlutterEmulators<cr>", "Flutter Emulators" },
  r = { "<cmd>FlutterReload<cr>", "Hot Reload App" },
  R = { "<cmd>FlutterRestart<cr>", "Hot Restart app" },
  q = { "<cmd>FlutterQuit<cr>", "Quit running application" },
  v = { "<cmd>Telescope flutter fvm<cr>", "Flutter version" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "yaml",
  "dart",
  "ruby",
  "markdown",
  "markdown_inline"
}

lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "dartls",
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    "rafi/awesome-vim-colorschemes",
    "xiyaowong/nvim-transparent",
    -- "junegunn/fzf.vim",
    "ap/vim-css-color",
    "ryanoasis/vim-devicons",
    "mfussenegger/nvim-dap",
    "normen/vim-pio",
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("flutter-tools").setup {}
      -- require('flutter-tools').setup {
      --   -- flutter_path = "~/development/flutter",
      --   fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
      --   ui = {
      --     -- the border type to use for all floating windows, the same options/formats
      --     -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
      --     border = "rounded",
      --     -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
      --     -- please note that this option is eventually going to be deprecated and users will need to
      --     -- depend on plugins like `nvim-notify` instead.
      --     notification_style = "plugin",
      --   },
      --   decorations = {
      --     statusline = {
      --       -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      --       -- this will show the current version of the flutter app from the pubspec.yaml file
      --       app_version = true,
      --       -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      --       -- this will show the currently running device if an application was started with a specific
      --       -- device
      --       device = true,
      --     },
      --   },
      --   outline = {
      --     open_cmd = "30vnew", -- command to use to open the outline buffer
      --     auto_open = false,   -- if true this will open the outline automatically when it is first populated
      --   },
      --   debugger = {
      --     enabled = true,
      --     run_via_dap = true,
      --     register_configurations = function(_)
      --       local dap = require("dap")
      --       -- dap.adapters.dart = {
      --       -- 	type = "executable",
      --       -- 	command = "node",
      --       -- 	args = { debugger_path, "flutter" },
      --       -- }
      --       dap.set_log_level("TRACE")
      --       dap.configurations.dart = {}
      --       require("dap.ext.vscode").load_launchjs()
      --     end,
      --   },
      --   dev_log = {
      --     enabled = false,
      --     -- open_cmd = "tabedit", -- command to use to open the log buffer
      --   },
      --   lsp = {
      --     color = {
      --       -- show the derived colours for dart variables
      --       enabled = true,         -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      --       background = false,     -- highlight the background
      --       foreground = false,     -- highlight the foreground
      --       virtual_text = true,    -- show the highlight using virtual text
      --       virtual_text_str = "■", -- the virtual text character to highlight
      --     },
      --     settings = {
      --       showTodos = true,
      --       completeFunctionCalls = true,
      --       renameFilesWithClasses = "prompt", -- "always"
      --       enableSnippets = true,
      --       enableSdkFormatter = true,
      --     },
      --   },

      -- }
    end
  },
  -- Syntax highlight for mdx files: used by Storybook
  { "jxnblk/vim-mdx-js" },
  -- { "github/copilot.vim" },
  -- tmux navigation support
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup {
        navigation = {
          -- cycles to opposite pane while navigating into the border
          -- cycle_navigation = true,

          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        },
      }
    end,
  },
}

-- vim.keymap("n", "<leader>t", ":TransparentToggle<cr>", {})
lvim.keys.normal_mode["<leader>t"] = ":TransparentToggle<CR>"
lvim.keys.normal_mode["<leader>tf"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>tb"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<leader>tg"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>th"] = ":Telescope help_tags<CR>"
-- vim.keymap.set("n", "<leader>t", ":TransparentToggle %<CR>",{m})

-- vim.cmd([[colorscheme molokayo]])

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- }C1
lvim.lsp.buffer_mappings.normal_mode['<leader>a'] = { vim.lsp.buf.code_action, "Code actions" }
lvim.lsp.buffer_mappings.normal_mode['<c-w>'] = { vim.lsp.buf.completion, "Code actions" }
lvim.lsp.buffer_mappings.normal_mode['<T>'] = { vim.lsp.buf.BufferLineCycleNext, "Code actions" }
