local status,bufferline = pcall(require,"bufferline")
if not status then
  vim.notify("can't find bufferline")
  return 
end

--bufferline configure
bufferline.setup({
  options = {
    --close tab command,usually use :Bdelete of the moll/vim-bby
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",

    -- sidebar configure
    --show File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  --使用nvim内置LSP 后续课程会配置
  diagnostics = "nvim_lsp",
  -- 可选，显示LSP报错图标
  diagnostics_indicator = function(count,lecel,diagnostics_dict,context)
    local s = " "
    for e,n in pairs(diagnostics_dict) do 
      local sym = e == "error" and " " or (e == "warning" and " " or "")
      s = s .. n .. sym
    end
    return s
  end,
  },
})

