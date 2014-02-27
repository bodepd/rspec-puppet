module RSpec::Puppet
  module TypeExampleGroup
    include RSpec::Puppet::TypeMatchers
    include RSpec::Puppet::Support

    def subject
      @type ||= begin
        setup_puppet
        type_name = self.class.top_level_description.downcase
        Puppet::Type.type(type_name)
      end
puts 'foo'
      @type
    end

  end
end
