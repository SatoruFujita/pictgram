class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    favorited = Favorite.find_by(user_id: favorite.user_id, topic_id: favorite.topic_id)
    if favorited
      if favorited.destroy
        redirect_to topics_path, success: 'お気に入りの登録を解除しました'
      else
        redirect_to topics_path, danger: 'お気に入りの登録解除に失敗しました'
      end
    else
      if favorite.save
        redirect_to topics_path, success: 'お気に入りに登録しました'
      else
        redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
      end
    end
  end
end
