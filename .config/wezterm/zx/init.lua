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

    -- theme
    M.theme = require("zx.theme.zx")
    M.append(M.theme.get_config())
    M.theme.setup()

    -- TODO: using M.import("configs")
    local modules = {
        "configs.appearance",
        "configs.bindings",
        "configs.fonts",
    }

    for _, module in ipairs(modules) do
        M.append(require("zx." .. module))
    end
end

function M.setup()
    --
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

-- TODO:require install lfs
function M.import(module)
    -- print("init:".. package.searchpath("zx.init", package.path))

    local lfs = require("lfs")
    local path = debug.getinfo(1).source:match("@?(.*/)")

    local function is_directory(path)
        return lfs.attributes(path, "mode") == "directory"
    end

    local function require_file(file)
        local success, result = pcall(require, file:match("(.+)%..+$"))
        if not success then
            wezterm.log_error("Failed to require file: " .. file)
        end
        M.append(result)
    end

    local full_path = path .. module

    if is_directory(full_path) then
        for file in lfs.dir(full_path) do
            if file ~= "." and file ~= ".." then
                local file_path = full_path .. "/" .. file
                if lfs.attributes(file_path, "mode") == "file" then
                    require_file(file_path)
                end
            end
        end
    else
        require_file(full_path)
    end
end

return M
