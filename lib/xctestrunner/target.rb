module XCTestRunner
  class Target
    attr_accessor :module_name
    attr_accessor :sources_root

    attr_accessor :tests_module_name
    attr_accessor :tests_root

    attr_accessor :scheme

    def initialize(module_name, sources_root, tests_module_name, tests_root, scheme: module_name)
      @module_name = module_name
      @sources_root = sources_root
      @tests_module_name = tests_module_name
      @tests_root = tests_root
      @scheme = scheme
    end

    def identifier_for_suite_named(name)
      "#{tests_module_name}.#{name}"
    end
  end
end
