require 'listen'

module XCTestRunner
  class Watcher
    attr_accessor :driver
    attr_accessor :target

    def initialize(driver, target)
      @driver = driver
      @target = target
    end
  
    def watch!
      listener = Listen.to(target.sources_root, target.tests_root) do |modified, added, removed|
        run_tests_for_files(modified + added)
      end
      listener.start
      sleep
    end

    def run_tests_for_files(files)
      cases = files.map { |f| test_for_file f }.compact.uniq
      if cases.count == 0
        # nop
      elsif cases.count == 1
         run_test_with_name cases[0]
      else
        # Currently, you can only run [Single Test, Single Case, All Tests]
        driver.run_all
      end
    end

    private

    def run_test_with_name(test_name)
      puts "- Running test case: #{test_name}"
      driver.run(target, test_name)
    end

    def test_for_file(file)
      target.test_for_file file
    end
  end
end
