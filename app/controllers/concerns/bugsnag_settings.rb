require 'active_support/concern'

module BugsnagSettings
  extend ActiveSupport::Concern

  included do
    before_bugsnag_notify :add_user_info_to_bugsnag

    private

    def add_user_info_to_bugsnag(report)
      if current_user
        report.user = {
            email: current_user.email,
            name: current_user.name,
            id: current_user.id
        }
      end
    end
  end
end
