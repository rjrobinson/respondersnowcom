namespace :incident do
  desc "Any Incident that has been running for longer then 3 hours."
  task prune_status: :environment do
    ClearIncidentJob.perform_later
  end
end
