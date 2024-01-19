local function setup()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = vim.fn.stdpath('data') .. '/workspace/' .. project_name

    local config = {
        cmd = {
            -- This is where Mason will install jdtls
            vim.fn.stdpath('data') .. '/mason/packages/jdtls/language-server/bin/jdtls',
        },
        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        settings = {
            java = {
            }
        },
        init_options = {
            bundles = {}
        },
    }

    require('jdtls').start_or_attach(config)
end

return {
    setup = setup
}
