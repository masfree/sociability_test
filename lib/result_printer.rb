class ResultPrinter
  def initialize
    begin
      current_path = File.dirname(__FILE__)
      result_path = current_path + "/../data/result.txt"
      results_file = File.new(result_path, "r:UTF-8")
      @results = results_file.readlines
      results_file.close
    rescue
      abort('Файл с результатами теста не найден.')
    end
  end

  RESULT_RATIO = [4, 9, 14, 19, 25, 30, 33]

  def print_result(points)
    i = 0
    while true
      if points < RESULT_RATIO[i]
        puts "\x1b[34m" + @results[i] + "\x1b[0m"
        break
      end
      i += 1
    end
  end
end