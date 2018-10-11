module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :locations, [LocationType], null: true,
          description: 'List of locations'

    def locations
      Location.where.not(county: nil)
    end

    # TODO: remove me
    field :test_field, String, null: false,
          description: "An example field added by the generator"

    def test_field
      "Hello World!"
    end
  end

end
