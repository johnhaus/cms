class Page < ApplicationRecord

  belongs_to :subject
  has_and_belongs_to_many :admin_users

end
