local wezterm = require("wezterm")
local M = {}
M.did_init = false

function M.init()
    if M.did_init then
        return
    end
    M.did_init = true

    -- initialize
    M.config = {}

    --
    local modules = {
        "colors",
        "window_frame",
    }

    for _, module in ipairs(modules) do
        M.append(require("zx.theme.zx." .. module))
    end
end

function M.setup()
    local modules = {
        "tab-title",
    }

    for _, module in ipairs(modules) do
        require("zx.theme.zx." .. module).setup()
    end
end

function M.append(config)
    for k, v in pairs(config) do
        if M.config[k] == nil then
            M.config[k] = v
        end
    end
end

function M.get_config()
    if M.config == nil then
        M.init()
    end

    return M.config
end

return M
