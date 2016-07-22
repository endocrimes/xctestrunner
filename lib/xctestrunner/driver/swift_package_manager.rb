module XCTestRunner
  class Driver
    class SwiftPackageManager < Driver
      def run(target, test_case)
        specifier = target.specifier_for_case test_case
        system('swift', 'build')
        system('swift', 'test', '--specifier', specifier)
      end
    end
  end
end
