class NoteTemplateFieldsController < ApplicationController
  before_action :set_note_template_field, only: [:show, :edit, :update, :destroy]

  # GET /note_template_fields
  # GET /note_template_fields.json
  def index
    @note_template_fields = NoteTemplateField.all
  end

  # GET /note_template_fields/1
  # GET /note_template_fields/1.json
  def show
  end

  # GET /note_template_fields/new
  def new
    @note_template_field = NoteTemplateField.new
  end

  # GET /note_template_fields/1/edit
  def edit
  end

  # POST /note_template_fields
  # POST /note_template_fields.json
  def create
    @note_template_field = NoteTemplateField.new(note_template_field_params)

    respond_to do |format|
      if @note_template_field.save
        format.html { redirect_to @note_template_field, notice: 'Note template field was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note_template_field }
      else
        format.html { render action: 'new' }
        format.json { render json: @note_template_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_template_fields/1
  # PATCH/PUT /note_template_fields/1.json
  def update
    respond_to do |format|
      if @note_template_field.update(note_template_field_params)
        format.html { redirect_to @note_template_field, notice: 'Note template field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note_template_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_template_fields/1
  # DELETE /note_template_fields/1.json
  def destroy
    @note_template_field.destroy
    respond_to do |format|
      format.html { redirect_to note_template_fields_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_template_field
      @note_template_field = NoteTemplateField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_template_field_params
      params.require(:note_template_field).permit(:note_template_id, :order, :name, :type, :defaultValue)
    end
end
