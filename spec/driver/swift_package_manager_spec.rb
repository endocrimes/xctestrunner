require 'spec_helper'

module XCTestRunner
  class Driver
    describe SwiftPackageManager do
      describe 'in general' do
        before do
          @configuration = Configuration.new
          @target = Target.new('MyModule', 'Sources', 'MyModuleTests', 'Tests')
          @configuration.targets = [@target]
          @driver = Driver::SwiftPackageManager.new @configuration
        end

        it 'should pass arguments from configuration to swift test' do
          expect(@driver).to receive(:system).with('swift',
                                                   'test',
                                                   '--specifier',
                                                   'MyModuleTests.MagicalTest')
          @driver.run(@target, 'MagicalTest')
        end
      end
    end
  end
end
