
local module = {}
print("Import Application module.")
m = nil
-- Sends a simple ping to the broker
function module.send_ping()
    local val = gpio.read(4)
    local ok, json = pcall(cjson.encode, { myage = val, myname = 'mateusz' })
    m:publish(config.ENDPOINT .. "/fromnode", json, 0, 1)
    print("Published the status to topic:" .. config.ENDPOINT .. "/fromnode")
end


local function read_data(topic, data)
    if data ~= nil then
        print("Received a message from " .. topic .. ": " .. data)

        -- perform data from topic and take some actions
        if topic == config.ENDPOINT .. "/button_event" then
            button.onChange()
        end
    end
end

function module.publish(node, msg, QoS, retained)
    m:publish(config.ENDPOINT .. node, msg, QoS, retained)
    print("Published the status to topic:" .. config.ENDPOINT .. node .. ' a msg:' .. msg)
end
-- Sends my id to the broker for registration
local function register_myself()
    m:subscribe(config.ENDPOINT .. "/button_event", 0, function(conn)
        print("Successfully subscribed to topic: " .. config.ENDPOINT .. "/button_event")
    end)
end

local function mqtt_start()
    m = mqtt.Client(config.ID, 120, config.USERNAME, config.PASSWORD)
    -- receive message handler
    m:on("message", function(con, topic, data)
        read_data(topic, data)
    end)

    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con)
        register_myself()
    end)
end

function module.start()
    button.init(1)

    mqtt_start()
    temp.start(2,3000)
    print("start")
end

return module
