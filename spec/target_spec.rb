require 'spec_helper'

module XCTestRunner
  describe Target do
    describe 'in general' do
      before do
        @target = Target.new('MyModule', 'Sources', 'MyModuleTests', 'Tests')
      end

      it 'should return a valid test specifier' do
        expect(@target.specifier_for_case('KittensTest')).to eq('MyModuleTests.KittensTest')
      end
    end

    describe '#test_for_file(file)' do
      before do

      end

      it 'should return nil when there are no test files' do

      end

      it 'should return the test file when one exists for the source' do

      end

      it 'should return the test file when it is passed a test' do

      end
    end
  end
end
