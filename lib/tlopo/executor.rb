require 'tlopo/executor/version'

module Tlopo
  # Simple Executor service aka threadpool executor
  class Executor
    def initialize(size = 10)
      @pool = SizedQueue.new(size)
      size.times { @pool << 1 }
      @mutex = Mutex.new
      @running_threads = []
      @error = []
      @jobs = Queue.new
    end

    def schedule(task)
      @jobs << task
    end

    def run
      loop do
        break if @jobs.empty?
        run_job @jobs.pop
      end
      @running_threads.each(&:join)
      self
    end

    def success?
      @error.empty?
    end

    def errors
      @error
    end

    private

    def run_job(task)
      @pool.pop
      @mutex.synchronize do
        @running_threads << Thread.start do
          begin
            task.call
          rescue Exception => e
            @error << e
          ensure
            @pool << 1
          end
        end
      end
    end
  end
end
