require 'spec_helper'

module XCTestRunner
  class Driver
    describe Xcode do
      describe 'in general' do
        before do
          @configuration = Configuration.new
          @target = Target.new('MyModule', 'Sources', 'MyModuleTests', 'Tests')
          @configuration.targets = [@target]
          @driver = Driver::Xcode.new @configuration
        end

        xit 'should pass arguments from configuration to xcodebuild' do
          expect(@driver).to receive(:system).with('xcodebuild',
                                                   'test',
                                                   '-scheme', 'MyModule',
                                                   '-destination',
                                                   'platform=FairyDust',
                                                   '-only-testing',
                                                   'MyModuleTests.MagicalTest')
          @driver.run(@target, 'MagicalTest')
        end
      end
    end
  end
end
