require 'spec_helper'

module XCTestRunner
  describe Watcher do
    describe 'in general' do
      before do
        @configuration = Configuration.new
        @target = Target.new('MyModule', 'Sources', 'MyModuleTests', 'Tests')
        @configuration.targets = [@target]
        @driver = Driver.new @configuration
        @watcher = Watcher.new @driver, @target
      end

      it 'should discover the directories to watch' do
        expect(@watcher.send(:all_target_directories)).to eq(['Sources', 'Tests'])
      end
    end
  end
end
