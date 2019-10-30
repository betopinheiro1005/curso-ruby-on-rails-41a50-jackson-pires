class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient

  accepts_nested_attributes_for :patient, reject_if: :all_blank, allow_destroy: true
end
