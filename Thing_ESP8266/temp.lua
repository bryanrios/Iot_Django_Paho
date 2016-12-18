local module = {}

print("Import Temp module.")

local function measure()

    local m = ds18b20.read()
    if (m == 85 or m == 127 or m == nil) then
        m = 'error'
    end

    local ok, json = pcall(cjson.encode, { state = m, timestamp = 1, myname = 'mateusz' })
    app.publish("/temperature", json, 0, 1)
end

function module.start(gpioNum, interval)
    ds18b20.setup(gpioNum)
    tmr.alarm(0, interval, 1, function() measure() end)
end

return module

