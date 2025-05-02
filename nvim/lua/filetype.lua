local function is_helm_template(filepath)
  if not filepath:match("%.ya?ml$") then
    return false
  end

  local abs_path = vim.fn.fnamemodify(filepath, ":p")

  -- Look for `/templates/` in path and extract its root
  local templates_dir = abs_path:match("(.*/templates/)")
  if not templates_dir then
    return false
  end

  -- Remove trailing slash and '/templates' from templates dir to get chart root
  local chart_root = vim.fn.fnamemodify(templates_dir, ":h")
  chart_root = vim.fn.fnamemodify(chart_root, ":h")

  -- Check for Chart.yaml in same dir as templates/
  if vim.fn.filereadable(chart_root .. "/Chart.yaml") == 1 then
    return true
  end

  return false
end

vim.api.nvim_create_augroup("SetFileType", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "SetFileType",
  pattern = "*.yaml",
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)
    if is_helm_template(path) then
      vim.bo[args.buf].filetype = "helm" -- set buffer option
    end
  end,
})
