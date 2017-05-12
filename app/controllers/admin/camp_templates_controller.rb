class Admin::CampTemplatesController < AdminController

  def new
    @current_object = current_model.new(payload: current_object.try(:payload))
  end

  def show; end

  def edit; end

  def preview
    @camp = CampTemplateLoader.use CampTemplate.find(params[:camp_template_id])
    render 'pages/camp', layout: 'application'
  end

  protected

  def current_model
    Admin::CampTemplate
  end

  def current_object
    @current_object ||= current_model.find_by(id: params[:id] || params[:camp_template_id])
  end

  def allowed_params
    params.require(:admin_camp_template).permit(:json)
  end
end
