class Page < ApplicationRecord

  belongs_to :subject, { :optional => false } # can configure to true for legacy databases if needed

  has_and_belongs_to_many :admin_users

end
