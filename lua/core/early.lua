vim.g.loaded_nvim_dir_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.filetype.add({
  extension = {
    tf = "terraform",
    tfvars = "terraform-vars",
    tofu = "opentofu",
    tofuvars = "opentofu-vars",
  },
})
