module Spec
  class ContainExactlyExpectation(T)
    def initialize(@expected_value : Array(T))
    end

    def match(actual_value : Array(T))
      return false if actual_value.size != @expected_value.size
      actual_value.each do |value|
        return false if @expected_value.count(value) !=
          actual_value.count(value)
      end
      true
    end

    def failure_message(actual_value)
      "Expected: #{actual_value.inspect}\nto have the same elements as: #{@expected_value.inspect}"
    end

    def negative_failure_message(actual_value)
      "Expected: value #{actual_value.inspect}\n not to have the same elements as: #{@expected_value.inspect}"
    end
  end

  module Expectations
    def contain_exactly(array)
      Spec::ContainExactlyExpectation.new(array)
    end
  end
end
