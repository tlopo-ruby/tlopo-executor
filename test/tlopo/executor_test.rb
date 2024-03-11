require 'test_helper'

module Tlopo
  class ExecutorTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil(::Tlopo::Executor::VERSION)
    end

    def test_it_returns_success
      exec = Tlopo::Executor.new(5)
      fn = proc { 1 + 1 }
      10.times { exec.schedule(fn) }
      success = exec.run.success?
      assert success
    end

    def test_it_returns_errors
      exec = Tlopo::Executor.new(5)
      error_msg = 'My Error'
      fn = proc { raise error_msg }
      10.times { exec.schedule(fn) }
      errors = exec.run.errors
      assert_equal(error_msg, errors[-1].message)
    end

    def test_it_honours_size
      size = 5
      exec = Tlopo::Executor.new(5)
      holder = Holder.new
      fn = proc { holder.run }
      15.times { exec.schedule(fn) }
      Thread.new { exec.run }
      sleep(0.1)
      assert_equal(size, holder.count)
      sleep(1)
      assert_equal(size * 2, holder.count)
    end

    def test_run_or_die
      exec = Tlopo::Executor.new(5)
      error_msg = 'My Error'
      exec.schedule(proc { raise error_msg })
      e = assert_raises RuntimeError do 
        exec.run_or_die
      end
      assert_match /Found error/, e.message
    end
  end

  class Holder
    def initialize
      @count = 0
    end

    attr_reader :count

    def run
      @count += 1
      sleep(1)
    end
  end
end
