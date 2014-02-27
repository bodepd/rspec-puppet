require 'spec_helper'
require 'ruby-debug'

describe 'fake' do

  let :params do
    {:name => 'foo'}
  end

  it {should be_valid_type.with_default_provider(:default)}

end
