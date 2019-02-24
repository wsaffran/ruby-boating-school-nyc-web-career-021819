class Instructor

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def pass_student(student, boating_test_name)
    BoatingTest.all.each do |test|
      if test.student == student && test.boating_test_name == boating_test_name
        test.boating_test_status= "passed"
        return test
      else
        BoatingTest.new(student, boating_test_name, "passed", self)
      end
    end
  end

  def fail_student(student, boating_test_name)
    BoatingTest.all.each do |test|
      if test.student == student && test.boating_test_name == boating_test_name
        test.boating_test_status= "failed"
        return test
      else
        BoatingTest.new(student, boating_test_name, "failed", self)
      end
    end
  end

end
