require 'Xctestrunner'

module Xctestrunner
  describe Runner do
    describe 'in general' do
      before do
        configuration = Configuration.new
        configuration.test_module_name = 'MyModuleTests'
        configuration.scheme = 'MyModule'
        configuration.destination = 'platform=FairyDust'

        @runner = Runner.new configuration
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
        @runner.run('MyModuleTests.MagicalTest')
      end
    end
  end
end
