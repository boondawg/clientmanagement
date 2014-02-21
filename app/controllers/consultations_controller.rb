class ConsultationsController < ApplicationController
  def new
    @consultation = Consultation.new
  end

  def edit
    @consultation= Consultation.find(params[:id])
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def update
    @consultation = Consultation.find(params[:id])
    if @consultation.update_attributes(consultation_params)
      flash[:success] = "Consultation updated"
      redirect_to @consultation
    else
      render 'edit'
    end
  end
  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to @consultation
    else
      render 'new'
    end
  end

  private
  def consultation_params
    params.require(:consultation).permit(:date, :client_id, :practitioner_id, :consultation_type_id)
  end



end
