class HospitalStatus < ApplicationRecord
  belongs_to :hostpital


  def expired?
    expire_time < Time.now
  end

end
