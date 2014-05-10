$(document).ready(function(){
    var reportYear = $('#highcharts').attr('class');
    var options = {
       chart: {
                    renderTo: 'highcharts',
                    type: 'line',
              },
              title: {
                    text: 'Pártolói',
                    x: 0 //center
                },
                subtitle: {
                    text: 'Havi befizetések a ' + reportYear + ' évben',
                    x: 0
                },
                xAxis: {
                    title: {
                        text: 'Hónapok'
                    },
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: [{
                    title: {
                        text: 'Befizetések (HUF)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }],
                    tooltip: {
                        valueSuffix: 'Ft'
                    }
                },
                 { // Secondary yAxis
                title: {
                    text: 'Befizetés',
                    style: {
                        color: '#7cb5ec'
                    }
                },
                labels: {
                    format: '{value} tranzakció',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
                }],
                tooltip: {
                    shared: true
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
              series: [{},{},{},{}]
    };

    $.getJSON('/monthly-income-data.json?year='+reportYear, function(data) {
        options.series[0].name = "Tagok";
        options.series[0].data = data.member_data;
        options.series[0].yAxis = 0;
        options.series[1].name = "Pártolók";
        options.series[1].data = data.supporter_data;
        options.series[1].yAxis = 0;
        options.series[2].name = "Projektek";
        options.series[2].data = data.project_data;
        options.series[2].yAxis = 0;
        options.series[3].name = "Befizetések";
        options.series[3].type = 'column';
        options.series[3].yAxis = 1;
        options.series[3].data = data.payments_data;
        var chart = new Highcharts.Chart(options);
    });

});