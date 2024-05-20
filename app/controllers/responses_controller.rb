class ResponsesController < ApplicationController
  before_action :set_response, only: :show
  before_action :set_g_form, only: %i[new create index]

  def index
    @responses = @form.responses
  end

  def new
    @response = @form.responses.new
  end

  def show; end

  def create
    @response = @form.responses.new(response_params)
    if @response.save
      redirect_to g_form_response_path(@form, @response), notice: 'Response was successfully submitted.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def response_params
    params.require(:response).permit(:sent_by, answers: {})
  end

  def set_g_form
    @form = GForm.find_by(id: params[:g_form_id])
  end

  def set_response
    @response = Response.find_by(id: params[:id])
  end
end
