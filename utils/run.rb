module Utils

  class Run

    def self.run_python file, input, time
      
      unless input.nil?
        cmd = "python #{file} 2>&1 < #{input}"
      else
        cmd = "python #{file} 2>&1"
      end
      t1 = Thread.new do
        `#{cmd}`
      end

      retVal = t1.join(time)

      unless retVal.nil?
        retVal = t1.value
      else
        t1.kill
        retVal = "Process overtimed."
      end

      return retVal

    end

    def self.verify_answer generates, answer
      return generates == answer
    end
  end
end