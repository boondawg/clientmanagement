class ConsultationTypesController < ApplicationController
    def new
      @consultation_type = ConsultationType.new
    end

    def edit
      @consultation_type = ConsultationType.find(params[:id])
    end

    def show
      @consultation_type = ConsultationType.find(params[:id])
    end

    def update
      @consultation_type = ConsultationType.find(params[:id])
      if @consultation_type.update_attributes(consultation_type_params)
        flash[:success] = "Consultation Type updated"
        redirect_to @consultation_type
      else
        render 'edit'
      end
    end
    def create
      @consultation_type = ConsultationType.new(consultation_type_params)
      if @consultation_type.save
        redirect_to @consultation_type
      else
        render 'new'
      end
    end

    private
    def consultation_type_params
      params.require(:consultation_type).permit(:name, :cost)
    end



end
