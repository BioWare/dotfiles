vim.g.dbs = {
    --dev connections
    {
        name = 'ticketon_dev',
        url = 'ssh://ticketon_dev:mysql://n.abdikov:BRbEzbeARhbkcUJ@192.168.200.146',
    },
    {
        name = 'ticketon_dev_back',
        url = 'ssh://ticketon_dev:mysql://n.abdikov:BRbEzbeARhbkcUJ@192.168.200.146/db_ticketon',
    },
    {
        name = 'ticketon_dev_back_uz',
        url = 'ssh://ticketon_dev:mysql://n.abdikov:BRbEzbeARhbkcUJ@192.168.200.146/db_ticketon_uz',
    },
    {
        name = 'ticketon_dev_front',
        url = 'ssh://ticketon_dev:mysql://n.abdikov:BRbEzbeARhbkcUJ@192.168.200.146/db_ticketon_frontend',
    },
    {
        name = 'ticketon_dev_front_uz',
        url = 'ssh://ticketon_dev:mysql://n.abdikov:BRbEzbeARhbkcUJ@192.168.200.146/db_ticketon_frontend_uz',
    },
    --dev connections

    --prod connections
    {
        name = 'ticketon_prod',
        url = 'ssh://ticketon_prod:mysql://n.abdikov:553XyS0RqOi74XQ@192.168.200.13',
    },
    {
        name = 'ticketon_prod_back',
        url = 'ssh://ticketon_prod:mysql://n.abdikov:553XyS0RqOi74XQ@192.168.200.13/db_ticketon',
    },
    {
        name = 'ticketon_prod_front',
        url = 'ssh://ticketon_prod:mysql://n.abdikov:553XyS0RqOi74XQ@192.168.200.13/db_ticketon_frontend',
    },

    --cinemaxDB
    {
        name = 'cinemax_prod',
        url = 'ssh://ticketon_prod:mysql://n.abdikov:Bf!9UaYw8AGzCD0n@192.168.200.97/db_cinemax_cdm',
    },
}
