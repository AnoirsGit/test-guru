class TestsController < ApplicationController
  before_action :find_test, only: %i[start edit update destroy show]
  before_action :find_user, only: %i[start]

  def show

  end

  def index
    @tests = Test.all
  end
  
  def def(_new)
    render :new
  end

  def create
    test = Test.create(test_params)
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to test_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.requre(:test).permit(:title, :level)
  end

  def find_user
    # @user = User.find(params[:user_id])
    @user = User.first
  end
end
