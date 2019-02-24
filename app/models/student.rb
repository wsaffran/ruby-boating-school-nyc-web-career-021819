class Student

  attr_accessor :first_name
  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(boating_test_name, boating_test_status, instructor)
    BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
  end

  def self.find_student(first_name)
    self.all.select do |student|
      student.first_name == first_name
    end
  end

  def grade_percentage
    #find passing tests and then divide that number by the total tests taken
    total_tests = 0
    tests_passed = 0
    BoatingTest.all.each do |test|
      if test.student == self
        total_tests += 1
        if test.boating_test_status == "passed"
          tests_passed += 1
        end
      end
    end
    tests_passed.to_f / total_tests.to_f * 100
  end

end
