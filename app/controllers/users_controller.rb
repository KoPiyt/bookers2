class UsersController < ApplicationController
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


  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
    def book_params
    params.require(:book).permit(:title, :body,:image)
  end

end
