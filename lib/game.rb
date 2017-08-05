class Game
  attr_accessor :points, :game_step

  def initialize(name)
    begin
      current_path = File.dirname(__FILE__)
      questions_path = current_path + "/../data/questions.txt"

      questions_file = File.new(questions_path, "r:UTF-8")
      @questions = questions_file.readlines
      questions_file.close

    rescue
      abort 'Ошибка чтения вопросов'
    end

    self.points = 0
    self.game_step = 0
    name = "Anon" if name == nil
    puts "Привет, " + name
  end

  def play_test
    while in_progress?
      ask_question
      test_progress
    end
  end

  def ask_question
    puts "\x1b[33m"+ @questions[game_step] + "\x1b[0m"
    puts "1 - «нет», 2 - «иногда», 3 - «да»"
    @answer = STDIN.gets.chomp
  end

  def test_progress
    self.game_step += 1 if correct_input?
    case @answer
      when "2" then self.points += 1
      when "3" then self.points +=2
    end
    @answer = nil
  end

  def in_progress?
    game_step < @questions.length
  end

  def correct_input?
    @answer == "1" || "2" || "3"
  end
end

