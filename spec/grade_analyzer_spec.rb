require './lib/grade_analyzer'

describe GradeAnalyzer do

  it 'can describe whether the grade is higher, lower, or even with the previous grade' do
    input = [6,3,5,4,3,4,4,5]

    grade_analyzer = GradeAnalyzer.new(input)
    expect(grade_analyzer.differences).to eq [:down,:up,:down,:down,:up,:even,:up]
  end

  it 'can tell if a student is in decline' do
    input = [10, 9, 8, 7]
    input2 = [10, 10, 10, 9, 9, 8, 8, 8, 8, 7]

    grade_analyzer = GradeAnalyzer.new(input)
    result = grade_analyzer.trend(grade_analyzer.differences)

    grade_analyzer2 = GradeAnalyzer.new(input2)
    result2 = grade_analyzer2.trend(grade_analyzer2.differences)

    expect(result).to eq 'in decline'
    expect(result2).to eq 'in decline'
  end

  it 'can tell if a student is not in decline' do
    input = [10, 9, 8, 7, 8, 7, 6, 6]
    input2 = [10, 9, 8]

    grade_analyzer = GradeAnalyzer.new(input)
    result = grade_analyzer.trend(grade_analyzer.differences)

    grade_analyzer2 = GradeAnalyzer.new(input2)
    result2 = grade_analyzer2.trend(grade_analyzer2.differences)

    expect(result).to eq 'not in decline'
    expect(result2).to eq 'not in decline'
  end

end