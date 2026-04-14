vim.api.nvim_create_augroup("UserAUGroup", { clear = true })

local function skip_ft(ft)
  local fts = { "NvimTree", "fyler", "neo-tree", "snacks_picker_list", "snacks_picker_input" }

  if vim.tbl_contains(fts, ft) then
    return true
  end
  return false
end

vim.api.nvim_create_autocmd("InsertEnter", {
  group = "UserAUGroup",
  pattern = "*",
  callback = function()
    if not skip_ft(vim.bo.filetype) then
      vim.wo.number = true
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = "UserAUGroup",
  pattern = "*",
  callback = function()
    if not skip_ft(vim.bo.filetype) then
      vim.wo.number = true
      vim.wo.relativenumber = true
    end
  end,
})

