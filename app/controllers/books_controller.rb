class BooksController < ApplicationController

  def index
    @book = Book.new # post new book
    @books = Book.all # get all book
  end

  def show
    @book = Book.find(params[:id])
  end

  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all   
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
     @books = Book.all
     render :edit
    end 
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除  
    redirect_to books_path, notice: 'Book was successfully destroyed.'
    # 投稿一覧画面へリダイレクト
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
