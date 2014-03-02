class ConsultationsController < ApplicationController
  def new
    @consultation = Consultation.new
    render :layout => false
  end

  def edit
    @consultation= Consultation.find(params[:id])
    render :layout => false
  end

  def show
    @consultation = Consultation.find(params[:id])
    render :layout => false
  end

# PUT /events/1
# PUT /events/1.xml
# PUT /events/1.js
  def update
    @consultation = Consultation.find(params[:id])
      respond_to do |format|
        if @consultation.update_attributes(consultation_params)
          format.html {redirect_to(consultations_url, :notice => 'Consultation was successfully updated.') }
          format.js { head :ok}
        else
          format.html { render 'edit' }
          format.js  { render :js => @consultation.errors, :status => :unprocessable_entity }
        end
      end

=begin
  def update
    if @consultation.update_attributes(consultation_params)
      flash[:success] = "Consultation updated"
      redirect_to @consultation
    else
      render 'edit'
    end
=end
  end
  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to @consultation
    else
      render 'new'
    end
  end

  def index
@consultations = Consultation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultations }
      format.js  { render :json => @consultations }
      end
  end

  private
  def consultation_params
    params.require(:consultation).permit(:start_date_time, :end_date_time, :client_id, :practitioner_id, :consultation_type_id)
  end
  def consultation_calendar_params
    params.require(:consultation).permit(:start_date_time, :end_date_time)
  end



end
