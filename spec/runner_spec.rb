require 'spec_helper'

module XCTestRunner
  describe Runner do
    describe 'in general' do
      before do
        @configuration = Configuration.new
        @target = Target.new('MyModule', 'Sources', 'MyModuleTests', 'Tests')
        @configuration.targets = [@target]
        @configuration.destination = 'platform=FairyDust'

        @runner = Runner.new @configuration
      end

      it 'should pass arguments from configuration to xcodebuild' do
        expect(@runner).to receive(:system).with('xcodebuild',
                                                 'test',
                                                 '-scheme',
                                                 'MyModule',
                                                 '-destination',
                                                 'platform=FairyDust',
                                                 '-only-testing',
                                                 'MyModuleTests.MagicalTest')  
        @runner.run(@target, 'MyModuleTests.MagicalTest')
      end
    end
  end
end
