// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function loadReport(data) {
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
              title: 'Expenses by tag'
            }
          });

  pie.draw(data);
}

onLoad(function() {
  $.ajax({
    url: "/reports/expenses_by_tag",
    data: {
      name: "Expenses By Tag"
    },
    success: function( data ) {
      loadReport(data);
    }
  });
});