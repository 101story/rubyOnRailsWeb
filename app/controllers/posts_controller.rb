class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :create_comment, :like_post]
  before_action :is_login?, only: [:create_commnet, :like_post, :destory_comment]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @like = true
    if user_singed_in?
      @like = current_user.likes.find_by(post_id: @post.id).nil?
    end 
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def create_comment
    # ajax 로 동작하는 코드
    # 자동으로 js 파일을 먼저 찾고 erb 파일을 찾음 
    # create_commnet.js.erb  

    @c = @post.comments.create(comment_params)
    
  end

  def delete_comment
    # ajax 로 동작하는 코드
    # 자동으로 js 파일을 먼저 찾고 erb 파일을 찾음 
    # create_commnet.js.erb  

    puts params[:cmtid]
    Comment.find(params[:cmtid]).destroy
  end

  def like_post
    
    #현재 post와 user 가 누룬 like 다 가져오기  
    #Like.where 여러 줄을 return 함
    if Like.where(user_id: current_user.id, post_id: @post.id).first.nil?
      #좋아요를 누루지 않음 
      @result = current_user.likes.create(post_id: @post.id)
      # puts"좋아요"
    else
      #좋아요를 누름 
      @result = current_user.likes.find_by(post_id: @post.id).destroy
      # puts"안좋아요"
    end 
    
    # 메모리에만 있고 DB 에는 있지 않은 상태 freeze
    @result = @result.frozen?

  end

  private
    def is_login?
      unless user_signed_in?
      # ajax 는 페이지 전환을 할 수 없다. js 에서 해야함 redirect_to 가 불가능 함
      # respond_to method 를 통해 다른 format 으로 전달함 
        respond_to do |format|
          format.js {render 'please_login.js.erb'}
        end
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
    
    def comment_params
      params.require(:comment).permit(:body)
    end
end
