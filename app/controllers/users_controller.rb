class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.pdf do
          pdf = UserPDF.new(@user)

          # 画面にPDFを表示する
          # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
          send_data pdf.render,
            filename:    "#{@user.id}.pdf",
            type:        "application/pdf",
            disposition: "inline"
        end
      end
  end

  def new
  end

  def create
  end

  def edit
  end

  def delete
  end
end
