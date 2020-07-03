class TopsController < ApplicationController
  def index
    # 全てのレコードを呼び出して
    # start_time,end_timeの差分を計算し、
    # 全て合算する
    @studytime_all_records = Studytime.all
    @duration = (Date.today - Studytime.first[:start_time].to_date).to_i
  end
end