module XCTestRunner
  class Target
    require 'pathname'
    attr_accessor :module_name
    attr_accessor :sources_root

    attr_accessor :tests_module_name
    attr_accessor :tests_root

    def initialize(module_name, sources_root, tests_module_name, tests_root)
      @module_name = module_name
      @sources_root = Pathname(sources_root).realpath
      @tests_module_name = tests_module_name
      @tests_root = Pathname(tests_root).realpath
    end

    def specifier_for_case(test_case)
      "#{tests_module_name}.#{test_case}"
    end

    def test_for_file(file)
      if is_source?(file)
        file_name = Pathname(file).relative_path_from sources_root
        file_name.to_s.gsub('.swift', 'Tests')
      elsif is_test?(file)
        Pathname(file).basename.to_s.gsub('.swift', '')
      end
    end
 
    def contains_file(file)
      in_sources = child?(sources_root, file)
      in_tests = child?(tests_root, file) unless in_sources

      in_sources || in_tests
    end

    private

    def is_source?(file)
      child?(sources_root, file)
    end

    def is_test?(file)
      child?(tests_root, file)
    end

    def child?(root, target)
      require 'find'
      # Inefficient, but it does the job for now.
      Find.find(root).include? target
    end
  end
end
