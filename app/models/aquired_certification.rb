class AquiredCertification < ApplicationRecord

  belongs_to :responder
  belongs_to :certification

  # validates :number, uniqueness: true

  has_attached_file :document,
                    storage: :s3,
                    s3_credentials: Proc.new { |a| a.instance.s3_credentials },
                    s3_region: ENV['AWS_REGION'],
                    :thumb => ['120x120#', :png],
                    :s3_permissions => 'public-read',
                    dependent: :destroy
  validates_attachment :document, content_type: {content_type: ['application/pdf', 'image/jpeg', 'image/gif', 'image/png']}

  validates_presence_of :document

  def s3_credentials
    {
        bucket: "rnow-certifications-#{Rails.env}",
        access_key_id: ENV['AWS_SECRET_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_KEY']
    }
  end
end
