class ClearIncidentJob < ApplicationJob
    queue_as :default

    def perform
        # Get incidents
        # obtain clear status 
        puts "Running Incident Pruner. "
        status = IncidentStatus.find_or_create_by(name: "clear", abvr: "cl")
        user_bot = User.find_by(uid: "RNBot")
        
        incidents = Incident.where('created_at < ?', 90.minutes.ago).where.not(incident_status_id: status.id)
        
        incidents.each do |incident|
        
            if incident.incident_reports.order(:updated_at).last.updated_at > 30.minutes.ago || incident.incident_reports.count == 0
                incident.incident_reports.new(message: " - AUTOMATED CLEAR MESSAGE -\nThis incident has been marked inactive", user: user)
                incident.update(incident_status: status)
            end

        end
    end
end  