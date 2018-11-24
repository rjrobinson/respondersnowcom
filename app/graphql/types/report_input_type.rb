# frozen_string_literal: true

class Types::ReportInputType < Types::BaseInputType
  graphql_name "ReportInputType"

  description "Report Input Type. To create or edit one. "


  argument :incident_id, ID, required: true
  argument :report_id, ID, required: false do
    description "needed only for edit or destroy"
  end

  argument :message, String, required: true
  
end
