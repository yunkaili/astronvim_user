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
  {
    "p00f/clangd_extensions.nvim",
    version = "*",
    lazy = false,
    config = function()
		require("clangd_extensions").setup({
		    inlay_hints = {
		        inline = vim.fn.has("nvim-0.10") == 1,
		        -- Options other than `highlight' and `priority' only work
		        -- if `inline' is disabled
		        -- Only show inlay hints for the current line
		        only_current_line = false,
		        -- Event which triggers a refresh of the inlay hints.
		        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
		        -- not that this may cause  higher CPU usage.
		        -- This option is only respected when only_current_line and
		        -- autoSetHints both are true.
		        only_current_line_autocmd = { "CursorHold" },
		        -- whether to show parameter hints with the inlay hints or not
		        show_parameter_hints = true,
		        -- prefix for parameter hints
		        parameter_hints_prefix = "<- ",
		        -- prefix for all the other hints (type, chaining)
		        other_hints_prefix = "=> ",
		        -- whether to align to the length of the longest line in the file
		        max_len_align = false,
		        -- padding from the left if max_len_align is true
		        max_len_align_padding = 1,
		        -- whether to align to the extreme right or not
		        right_align = false,
		        -- padding from the right if right_align is true
		        right_align_padding = 7,
		        -- The color of the hints
		        highlight = "Comment",
		        -- The highlight group priority for extmark
		        priority = 100,
		    },
		    ast = {
		        -- These are unicode, should be available in any font
		        role_icons = {
		            type = "🄣",
		            declaration = "🄓",
		            expression = "🄔",
		            statement = ";",
		            specifier = "🄢",
		            ["template argument"] = "🆃",
		        },
		        kind_icons = {
		            Compound = "🄲",
		            Recovery = "🅁",
		            TranslationUnit = "🅄",
		            PackExpansion = "🄿",
		            TemplateTypeParm = "🅃",
		            TemplateTemplateParm = "🅃",
		            TemplateParamObject = "🅃",
		        },
		        --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
		            role_icons = {
		                type = "",
		                declaration = "",
		                expression = "",
		                specifier = "",
		                statement = "",
		                ["template argument"] = "",
		            },
		
		            kind_icons = {
		                Compound = "",
		                Recovery = "",
		                TranslationUnit = "",
		                PackExpansion = "",
		                TemplateTypeParm = "",
		                TemplateTemplateParm = "",
		                TemplateParamObject = "",
		            }, ]]
		
		        highlights = {
		            detail = "Comment",
		        },
		    },
		    memory_usage = {
		        border = "none",
		    },
		    symbol_info = {
		        border = "none",
		    },
		})
    end,
  },
  -- theme
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    init = function() -- init function runs before the plugin is loaded
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    init = function()
    end,
    config = function()
      local c = require('vscode.colors').get_colors()
      require("vscode").setup({
    		-- Enable transparent background
    		transparent = true,
    		-- Enable italic comment
    		italic_comments = true,
    		-- Disable nvim-tree background color
    		disable_nvimtree_bg = true,
    		-- Override colors (see ./lua/vscode/colors.lua)
    		color_overrides = {
    		    vscLineNumber = '#FFFFFF',
    		},
    		-- Override highlight groups (see ./lua/vscode/theme.lua)
    		group_overrides = {
    		    -- this supports the same val table as vim.api.nvim_set_hl
    		    -- use colors from this colorscheme by requiring vscode.colors!
    		    Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    		}
      })
    end,
  },
	{
    "Mofiqul/dracula.nvim",
    lazy = false,
    init = function()
    end,
    config = function()
      require("dracula").setup({
  			-- show the '~' characters after the end of buffers
  			show_end_of_buffer = true, -- default false
  			-- use transparent background
  			transparent_bg = true, -- default false
  			-- set custom lualine background color
  			lualine_bg_color = "#44475a", -- default nil
  			-- set italic comment
  			italic_comment = true, -- default false
  			-- overrides the default highlights with table see `:h synIDattr`
  			overrides = {},
  			-- You can use overrides as table like this
  			-- overrides = {
  			--   NonText = { fg = "white" }, -- set NonText fg to white
  			--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  			--   Nothing = {} -- clear highlight of Nothing
  			-- },
  			-- Or you can also use it like a function to get color from theme
  			-- overrides = function (colors)
  			--   return {
  			--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  			--   }
  			-- end,
      })
    end,
	}

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
