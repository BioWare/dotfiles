return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
        ts_config = {
            lua = { 'string' },
            javascript = { 'template_string' },
            java = false,
        }
    },
    config = function(_, opts)
        require('nvim-autopairs').setup(opts)

        -- Integration with nvim-cmp
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
