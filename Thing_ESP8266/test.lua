print("Run Test.")

local list = file.list(); local name, size; for name, size in pairs(list) do
    if name == 'ds18b20.lua' then
        node.compile('ds18b20.lua')
        file.remove('ds18b20.lua')
    end
    if name == 'setup.lua' then
        node.compile('setup.lua')
        file.remove('setup.lua')
    end
    if name == 'button.lua' then
        node.compile('button.lua')
        file.remove('button.lua')
    end
    if name == 'temp.lua' then
        node.compile('temp.lua')
        file.remove('temp.lua')
    end
    if name == 'application.lua' then
        node.compile('application.lua')
        file.remove('application.lua')
    end
    if name == 'config.lua' then
        node.compile('config.lua')
        file.remove('config.lua')
    end
end


setup = require("setup")
button = require("button")
ds18b20 = require('ds18b20')
temp = require("temp")
app = require("application")
config = require("config")

setup.start()
