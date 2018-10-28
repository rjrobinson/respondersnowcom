# frozen_string_literal: true

class AcquiredCertification < ApplicationRecord
  belongs_to :user

  belongs_to :certification

  has_one_attached :file

  delegate :abbvr, :logo, :course_code, to: :certification

  def patch_image_name
    "patches/#{state.downcase}#{abbvr.downcase}"
  end


  def cert_logo
    image = if FileTest.exist?(Rails.root.join('app', 'assets', 'images', 'patches', "#{state.downcase}-#{abbvr.downcase}.png"))
      "patches/#{state.downcase}-#{abbvr.downcase}.png"
    elsif logo.attached?
      url_for(logo)
    else
      "defaults/#{course_code.downcase}.png"
    end
    image
  end
end
