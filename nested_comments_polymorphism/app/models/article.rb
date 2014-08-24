class Article < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy

  private
    def article_params
      params.require(:article).permit(:body, :title)
    end
end
