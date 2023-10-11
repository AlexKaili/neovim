-- 设置leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--设置map变量代表vim.api.nvim_set_keymap 全局键盘映射函数,opt：{不可重映射，不输出多余信息}
local map = vim.api.nvim_set_keymap
local opt = {noremap = true,silent = true}

-- 窗口管理快捷映射
map("i","jk","<Esc>",opt)
-- -- 取消s默认功能
map("n","s","",opt)
-- 分屏快捷键
map("n","sv",":vsp<CR>",opt)
map("n","sh",":sp<CR>",opt)
-- 关闭当前
map("n","sc","<C-w>c",opt)
-- 关闭其他
map("n","so","<C-w>o",opt)

-- Alt + hjkl 窗口间跳转
map("n","<A-h>","<C-w>h",opt)
map("n","<A-j>","<C-w>j",opt)
map("n","<A-k>","<C-w>k",opt)
map("n","<A-l>","<C-w>l",opt)

--左右比例控制
map("n","<C-Left>",":vertical resize -2<CR>",opt)
map("n","<C-Right>",":vertical resize +2<CR>",opt)
map("n","s,",":vertical resize -20<CR>",opt)
map("n","s.",":vertical resize +20<CR>",opt)

-- 上下比例
map("n","sj",":resize +10<CR>",opt)
map("n","sk",":resize -10<CR>",opt)
map("n","<C-Down",":resize +2<CR>",opt)
map("n","<C-Up>",":resize -2<CR>",opt)

-- 等比例
map("n","s=","<C-w>=",opt)

-- Terminal 相关
map("n","<leader>t",":sp | terminal<CR>",opt)
map("n","<leader>vt",":vsp | terminal<CR>",opt)
map("t","<Esc>",":vsp | terminal<CR>",opt)
map("t","<A-h>",[[ <C-\><C-N><C-w>h ]],opt)
map("t","<A-j>",[[ <C-\><C-N><C-w>j ]],opt)
map("t","<A-k>",[[ <C-\><C-N><C-w>k ]],opt)
map("t","<A-l>",[[ <C-\><C-N><C-w>l ]],opt)

--visual模式下缩进代码
map("v","<","<gv",opt)
map("v",">",">gv",opt)
map("v","J",":move '>+1<CR>gv-gv",opt)
map("v","K",":move '<-2<CR>gv-gv",opt)

--上下滚动浏览
map("n","<C-j>","4j",opt)
map("n","<C-k>","4k",opt)
map("n","<C-u>","9u",opt)
map("n","<C-d>","9j",opt)

--退出
map("n","q",":q<CR>",opt)
map("n","qq",":q!<CR>",opt)
map("n","Q",":qa!<CR>",opt)
map("n","wq",":wq<CR>",opt)

--plugins shortcut


-- 1.Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


-- 2.bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)


--3.nvim-tree
--alt + m 键打开关闭tree
map("n","<a-m>",":NvimTreeToggle<cr>",opt)
--列表快捷键
local pluginKeys = {}
pluginKeys.nvimtreelist = {
  --打开文件或文件夹
  {key={"<cr>","o","<2-leftmouse>"},action = "edit"},
  {key="v",action = "vsplit"},
  {key="h",action = "split"},
  {key="i",action = "toggle_custom"},
  {key=".",action = "toggle_dotfiles"},
  {key="<f5>",action = "refresh"},
  {key="a",action = "create"},
  {key="d",action = "remove"},
  {key="r",action = "rename"},
  {key="x",action = "cut"},
  {key="c",action = "copy"},
  {key="p",action = "paste"},
  {key="s",action = "system_open"},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
 -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  mapbuf("n", "<leader>rn", "<cmd>lua Lspsaga rename<CR>", opt)
  -- code action
  --mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  --mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  --mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  --mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  --mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end


return pluginKeys


