# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  prenom     :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
end