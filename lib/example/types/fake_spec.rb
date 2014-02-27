describe 'fake' do

  # what to test

  # what parameters and properties it has
  # what things are required, what things are optional
  # test autorequires
  # test validation

  let :params
    :name => 'some_name'
  end

  it should_be_valid.with_default_provider().with_parameters().with_properties()

  it should_fail

end
