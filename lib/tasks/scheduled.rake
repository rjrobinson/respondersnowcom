namespace :scheduled do
  
  desc "Hospital Status Job that will Query NJ Hipocraties for Divert Status"
  
  task hospital_statuses: :environment do
    puts "Starting Status Update"
    HospitalStatusJob.perform_now
    puts "Finished"
  end

end
