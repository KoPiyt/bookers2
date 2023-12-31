class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  
    def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books=Book.all
    # redirect_to user_path(current_user.id)
    if @book.save
      flash[:notice]="successfully"
     redirect_to book_path(@book.id)
   else
     render:index
     
   end
  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
        @book=Book.find(params[:id])
        @user = current_user
       
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="successfully"
    redirect_to book_path(@book.id)
  else
    render :edit
  end
  end

  def index
    @books=Book.all
    @user = current_user
    @book=Book.new
    @users=User.all
  end

  def show
    @book=Book.find(params[:id])
    @user = current_user
        @book_comment = BookComment.new
    
    
  end
  
    private

  def book_params
    params.require(:book).permit(:title, :body,:image)
  end
  
end
