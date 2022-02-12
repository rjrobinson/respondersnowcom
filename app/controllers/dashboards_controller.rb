# frozen_string_literal: true

# allows return of the approiate dashboard based on the user's role
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def dashboard_1; end

  def dashboard_2
    @certification = AcquiredCertification.new
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    render(layout: "layout_2")
  end

  def dashboard_4_1; end

  def dashboard_5; end
end
