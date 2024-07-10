class CheckInsController < ApplicationController
  def new
    @check_in = CheckIn.new
    @questions = Question.all
  end

  def create
    @check_in = CheckIn.new(check_in_params)

    if @check_in.save
      if @check_in.high_score?
        flash[:notice] = "High score detected. Additional screening is recommended."
      else
        flash[:alert] = "No additional screening needed."
      end
      redirect_to check_in_path(@check_in)
    else
      render :new
    end
  end

  def show
    @check_in = CheckIn.find(params[:id])
  end

  private 

  def check_in_params
    params.require(:check_in).permit(:patient_id, answers_attributes: [:question_id, :title])
  end
end
