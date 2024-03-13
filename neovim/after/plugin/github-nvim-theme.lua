require('github-theme').setup({
    disable_background = true
})

--vim.cmd('colorscheme github_dark_high_contrast')
--vim.cmd('colorscheme github_light_high_contrast')
--

function ColorMyPencils(color)
	color = color or "github_dark_high_contrast"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
