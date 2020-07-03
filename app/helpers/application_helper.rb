module ApplicationHelper
  # ミリ秒を時間と分の文字列型に変える
  def calc_ms_to_time_string(ms)
    if ms >= 3600
      hour = ms / 3600
      minutes = (ms % 3600) / 60

      case minutes
      when 0
        "#{hour}:00"
      when 1..9
        "#{hour}:0#{minutes}"
      else
        "#{hour}:#{minutes}"
      end

    else
      minutes = ms / 60
      "#{minutes}分"
    end
  end

  # １レコードの学習時間取得
  def studytime_to_ms_one(end_time, start_time)
    end_time.to_i - start_time.to_i
  end

  # 全レコードの累計学習時間取得
  def studytime_to_ms_all(records)
    time = []
    records.each do |record|
      time << studytime_to_ms_one(record.end_time, record.start_time)
    end
    time.sum
  end

  def culc_parsent(records)
    items = []
    records.each do |record|
      items << record.title
    end
    titles = items.inject(Hash.new(0)){|hash, title| hash[title] += 1; hash}
    # sortで[["ruby", 8]["php", 4]]のようになる。降順でソート
    titles = titles.sort_by{ |key, value| value }.reverse
  end

  def show_parsent_number(titles)
    # 数があるだけ繰り返す
    title_sum = titles.sum { |title| title[1] }
    # titlesの配列の数があるだけ、計算を続けたい。
    # 戻り値は、全てのタイトル名の数の分だけ配列で戻す
    # [30, 25, 20, 15, 10]
    parsent = titles.map { |title| (title[1].to_f / title_sum.to_f * 100).round }
  end

  def show_parsent_title(titles)
    titles.map { |title| title[0] }
  end
end