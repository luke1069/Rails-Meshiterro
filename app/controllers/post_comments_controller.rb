class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    # ユーザーid/画像idの両方チェックが必要
    # ER図の関連性を示す為
    # カラムをどう紐付けているかの疑問は、ここで説明できます
    comment.save
    redirect_to post_image_path(post_image.id)
  end

  def destroy
     PostComment.find_by(id: params[:id]).destroy
     redirect_to post_image_path(params[:post_image_id])
  end

private

def post_comment_params
  params.require(:post_comment).permit(:comment)
end

end