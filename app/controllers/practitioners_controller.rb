class PractitionersController < ApplicationController
  def new
    @practitioner = Practitioner.new
  end
  def update
    @practitioner = Practitioner.find(params[:id])
    if @practitioner.update_attributes(practitioner_params)
      flash[:success] = "Profile updated"
      redirect_to @practitioner
    else
      render 'edit'
    end
  end
  def create
    @practitioner = Practitioner.new(practitioner_params)
    if @practitioner.save
      redirect_to @practitioner
    else
      render 'new'
    end
  end
  def edit
    @practitioner = Practitioner.find(params[:id])
  end

  def show
    @practitioner = Practitioner.find(params[:id])
  end
  private
  def practitioner_params
    params.require(:practitioner).permit(:name, :email)
  end
end
