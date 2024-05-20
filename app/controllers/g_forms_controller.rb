class GFormsController < ApplicationController
  before_action :set_g_form, only: %i[ show edit update destroy ]

  # GET /g_forms or /g_forms.json
  def index
    @g_forms =  GForm.includes(questions: [:options, { image_attachment: :blob }]).with_attached_image
  end

  # GET /g_forms/1 or /g_forms/1.json
  def show
  end

  # GET /g_forms/new
  def new
    @g_form = GForm.new
    @g_form.questions.build.options.build
  end

  # GET /g_forms/1/edit
  def edit
  end

  # POST /g_forms or /g_forms.json
  def create
    @g_form = GForm.new(g_form_params)

    respond_to do |format|
      if @g_form.save
        format.html { redirect_to g_form_url(@g_form), notice: "G form was successfully created." }
        format.json { render :show, status: :created, location: @g_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @g_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /g_forms/1 or /g_forms/1.json
  def update
    respond_to do |format|
      if @g_form.update(g_form_params)
        format.html { redirect_to g_form_url(@g_form), notice: "G form was successfully updated." }
        format.json { render :show, status: :ok, location: @g_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @g_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /g_forms/1 or /g_forms/1.json
  def destroy
    @g_form.destroy!

    respond_to do |format|
      format.html { redirect_to g_forms_url, notice: "G form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_g_form
      @g_form = GForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def g_form_params
      params.require(:g_form).permit(:title, :description, :image, questions_attributes: [:title,  :type_of_question, :image, :_destroy, options_attributes: [:title, :_destroy]])
    end
end
