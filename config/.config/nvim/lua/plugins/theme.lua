-- Colorscheme configuration for codeSTACKr & Vivid Black
-- Replicates VS Code aesthetics faithfully

-- User commands for quick theme switching
vim.api.nvim_create_user_command("CodeStackr", function()
  vim.cmd("colorscheme codestackr")
  vim.notify("Switched to codeSTACKr theme", vim.log.levels.INFO, { title = "Theme" })
end, { desc = "Switch to codeSTACKr theme" })

vim.api.nvim_create_user_command("VividBlack", function()
  vim.cmd("colorscheme vivid-black")
  vim.notify("Switched to Vivid Black theme", vim.log.levels.INFO, { title = "Theme" })
end, { desc = "Switch to Vivid Black theme" })

vim.api.nvim_create_user_command("ThemeToggle", function()
  local current = vim.g.colors_name or ""
  if current == "codestackr" or current == "codeStackr" then
    vim.cmd("colorscheme vivid-black")
    vim.notify("Theme: Vivid Black", vim.log.levels.INFO, { title = "Theme" })
  else
    vim.cmd("colorscheme codestackr")
    vim.notify("Theme: codeSTACKr", vim.log.levels.INFO, { title = "Theme" })
  end
end, { desc = "Toggle between codeSTACKr and Vivid Black" })

-- Keymap to toggle themes
vim.keymap.set("n", "<leader>th", "<cmd>ThemeToggle<cr>", { desc = "Toggle codeSTACKr / Vivid Black" })

return {
  -- Set LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "codestackr",
    },
  },
}
