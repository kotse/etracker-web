// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createReport() {
  var report_type = $(".select_report:checked").val();

  if ("by_tag" == report_type) {
    generateReport("Expenses by tag", "/reports/expenses_by_tag", drawPieChart);
  } else if ("over_time" == report_type) {
    generateReport("Expenses over time", "/reports/expenses_over_time", drawBarChart);
  }
}

// load data and call draw report function
function generateReport(title, url, drawReport) {
  $.ajax({
    url: url,
    data: {
      name: title
    },
    success: function( data ) {
      drawReport(title, data);
    }
  });
}

function drawPieChart(title, data) {
  $("#chart_report").empty();
  var pie = d3.select('#chart_report')
        .append('svg')
          .attr('width', 450)
          .attr('height', 300)
          .chart('Pie', {
            width: 450,
            height: 300,
            radius: 100,
            donutHole: {
              radius: 80,
              color: 'white'
            },
            labelTemplate: '{label}: {value}',
            legend: {
              title: title
            }
          });

  pie.draw(data);
}

function drawBarChart(title, data) {
  $("#chart_report").empty();
  var barChart = d3.select("#chart_report")
      .append("svg")
      .chart("BarChart")
      .width(450)
      .height(300);

    barChart.draw(data);
}

onLoad(function() {
  $("#btn-gen-report").click(createReport);
});