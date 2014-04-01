class GoalsController < ApplicationController
  before_filter :authenticate

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def index
    @user = current_user
    @public_goals = Goal.all.where("private = 'f'")
    # @public_goals = Goal.select{ |goal| goal.private == false }
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def complete
    @goal = Goal.find(params[:id])
    @goal.complete = 't'
    @goal.save!
    redirect_to goals_url
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :private)
  end

end
