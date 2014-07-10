class GradeAnalyzer

  def initialize(grades)
    @grades = grades
  end

  def compare
    compared = []
    @grades.each_with_index do |grade, index|
      if grade == @grades[index - 1]
        compared << :even
      elsif grade > @grades[index - 1]
        compared << :up
      else grade < @grades[index - 1]
        compared << :down
      end
    end
    compared.shift
    compared
  end

  def determine_if_declining
    compared_grades = compare
    counter = 0
    compared_grades.each do |trend|
      if trend == :down
        counter += 1
      elsif trend == :up
        counter = 0
      end
    end
    if counter >= 3
      "in decline"
    else
      "not in decline"
    end
  end

end