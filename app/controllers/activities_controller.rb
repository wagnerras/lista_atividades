class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :get_user

  # GET /activities
  # GET /activities.json
  def index   
    @activities1 = Activity.where(user_id: @usuario).order(description: :asc).page(params[:page])
    @activities2 = Activity.where(done: true, user_id: @usuario).order(description: :asc).page(params[:page])
    params[:pendent] ? @activities = @activities2 : @activities = @activities1
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

      if params[:activity][:description].blank?
        redirect_to new_activity_path, notice: 'descricao em branco!'
      elsif @activity.save
        redirect_to activities_path, notice: 'Activity was successfully created.'
      else
         render :new 
      end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
      if @activity.update(activity_params)
        redirect_to activities_path, notice: 'Activity was successfully updated.' 
      else
        render :edit 
      end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:description, :done, :user_id)
    end

    def get_user
      @usuario = current_user.id
    end 
  
end
