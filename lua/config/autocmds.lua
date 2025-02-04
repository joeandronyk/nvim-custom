-- Automatically close the terminal window when the process exits sucessfully
vim.api.nvim_create_autocmd('TermClose', {
  callback = function()
    if vim.v.event.status == 0 then
      vim.cmd 'close'
    end
  end,
})
