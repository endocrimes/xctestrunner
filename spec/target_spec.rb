require 'spec_helper'

module XCTestRunner
  describe Target do
    describe 'in general' do
      before do
        @target = Target.new('MyModule', 'Sources', 'MyModuleTests', 'Tests')
      end

      it 'should return a valid test identifier' do
        expect(@target.identifier_for_suite_named('KittensTest')).to eq('MyModuleTests.KittensTest')
      end
    end
  end
end
