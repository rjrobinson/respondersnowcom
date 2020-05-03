# frozen_string_literal: true

class ClearIncidentJob < ApplicationJob
  queue_as :default

  def perform
    puts "Running Incident Pruner. "
    status = IncidentStatus.find_or_create_by(name: "clear", abvr: "cl")
    Incident.where('created_at < ?', 90.minutes.ago).where.not(incident_status_id: status.id).each(&:resolve_stale)
  end
end
