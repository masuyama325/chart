/*global $*/
$('#button').on('click', function() {
  alert("クリックされました");

  /*global google*/
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'id');
      data.addColumn('number', 'open');
      data.addColumn('number', 'high');
      data.addColumn('number', 'low');
      data.addColumn('number', 'close');
      data.addColumn('number', 'date');
      data.addColumn('string', 'yoso');
      data.addColumn('string', 'result');
  
      //td用の数値取得
      ('#graph01 td').each(function(index , elm){
        data.addRow([
          elm.find('.date').text(),
          parseInt(elm.find('.open').text(),10),
          parseInt(elm.find('.high').text(),10),
          parseInt(elm.find('.low').text(),10),
          parseInt(elm.find('.close').text(),10)
          
        ]);
      });
  
  
      var options = {
        legend:'none'
      };
  
      var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));
  
      chart.draw(data, options);
    }

});

# // //項目用の配列を定義
# // var array01 = [];
# // var array02 = [];

# // ("btn1").on("click", function()  {
# //   //th用の文字取得
# //   // ('#graph01 th').each(function(index , elm){
# //   //   var amount01 = elm.text();
# //   //   array01.push(amount01);
# //   // });

# //   //td用の数値取得
# //   ('#graph01 td').each(function(index , elm){
# //     var amount01 = elm.text();
# //     array01.push(amount01);
# //   });
# // });



