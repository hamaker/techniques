class Technique < ApplicationRecord
  belongs_to :attack
  belongs_to :defense

  def full_name
    "#{group} #{attack.name} #{defense.name}"
  end
end
