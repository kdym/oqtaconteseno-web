class EventsTypesController < ApplicationController
  before_action :set_event_type, only: [:edit, :update, :destroy, :show, :show_icon]

  # GET /events
  # GET /events.json
  def index
    @eventsTypes = EventsType.all
    @eventType = EventsType.new
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.json {render json: @event.to_json(include: {app_user: {methods: :facebook_info}}, methods: :evaluations)}
    end
  end

  # GET /events/new
  def new
    @eventType = EventsType.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @eventType = EventsType.new(event_type_params)
    @eventsTypes = EventsType.all

    respond_to do |format|
      if @eventType.save
        format.html {redirect_to events_types_path, notice: t('save_success')}
        format.json {render json: @event}
      else
        format.html {render :index}
        format.json {render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @eventType.update(event_type_params)
        format.html {redirect_to events_types_path, notice: t('save_success')}
        format.json {render json: @event}
      else
        format.html {render :edit}
        format.json {render json: @event.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @eventType.destroy
    respond_to do |format|
      format.html {redirect_to events_types_path, notice: t('delete_success')}
      format.json {head :no_content}
    end
  end

  def show_icon
    send_data @eventType.icone
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event_type
    @eventType = EventsType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_type_params
    params.require(:events_type).permit(:nome, :icone, :icone_file, :width)
  end
end
