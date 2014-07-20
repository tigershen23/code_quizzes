class Post < ActiveRecord::Base
  belongs_to :user

  default_scope -> { where("id > ?", 100) }
  scope :popular, -> { where("comment_count > ?", 97) }
  scope :old, -> { where("created_at < ?", 2.years.ago) }

  private
    def post_params
      params.require(:post).permit(:body, :title, :comment_count, :user_id, :created_at)
    end
end
