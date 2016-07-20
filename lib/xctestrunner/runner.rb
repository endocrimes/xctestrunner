module Xctestrunner
  class Runner
    # @return [Configuration] The project configuration that we should run
    #                         tests for.
    #
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def run(specifier)
      system('xcodebuild', 'test',
             '-scheme', configuration.scheme,
             '-destination', configuration.destination,
             '-only-testing', specifier)
    end
  end
end
