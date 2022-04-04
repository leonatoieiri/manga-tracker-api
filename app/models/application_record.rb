class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_create :set_uuid
  
  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
