module XCTestRunner
  class Configuration
    # @return [Target] The targets that should be watched and ran.
    #
    attr_accessor :targets

    # @return [String] The destination that targets should be executed on.
    #
    attr_accessor :destination
  end
end
