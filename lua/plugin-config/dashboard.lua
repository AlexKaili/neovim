
local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("can't find dashboard")
  return
end

db.setup({
  theme = 'doom',
  config = {
    header = {
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
    }, 

    center = {
                {
                  icon = "  ",
                  desc = "projects                            ",
                  action = "Telescope projects",
                },
                {
                  icon = "  ",
                  desc = "recently files                      ",
                  action = "Telescope oldfiles",
                },
                {
                  icon = "  ",
                  desc = "edit keybindings                    ",
                  action = "edit ~/.config/nvim/lua/keybindings.lua",
                },
                {
                  icon = "  ",
                  desc = "edit projects                       ",
                  action = "edit ~/.local/share/nvim/project_nvim/project_history",
                },
                -- {
                --   icon = "  ",
                --   desc = "edit .bashrc                        ",
                --   action = "edit ~/.bashrc",
                -- },
                -- {
                --   icon = "  ",
                --   desc = "change colorscheme                  ",
                --   action = "changecolorscheme",
                -- },
                -- {
                --   icon = "  ",
                --   desc = "edit init.lua                       ",
                --   action = "edit ~/.config/nvim/init.lua",
                -- },
                -- {
                --   icon = "  ",
                --   desc = "find file                           ",
                --   action = "Telescope find_files",
                -- },
                -- {
                --   icon = "  ",
                --   desc = "find text                           ",
                --   action = "Telescopecope live_grep",
                -- },
    },

    footer = {
      "",
      "",
      "https://github.com/nshen/learn-neovim-lua",
    } 
  }
})



