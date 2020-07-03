class StudytimesController < ApplicationController
  def new
    @studytime = Studytime.new
    # 実現したいこと
    # ・７日前から今日に当たるレコードをdayカラムから取得　→　前提としてseed投入
    # advance(days: -7)7日前の日付を取得
    # Date.today本日の日付を取得
    # Studytime.where(day: Date.today.advance(days: -7)..Date.today)
    # 1週間前から本日までのレコードを取得
    # startとendを引き算した数字（3600.0）をtimeカラムにして、それも一緒にインスタンス変数に格納
    # そうすればヘルパー不要になる
    # ・同じ日にちのdayで同じタイトルの学習時間はひとまとめにする
    @studytimes = Studytime.where(day: Date.today.advance(days: -7)..Date.today).order(day: :desc)
  end

  def create
    studytime = Studytime.new(title: studytime_params[:title], day: studytime_params[:day], start_time: studytime_params[:start_time], end_time: studytime_params[:end_time], admin_user_id: current_admin_user.id)
    begin
    if studytime.save
      redirect_to new_studytime_path, notice: "学習記録作成に成功しました。"
    else
      flash.now[:alert] = "学習記録作成に失敗しました。"
      render new_studytime_path
    end
    rescue ActiveRecord::NotNullViolation => e
      redirect_to new_studytime_path, alert: "学習記録作成に失敗しました。"
    end
  end

  def show
    @studytime_all_records = Studytime.all
    @duration = (Date.today - Studytime.order(start_time: "asc").first[:start_time].to_date).to_i
    @first_starttime = Studytime.order(start_time: "asc").first
  end

  private
    def studytime_params
      params.require(:studytime).permit(:title, :day, :start_time, :end_time,)
    end
end