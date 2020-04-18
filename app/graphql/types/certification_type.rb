# frozen_string_literal: true

class Types::CertificationType < Types::ActiveRecordBase
  implements Types::NodeType

  field :abvr, String, null: false
  field :active, Boolean, null: false
  field :course_code, String, null: false
  field :name, String, null: false

end

git config --global user.name "RJ Robinson"
git config --local user.email 'RobertJ.Robinson@gmail.com'