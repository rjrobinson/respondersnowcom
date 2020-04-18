# frozen_string_literal: true

class WorkHistory < ApplicationRecord
  belongs_to :agency
  belongs_to :user

  def pretty_start
    "#{Date::MONTHNAMES[start_date.month]}-#{start_date.year}"
  end

  def pretty_end
    current ? 'Current' : "#{Date::MONTHNAMES[end_date.month]}-#{end_date.year}"
  end
end
