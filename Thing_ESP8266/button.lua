local module = {}
print("Import Button module.")
function led_change(Pin)
    gpio.write(Pin, 1 - gpio.read(Pin))
end


local function debounce(func)
    local last = 0
    local delay = 200000

    return function()
        local now = tmr.now()
        if now - last < delay then
            return
        end

        last = now
        return func()
    end
end


local function perform_and_send()

    local val = 1 - gpio.read(4)
    gpio.write(outLed, val)

    -- prepare message
    local ok, json = pcall(cjson.encode, { state = val, timestamp = 1, author = 'mateusz' })
    -- publish state
    app.publish("/light", json, 0, 1)
end


function module.onChange()
    print("Button changed by web application! ")
    perform_and_send()
end

local function onChange()
    if gpio.read(1) == gpio.LOW then
        print("Button changed by hardware! ")
        perform_and_send()
    end
end




function module.init(Pin)
    local outLed = 4
    local inPin = 1
    gpio.mode(outLed, gpio.OUTPUT)
    gpio.mode(Pin, gpio.INT, gpio.PULLUP)
    gpio.trig(Pin, "down", debounce(onChange))
    --gpio.trig(Pin,"down",pressed)  -- trigger activated on rising edge
    print("init button")
end

return module