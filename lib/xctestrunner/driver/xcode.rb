module XCTestRunner
  class Driver
    class Xcode < Driver
      def run(target, test_case)
        specifier = target.specifier_for_case test_case
        system('xcodebuild', 'test',
               '-scheme', target.scheme,
               '-destination', configuration.destination,
               '-only-testing', specifier)
      end
    end
  end
end
