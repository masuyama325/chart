class CandleSticksController < ApplicationController
  def index
    
    startday = Date.today.last_month.beginning_of_month
    endday = Date.today.last_month.end_of_month
    @sticks = CandleStick.where('date >= ? AND date <= ?', startday,endday)
    # binding.pry
  end

  def candlestick_chart
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'day')
    data_table.new_column('number', 'min')
    data_table.new_column('number', 'opening')
    data_table.new_column('number', 'closing')
    data_table.new_column('number', 'max')
    data_table.add_rows(
      [
        ['Mon',20,28,38,45],
        ['Tue',31,38,55,66],
        ['Wed',50,55,77,80],
        ['Thu',50,77,66,77],
        ['Fri',15,66,22,68]
      ]
    )
    opts   = { :width => 800, :height => 480, :legend => 'none' }
    @chart = GoogleVisualr::Interactive::CandlestickChart.new(data_table, opts)
  end
end