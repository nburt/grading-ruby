require './lib/grade_analyzer'

describe GradeAnalyzer do
  it 'given an array of grades, returns whether each grade was higher, lower, or even to the previous grade' do
    grades = [6,3,5,4,3,4,4,5]
    grade_analyzer = GradeAnalyzer.new(grades)
    expect(grade_analyzer.compare).to eq [:down,:up,:down,:down,:up,:even,:up]
  end

  it 'can tell if a student is in decline' do
    grades = [10, 10, 10, 9, 9, 8, 8, 8, 8, 7]
    grade_analyzer = GradeAnalyzer.new(grades)
    expect(grade_analyzer.determine_if_declining).to eq 'in decline'
  end

  it 'can tell if a student with fewer grades is in decline' do
    grades = [10, 9, 8, 7]
    grade_analyzer = GradeAnalyzer.new(grades)
    expect(grade_analyzer.determine_if_declining).to eq 'in decline'
  end

  it 'can tell if a student is not in decline' do
    grades = [10, 9, 8, 7, 8]
    grade_analyzer = GradeAnalyzer.new(grades)
    expect(grade_analyzer.determine_if_declining).to eq 'not in decline'
  end

  it 'knows that a student with only two declining grades is not in decline' do
    grades = [10, 9, 8]
    grade_analyzer = GradeAnalyzer.new(grades)
    expect(grade_analyzer.determine_if_declining).to eq 'not in decline'
  end
end