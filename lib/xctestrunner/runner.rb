module XCTestRunner
  class Runner
    # @return [Configuration] The project configuration that we should run
    #                         tests for.
    #
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def run(target, specifier)
      system('xcodebuild', 'test',
             '-scheme', target.scheme,
             '-destination', configuration.destination,
             '-only-testing', specifier)
    end
  end
end
