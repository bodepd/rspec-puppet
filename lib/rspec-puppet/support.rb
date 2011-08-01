module RSpec::Puppet
  module Support 
    def build_catalog nodename, facts_val
      node_obj = Puppet::Node.new(nodename)

      node_obj.merge(facts_val)
      
      @top_scope = Puppet::Parser::Scope.new
      @top_scope.parent = nil
      @scope = Puppet::Parser::Scope.new
      @scope.compiler = Puppet::Parser::Compiler.new(node_obj)
      @scope.parent = @top_scope
      @compiler = @scope.compiler
      
      # trying to be compatible with 2.7 as well as 2.6
      if Puppet::Resource::Catalog.respond_to? :find
        @compiler.compile.to_resource
        #Puppet::Resource::Catalog.find(node_obj.name, :use_node => node_obj)
      else
        require 'puppet/face'
        #Puppet::Resource::Catalog.indirection.find(node_obj.name, :use_node => node_obj)
        Puppet::Face[:catalog, :current].find(node_obj.name, :extra => { :use_node => node_obj } )
      end
    end
  end
end
