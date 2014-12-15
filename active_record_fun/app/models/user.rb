class User < ActiveRecord::Base
  has_many :documents, foreign_key: 'approver_id'
end
