class FrnowSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)


  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "Permissions configuration do not allow the object you requested"
  end


  def self.resolve_type(type, obj, ctx)
    obj.graphql_type
  end

end
