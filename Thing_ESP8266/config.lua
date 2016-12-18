local module = {}
print("Import Config module.")
module.SSID = {}
module.SSID["AndroidAP"] = "haslo123"
module.SSID["PWR-Wifi"] = ""
module.SSID["BAR CEL ONA"] = "salamandra"
module.SSID["Budujemy mosty"] = "sdf"

module.HOST = "m21.cloudmqtt.com"
module.PORT = 19815
module.USERNAME = "zvekjcmc"
module.PASSWORD = "1DRBlYvDPeOQ"
module.ID = 1

-- module.ENDPOINT = "/nodemcu/"..node.chipid()

module.ENDPOINT = "/smarthome/myroom"
return module
