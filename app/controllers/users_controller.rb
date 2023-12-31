class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [ :update,]
  def show
    #@user = current_user
    @user = User.find(params[:id])  
    @books = @user.books
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # redirect_to user_path(current_user.id)
    redirect_to book_path(@book.id)
  end
    def index
    @user = current_user
    @books = @user.books
    @book=Book.new
    @users=User.all
   end
    def new
    @book=Book.new
    end
 
  #変えなければならない
  def edit
        user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end
  
  def update

    
    @user = User.find(params[:id])
    if@user.update(user_params)
      flash[:notice] ="successfully"
    redirect_to user_path(@user.id)
    else
    render:edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
    def book_params
    params.require(:book).permit(:title, :body,:image)
  end
  
    def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
