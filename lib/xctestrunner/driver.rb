module XCTestRunner
  class Driver
    autoload :SwiftPackageManager, 'xctestrunner/driver/swift_package_manager'
    autoload :Xcode, 'xctestrunner/driver/xcode'

    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def run(target, test_case)
      raise Informative, 'Driver::run must be overriden by subclasses'
    end
  end
end
