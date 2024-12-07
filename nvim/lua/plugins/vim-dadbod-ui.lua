return {
    {
        "tpope/vim-dadbod",
        cmd = { "DB", "DBUI" },
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
            "pbogut/vim-dadbod-ssh"
        },
        config = function()
            vim.g.dbs = {
                --mongodb_docker-socialmedia
                {
                    name = 'socialmedia-docker-local',
                    url = 'mongodb://mongodb:27017/socialmedia',
                },
                --laracasts demo
                {
                    name = 'laracasts demo',
                    url = 'root@localhost:3306": mysql://root@localhost:3306/myapp',
                },
            }
        end,
    }
}
