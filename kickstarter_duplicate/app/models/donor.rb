class Donor < ActiveRecord::Base
  has_many :projects
  has_many :donations
end 