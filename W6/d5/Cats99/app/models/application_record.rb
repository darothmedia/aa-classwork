class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  skip_before_action :verify_authenticity_token
end
