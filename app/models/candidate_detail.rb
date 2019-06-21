class CandidateDetail < ApplicationRecord
  validates :s_no, presence: {message:"S.No. must specified"},uniqueness: {message:"S.No. already exist."}
  validates :src_reg, presence:true, format:{with: /\AR/,message: "Please enter Source of Regeistration in following format -> N/state abbrivation."}
  validates :src_reg, length:{is: 4,message:"Please enter state abbrivation correctely (only 2 letters of state abbrivation."}
  validates :reg_no,presence: true
  validate :match_regno
  validates :name, presence:{message:"Name must specified."}
  validates :gender, presence:{message:"Gender must specified."}
  validates :age, presence: {message:"Age must specified."}
  validates :email, presence:{message:"Email is required."}, uniqueness: {message:"Email is already exist."},format:{with:/@/,message:"Email must contain @."}
  validates :contact_no, presence:{message:"Contact Number is required."},uniqueness: {message:"Contact Number is already exist."},length: {is: 10,message:"Contact Numbers must be 10 digits."}
  validate :check_remark
  validate :status_now
  def match_regno
    unless reg_no=="NZ/"+src_reg+"/"+s_no.to_s
      errors.add(:reg_no,"Registration Number is incorrect. It must be in following pattern NZ/Source of Registration/S.No.")
    end
  end
  def check_remark
    unless (1..10)===remarks_mobility
      errors.add(:remarks_mobility,"Remark_mobility must be between the range 1 to 10.")
    end
  end
  def status_now
    unless ["pending", "joined", "joining", "not interested", "study", "not responding"].include?status
      errors.add(:status,"Status must be one of following -> pending, joined, joining, not interested, study, not responding.")
    end
  end

end
