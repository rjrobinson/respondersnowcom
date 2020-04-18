# frozen_string_literal: true

class ResnowSchema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)

  def self.unauthorized_object(_error)
    raise GraphQL::ExecutionError, "Permissions configuration do not allow the object you requested"
  end

  def self.resolve_type(_type, obj, _ctx)
    obj.graphql_type
  end
end
