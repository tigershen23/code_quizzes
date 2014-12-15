class Document < ActiveRecord::Base
  belongs_to :approver, class_name: 'User'
  delegate :name, :email, to: :approver, prefix: true
end
