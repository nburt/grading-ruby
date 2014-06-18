class GradeAnalyzer

  def initialize(grades)
    @grades = grades
  end

  def differences
    differences = []
    @grades.each_with_index do |grade, index|
      if grade < @grades[index - 1]
        differences << :down
      elsif grade > @grades[index - 1]
        differences << :up
      elsif grade == @grades[index - 1]
        differences << :even
      end
    end
    differences.shift
    differences
  end

  def trend(grade_differences)
    consecutive_decline = 0
    grade_differences.each do |trend|
      if trend == :up
        consecutive_decline = 0
      elsif trend == :down
        consecutive_decline += 1
      end
    end

    if consecutive_decline >= 3
      "in decline"
    else
      "not in decline"
    end
  end

end