# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def graphql_type
    "Types::#{self.class.to_s}Type".constantize
  end

end
