#!/usr/bin/env ruby
require_relative 'Factorial'
require 'test/unit'

class FactorialTest < Test::Unit::TestCase
  @@f = File.open("Factorial_Ruby_results.csv", "w")
  @@subject = Factorial.new()

  def setup
    @@f.close unless @@f.closed?
    @@f = File.open("Factorial_Ruby_results.csv", "a")

  end

  def teardown
    assertion_failed = "null"
    message = "null"
    if not passed?
      if @_result.errors.any?
        @@f.close
        f = File.open("Factorial_Ruby_results.csv", "w")
        error = @_result.errors.last.exception
        f.write "#{error}\n#{error.backtrace.join("\n")}"
        @@f.close
        exit(2)
      end
      if @_result.failures.any?
        assertion_failed = "AssertionFailedError"
        message = @_result.failures.last.user_message || "expected:<#{@_result.failures.last.expected}> but was:<#{@_result.failures.last.actual}>"
      end
    end
    test_location = File.expand_path(File.dirname(__FILE__))
    test_class = self.class
    @@f.write "#{test_location},#{test_class},#{method_name},0,0,#{assertion_failed},#{message},#{passed? ? 1 : 0}\n"
    @@f.close
  end

  def testFactorial0
    # if @subject.factorial(0)==1
    #   @@f.write("1,,5\n")
    # else
    #   @@f.write("0,Simple Factorial falsification test failed,5\n")
    # end
    assert_equal(1, @@subject.factorial(0))
  end

  def testFactorial1
    # if @subject.factorial(1)==1
    #   @@f.write("1,,1\n")
    # else
    #   @@f.write("0,Simple Factorial test failed,1\n")
    # end
    assert_equal(1, @@subject.factorial(1))
  end

  def testFactorial2
    # if @subject.factorial(2)==2
    #   @@f.write("1,,2\n")
    # else
    #   @@f.write("0,Zero Factorial test failed,2\n")
    # end
    assert_equal(2, @@subject.factorial(2))
  end

  def testFactorial3
    # if @subject.factorial(3)==6
    #   @@f.write("1,,3\n")
    # else
    #   @@f.write("0,Simple Factorial falsification test failed,3\n")
    # end
    assert_equal(6, @@subject.factorial(3), "this test failed Xavi")
  end

  def testFactorial4
    # if @subject.factorial(4)==24
    #   @@f.write("1,,4\n")
    # else
    #   @@f.write("0,Large Factorial test failed Factorial test failed,4\n")
    # end
    assert_equal(24, @@subject.factorial(4))
  end

  def testFactorial7
    # if @subject.factorial(7)==5040
    #   @@f.write("1,,6\n")
    # else
    #   @@f.write("0,Large Factorial test failed Factorial test failed,6\n")
    # end
    assert_equal(5040, @@subject.factorial(7))
  end


end
