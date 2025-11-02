-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/webstriix/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/home/webstriix/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/home/webstriix/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/home/webstriix/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/webstriix/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["deoplete-clang"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/deoplete-clang",
    url = "https://github.com/deoplete-plugins/deoplete-clang"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\21ensure_installed\0\1\3\0\0\15checkstyle\23google-java-format\nsetup\18mason-null-ls\frequire\0" },
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jay-babu/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["none-ls.nvim"] = {
    config = { "\27LJ\2\nP\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1¿\nbufnr\1\0\1\nbufnr\0\vformat\bbuf\blsp\bvimö\2\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0ÄK\0\1\0\3¿\rcallback\0\1\0\3\vbuffer\0\ngroup\0\rcallback\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\2\vbuffer\0\ngroup\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodÀ\3\1\0\15\0\25\1*6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\2\2\0009\2\4\0026\3\5\0009\3\6\0039\3\a\3'\5\b\0004\6\0\0B\3\3\0029\4\t\0005\6\21\0004\a\3\0009\b\n\0019\b\v\b5\n\r\0005\v\f\0=\v\14\nB\b\2\2>\b\1\a9\b\15\0029\b\v\b5\n\20\0005\v\16\0006\f\5\0009\f\17\f9\f\18\f'\14\19\0B\f\2\0?\f\0\0=\v\14\nB\b\2\0?\b\0\0=\a\22\0063\a\23\0=\a\24\6B\4\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\2\14on_attach\0\fsources\0\1\0\1\15extra_args\0(~/dotfiles/config/google_checks.xml\vexpand\afn\1\2\0\0\a-c\15checkstyle\15extra_args\1\0\1\15extra_args\0\1\2\0\0\v--aosp\twith\23google_java_format\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\16diagnostics\15formatting\rbuiltins\fnull-ls\frequire\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n]\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26nvim-dap-virtual-text\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n∑\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\tview\1\0\3\ffilters\0\tview\0\rrenderer\0\1\0\2\tside\tleft\nwidth\3\30\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rpatterns\1\6\0\0\t.git\fpom.xml\17build.gradle\20settings.gradle\r.project\22detection_methods\1\0\2\22detection_methods\0\rpatterns\0\1\3\0\0\blsp\fpattern\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/webstriix/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: none-ls.nvim
time([[Config for none-ls.nvim]], true)
try_loadstring("\27LJ\2\nP\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1¿\nbufnr\1\0\1\nbufnr\0\vformat\bbuf\blsp\bvimö\2\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0ÄK\0\1\0\3¿\rcallback\0\1\0\3\vbuffer\0\ngroup\0\rcallback\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\2\vbuffer\0\ngroup\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodÀ\3\1\0\15\0\25\1*6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\2\2\0009\2\4\0026\3\5\0009\3\6\0039\3\a\3'\5\b\0004\6\0\0B\3\3\0029\4\t\0005\6\21\0004\a\3\0009\b\n\0019\b\v\b5\n\r\0005\v\f\0=\v\14\nB\b\2\2>\b\1\a9\b\15\0029\b\v\b5\n\20\0005\v\16\0006\f\5\0009\f\17\f9\f\18\f'\14\19\0B\f\2\0?\f\0\0=\v\14\nB\b\2\0?\b\0\0=\a\22\0063\a\23\0=\a\24\6B\4\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\2\14on_attach\0\fsources\0\1\0\1\15extra_args\0(~/dotfiles/config/google_checks.xml\vexpand\afn\1\2\0\0\a-c\15checkstyle\15extra_args\1\0\1\15extra_args\0\1\2\0\0\v--aosp\twith\23google_java_format\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\16diagnostics\15formatting\rbuiltins\fnull-ls\frequire\5ÄÄ¿ô\4\0", "config", "none-ls.nvim")
time([[Config for none-ls.nvim]], false)
-- Config for: mason-null-ls.nvim
time([[Config for mason-null-ls.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\21ensure_installed\0\1\3\0\0\15checkstyle\23google-java-format\nsetup\18mason-null-ls\frequire\0", "config", "mason-null-ls.nvim")
time([[Config for mason-null-ls.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n]\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26nvim-dap-virtual-text\nsetup\ndapui\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\rpatterns\1\6\0\0\t.git\fpom.xml\17build.gradle\20settings.gradle\r.project\22detection_methods\1\0\2\22detection_methods\0\rpatterns\0\1\3\0\0\blsp\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\tview\1\0\3\ffilters\0\tview\0\rrenderer\0\1\0\2\tside\tleft\nwidth\3\30\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
