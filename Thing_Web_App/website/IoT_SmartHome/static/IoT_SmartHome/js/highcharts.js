/**
 * Created by Mateusz on 24.09.2016.
 */


$(function () {
    var gaugeOptions = {


        chart: {
            type: 'solidgauge',
            style: {
         fontFamily: 'Dosis, sans-serif'
      }
        },

        title: null,

        pane: {
            center: ['50%', '85%'],
            size: '140%',
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        tooltip: {
            enabled: false
        },

        // the value axis
        yAxis: {
            stops: [
                //[0.1, '#55BF3B'], // green
                //[0.5, '#DDDF0D'], // yellow
                //[0.9, '#DF5353'] // red
                [0.2, '#3300cc'], // blue
                [0.5, '#00ff33'], // green
                [0.7, '#DF5353'] // red
            ],
            lineWidth: 0,
            minorTickInterval: null,
            tickAmount: 2,
            title: {
                y: -70
            },
            labels: {
                y: 16
            }
        },

        plotOptions: {
            solidgauge: {
                dataLabels: {
                    y: 5,
                    borderWidth: 0,
                    useHTML: true
                }
            }
        }

    };

    // The speed gauge
    $('#gauge-temperature').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 16,
            max: 32,
            title: {
                text: 'TEMPERATURE'
            }
        },

        credits: {
            enabled: false
        },

        series: [{
            name: 'co to jest?',
            data: [0],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                '<span style="font-size:12px;color:silver">&deg;C</span></div>'
            },
            tooltip: {
                valueSuffix: '%'
            }
        }]


    }));


});
