require 'spec_helper'
describe 'mde' do
  context 'with default values for all parameters' do
    it { should contain_class('mde') }
  end
end
