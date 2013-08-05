RailsHackerNews::Application.routes.draw do

#USER ROUTES
root to: 'pages#index', as: 'homepage'
# get '/' do
#   @posts = Post.all
#   erb :index
# end
resources :users, except: [:index]
# post '/signup', to: 'user#create'
# post '/signup' do
#   @user = User.new(params)
#   if @user.save
#     session[:id] = @user.id
#     redirect "user/#{@user.id}"
#   else
#     redirect '/'
#   end
# end

# get '/user/:id' do
#   if current_user.id == params[:id].to_i
#     @posts = Post.where("user_id = ?", params[:id])
#     @comments = Comment.where("user_id = ?", params[:id])
#     erb :profile
#   else
#     redirect '/'
#   end
# end

post '/login', to: 'sessions#create'
# get '/login' do
#   p "here"
#   @user = User.find_by_email(params[:email])
#   if @user.authenticate(params[:password])
#    session[:id] = @user.id
#     redirect "/user/#{@user.id}"
#   else
#     redirect '/'
#   end 
# end

delete '/logout', to: 'sessions#destroy'
# get '/logout' do
#   session[:id] = nil
#   redirect '/'
# end


#POST ROUTES
resources :posts do
  get 'vote_up', to: 'votes#post_vote_up'
  get 'vote_down', to: 'votes#post_vote_down'
  # POST VOTE ROUTES
  # get '/vote/post/:post_id/up' do
  #   Postvote.create(post_id: params[:post_id], vote: 1)
  #   Postvote.where("post_id = ?", params[:post_id]).sum("vote").to_json
  # end

  # get '/vote/post/:post_id/down' do
  #   Postvote.create(post_id: params[:post_id], vote: -1)
  #   Postvote.where("post_id = ?", params[:post_id]).sum("vote").to_json
  # end
end

# get '/post/new' do
#   erb :new_post
# end

# get '/post/:id' do
#   @post = Post.find(params[:id])
#   @comments = @post.comments
#   erb :post
# end

# post '/post/new' do
#   @post = Post.new(params)
#   @post.user_id = current_user.id
#   if @post.save
#     redirect "/post/#{@post.id}"
#   else
#     redirect "post/new"
#   end
# end

# get '/post/edit/:id' do
#   @post = Post.find(params[:id])
#   erb :edit_post
# end

# post '/post/edit/:id' do
#   @post = Post.find(params[:id])
#   @post.assign_attributes(title: params[:title],
#                           link: params[:link])
#   if @post.save
#     redirect "/post/#{@post.id}"
#   else
#     erb :edit_post
#   end
# end

# post '/post/destroy/:id' do
#   @post = Post.find(params[:id])
#   @post.destroy
#   redirect "/user/#{current_user.id}"
# end


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
