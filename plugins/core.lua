return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  -- Develop tools
  {
    -- Docstring generator
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = {
      snippet_engine = "luasnip",
      languages = {
        python = { emplate = { annotation_convention = "google_docstrings" } },
      },
    },
  },
  {
    -- Preview markdown code directly in your neovim terminal
    -- brew install glow (https://github.com/charmbracelet/glow)
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow").setup {
        border = "shadow", -- floating window border config
        style = "dark", -- filled automatically with your current editor background, you can override using glow json style
        pager = false,
        width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
        height_ratio = 0.9,
      }
    end,
  },
  {
    -- Surround selections, stylishly
    -- insert = "<C-g>s",
    -- insert_line = "<C-g>S",
    -- normal = "ys",
    -- normal_cur = "yss",
    -- normal_line = "yS",
    -- normal_cur_line = "ySS",
    -- visual = "S",
    -- visual_line = "gS",
    -- delete = "ds",
    -- change = "cs",
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    -- Hop is a complete from-scratch rewrite of EasyMotion, a famous plugin to enhance
    -- the native motions of Vim.
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    lazy = false,
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    -- Common text transformers for nvim - switch between camelCase, PascalCase, snake_case, and more!
    "chenasraf/text-transform.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("text-transform").setup {
        debug = false,
        keymap = {
          -- Normal mode keymap.
          ["n"] = "<leader><leader>~",
          -- Visual mode keymap.
          ["v"] = "<leader><leader>~",
        },
      }
    end,
  },
  {
    -- Align text interactively
    "echasnovski/mini.align",
    version = "*",
    lazy = false,
    config = function()
      require("mini.align").setup {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          start = "ga",
          start_with_preview = "gA",
        },
        -- Modifiers changing alignment steps and/or options
        -- modifiers = {
        --   -- Main option modifiers
        --   ['s'] = --<function: enter split pattern>,
        --   ['j'] = --<function: choose justify side>,
        --   ['m'] = --<function: enter merge delimiter>,
        --
        --   -- Modifiers adding pre-steps
        --   ['f'] = --<function: filter parts by entering Lua expression>,
        --   ['i'] = --<function: ignore some split matches>,
        --   ['p'] = --<function: pair parts>,
        --   ['t'] = --<function: trim parts>,
        --
        --   -- Delete some last pre-step
        --   ['<BS>'] = --<function: delete some last pre-step>,
        --
        --   -- Special configurations for common splits
        --   ['='] = --<function: enhanced setup for '='>,
        --   [','] = --<function: enhanced setup for ','>,
        --   [' '] = --<function: enhanced setup for ' '>,
        -- },

        -- Default options controlling alignment process
        options = {
          split_pattern = "",
          justify_side = "left",
          merge_delimiter = "",
        },

        -- Default steps performing alignment (if `nil`, default is used)
        steps = {
          pre_split = {},
          split = nil,
          pre_justify = {},
          justify = nil,
          pre_merge = {},
          merge = nil,
        },

        -- Whether to disable showing non-error feedback
        silent = false,
      }
    end,
  },
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
