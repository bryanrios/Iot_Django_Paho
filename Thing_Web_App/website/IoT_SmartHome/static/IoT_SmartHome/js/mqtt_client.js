/**
 * Created by Mateusz on 10.12.2016.
 */

$(document).ready(function () {
    var j = {"name": "binchen"};
    j = JSON.stringify(j);
    //console.log(j['name']);

    console.log("Start");

    var wsbroker = "m21.cloudmqtt.com";
    var wsport = 39815;

    var client = new Paho.MQTT.Client(wsbroker, wsport, "myclientid_" + parseInt(2));

    function onMessageArrived(ArrivedMessage) {
        var destinationName = ArrivedMessage.destinationName;
        var message = eval('(' + ArrivedMessage.payloadString + ')');
        var qos = ArrivedMessage.qos;
        var retained = ArrivedMessage.retained;

        console.log("=================================");
        console.log("Topic: " + destinationName);
        console.log("Message->State: " + message['state']);
        console.log("QoS: " + qos);
        console.log("Retained: " + retained);
        console.log("=================================");

        if (destinationName == '/smarthome/myroom/temperature') {
            chart = $('#gauge-temperature').highcharts();
            if (chart) {
                point = chart.series[0].points[0];
                newVal = message['state'];
                point.update(newVal);
            }
        }
        else if (destinationName == '/smarthome/myroom/light') {

            var value = 'undefined';
            if (message['state'] == 0) { //turn on the toggle button
                $('#light-toggle-event').bootstrapToggle('on');
                value = 'HIGH'
            }
            else if (message['state'] == 1) { //turn off the toggle button
                $('#light-toggle-event').bootstrapToggle('off')
                value = 'LOW'
            }
            if (!retained) {
                $("#logger-container").append(
                    '<div class="alert alert-info fade in"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>The bulb status has been changed by hardware button to ' +
                    value +
                    '!</div>'
                );
                $(".alert").fadeOut(10000);
            }
        }
    }


    function onSuccess() {
        console.log("Connected");
        client.subscribe("/smarthome/myroom/temperature");
        client.subscribe("/smarthome/myroom/light");

    }

    function onFailure(message) {
        console.log("Connection Failed. Error : " + message.errorMessage);
    }

    function onConnectionLost(message) {
        console.log("Connection Lost. Error : " + message.errorMessage);
    }

    var options = {
        timeout: 30,
        onSuccess: onSuccess,
        onFailure: onFailure,
        userName: 'zvekjcmc',
        password: '1DRBlYvDPeOQ',
        useSSL: true

    };

    function Client_MQTT_init() {
        console.log('connecting');
        client.onMessageArrived = onMessageArrived;
        client.onConnectionLost = onConnectionLost;
        client.connect(options);

    }

    Client_MQTT_init();

});