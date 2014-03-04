class NoteFieldsController < ApplicationController
  before_action :set_note_field, only: [:show, :edit, :update, :destroy]

  # GET /note_fields
  # GET /note_fields.json
  def index
    @note_fields = NoteField.all
  end

  # GET /note_fields/1
  # GET /note_fields/1.json
  def show
  end

  # GET /note_fields/new
  def new
    @note_field = NoteField.new
  end

  # GET /note_fields/1/edit
  def edit
  end

  # POST /note_fields
  # POST /note_fields.json
  def create
    @note_field = NoteField.new(note_field_params)

    respond_to do |format|
      if @note_field.save
        format.html { redirect_to @note_field, notice: 'Note field was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note_field }
      else
        format.html { render action: 'new' }
        format.json { render json: @note_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_fields/1
  # PATCH/PUT /note_fields/1.json
  def update
    respond_to do |format|
      if @note_field.update(note_field_params)
        format.html { redirect_to @note_field, notice: 'Note field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_fields/1
  # DELETE /note_fields/1.json
  def destroy
    @note_field.destroy
    respond_to do |format|
      format.html { redirect_to note_fields_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_field
      @note_field = NoteField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_field_params
      params.require(:note_field).permit(:note_id, :note_template_field_id, :value)
    end
end
