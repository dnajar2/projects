
let tip = "We calculate the total dollar amount by multiplying your credits earned by your conversion rate. The conversion rate can vary depending on several factors. Please contact our support if you need help understanding your report.";
var now=new Date();
var m = "AM";
var hourStr = now.getHours();
if (hourStr > 12) {
    hourStr = hourStr - 12;
}
if (hourStr >= 12) {
    m = "PM";
}
var minStr = now.getMinutes();
if (minStr < 10) {
    minStr = "0" + minStr;
}
var dateStr = (now.getMonth()+1) + "/" + now.getDate() + "/" + now.getFullYear() + " " +
    hourStr + ":" + minStr + " " + m;
$('#local_date_time span').text(dateStr);



let myearnings = {
    jsData: [],
        lineChartData : {
        labels:[],
        minutes:[],
        credits:[],
        shows:[],
    },
    dataResults: [],
    drawChart:function(id,label,labels,data,color){
        let ctx = $(id);
        ctx.show();
        ctx.height = 300;
        Chart.defaults.global.defaultFontFamily = "Lato";
        Chart.defaults.global.defaultFontSize = 14;

        let dataFirst = {
            label: label,
            data: data,
            lineTension: 0.3,
            fill: false,
            borderColor: color,
            backgroundColor: 'transparent',
            pointBorderColor: color,
            pointBackgroundColor: 'lightgreen',
            pointRadius: 5,
            pointHoverRadius: 15,
            pointHitRadius: 30,
            pointBorderWidth: 2
        };
        let minutesData = {
            labels: labels,
            datasets: [dataFirst]
        };

        let chartOptions = {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 20,
                    fontColor: 'black'
                }
            },
            maintainAspectRatio: false,
        };

        let lineChart = new Chart(ctx, {
            type: 'line',
            data: minutesData,
            options: chartOptions
        });
    }
};

$(function() {
    $('#mb-periodId').on('click', function(event){
        console.log('event', event);
    });

    $('.mb-dropdown').on('click', function(event){
        let parent = '#' + $(this).parent().attr('id');
        $(parent).find('input').click();

        console.log( $(this).parent().parent() );
        console.log('Input ',$(parent).find('input'));
    });
    $("#earnings_period").html(function (i, html) {
        return html.replace(/&nbsp;/g, '');
    });

    let dataDate = $('td.date');
    if(dataDate.length){

        $.each(dataDate, function (idx, item) {

            let parent = $(item).parent();
            let minutes = parent.find('.minutes').text();
            let credits = parent.find('.date-total').text();
            if(credits.indexOf('$') === 0){
                credits = Number(credits.substr(1)).toFixed(2)
            }
            myearnings.jsData.push({date: $(item).text(), minutes: minutes, credits:credits})
        });

        myearnings.jsData.reduce(function(res, value){
            if (!res[value.date]) {
                res[value.date] = {
                    minutes: 0,
                    date: value.date,
                    credits: 0,
                    shows:0
                };
                myearnings.dataResults.push(res[value.date])
            }
            res[value.date].minutes += Number(value.minutes);
            res[value.date].credits += Number(value.credits);
            res[value.date].shows ++;
            return res
        },{});
        if(myearnings.dataResults.length){
            for(let i = 0; i<myearnings.dataResults.length; i++){
                myearnings.lineChartData.labels.push(myearnings.dataResults[i].date);
                myearnings.lineChartData.minutes.push(myearnings.dataResults[i].minutes.toFixed(2));
                myearnings.lineChartData.credits.push(myearnings.dataResults[i].credits.toFixed(2));
                myearnings.lineChartData.shows.push(myearnings.dataResults[i].shows);
            }
            let label = myearnings.lineChartData.labels;
            let minutes = myearnings.lineChartData.minutes;
            let credits = myearnings.lineChartData.credits;
            let shows = myearnings.lineChartData.shows;
        //    charts
            myearnings.drawChart('#minutesCtx','Minutes by day (in show)', label, minutes,'blue');
            myearnings.drawChart('#creditsCtx','Credits Earned by day', label, credits,'green');
            myearnings.drawChart('#showsCtx','Shows by day (all)', label, shows,'red');

        }
    }

});
