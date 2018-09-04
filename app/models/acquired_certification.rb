class AcquiredCertification < ApplicationRecord

  belongs_to :user

  belongs_to :certification

  has_one_attached :file

  validates_presence_of :file

  validates_presence_of :document

  delegate :abbvr, to: :certification

  def patch_image_name
    "patches/#{state.downcase}#{abbvr.downcase}"
  end

  def s3_credentials
    {
        bucket: "rnow-certifications-#{Rails.env}",
        access_key_id: ENV['AWS_SECRET_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_KEY']
    }
  end
end
