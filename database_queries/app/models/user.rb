class User < ActiveRecord::Base
  has_many :posts

  private
    def user_params
      params.require(:user).permit(:name)
    end
end