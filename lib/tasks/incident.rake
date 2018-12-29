namespace :incident do
  desc "Any Incident that has been running for longer then 3 hours."
  task prune_status: :environment do
    ClearIncidentsJob.perform_later
  end
end
