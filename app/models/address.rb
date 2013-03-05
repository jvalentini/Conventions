class Address < ActiveRecord::Base
  attr_accessible :address_to, :city, :state, :street1, :street2, :zip
end
