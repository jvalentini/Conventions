class User < ActiveRecord::Base
  attr_accessible :address_id, :first_name, :last_name
end
