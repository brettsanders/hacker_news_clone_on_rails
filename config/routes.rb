RailsHackerNews::Application.routes.draw do

#USER ROUTES
root to: 'pages#index', as: 'homepage'
resources :users, except: [:index]
get '/login', to: 'sessions#new'


#SESSION ROUTES
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'


#POST ROUTES
resources :posts do
  get 'vote_up', to: 'votes#post_vote_up'
  get 'vote_down', to: 'votes#post_vote_down'
end


#COMMENT ROUTES
resources :comments, except: [:index] do
  get 'vote_up', to: 'votes#comment_vote_up'
  get 'vote_down', to: 'votes#comment_vote_down'
  # COMMENT VOTES ROUTES
  # get '/vote/comment/:comment_id/:post_id/up' do
  #   @post_id = params[:post_id]
  #   Commentvote.create(comment_id: params[:comment_id], vote: 1)
  #   Commentvote.where("comment_id = ?", params[:comment_id]).sum("vote").to_json
  # end

  # get '/vote/comment/:comment_id/:post_id/down' do
  #   @post_id = params[:post_id]
  #   Commentvote.create(comment_id: params[:comment_id], vote: -1)
  #   Commentvote.where("comment_id = ?", params[:comment_id]).sum("vote").to_json
  # end
end

# get '/comment/new' do
#   erb :new_comment
# end

# post '/comment/:id/new' do
#   @comment = Comment.new(body: params[:body], 
#                          post_id: params[:id],
#                          user_id: current_user.id)
#   @comment.user_id = current_user.id
#   if @comment.save
#     redirect "/post/#{@comment.post_id}"
#   else
#     redirect "comment/new"
#   end
# end

# get '/comment/edit/:id' do
#   @comment = Comment.find(params[:id])
#   erb :edit_comment
# end

# post '/comment/edit/:id' do
#   @comment = Comment.find(params[:id])
#   @comment.assign_attributes(body: params[:body])
#   if @comment.save
#     redirect "/post/#{@comment.post_id}"
#   else
#     erb :edit_comment
#   end
# end

# post '/comment/destroy/:id' do
#   @comment = Comment.find(params[:id])
#   @comment.destroy
#   redirect "/user/#{current_user.id}"
# end
end
