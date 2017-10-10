class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @event = Event.new
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.json { render json: @event.to_json(include: {app_user: {methods: :facebook_info}}, methods: :evaluations) }
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render json: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @eventos = Event.near([params[:latitude], params[:longitude]], params[:radius])

    parameters = SearchParameter.where(app_user_id: params[:user_id]).first

    if parameters
      case parameters.periodo
        when SearchParameter.periods[:today]
          endDate = Time.zone.now
        when SearchParameter.periods[:day3]
          endDate = 3.day.from_now
        when SearchParameter.periods[:day7]
          endDate = 7.day.from_now
      end
    else
      endDate = 7.day.from_now
    end

    today = Time.zone.now
    endDate = endDate.change({hour: 23, min: 59})

    @eventos = @eventos.where('data_fim >= ? and data_inicio <= ?', today, endDate)

    if parameters
      if parameters.tipos != SearchParameter.all_tipos
        tipos = parameters.tipos.split(',')

        @eventos = @eventos.where('tipo in (?)', tipos)
      end
    end

    respond_to do |format|
      format.json { render json: @eventos.to_json(methods: [:evaluations, :is_today]) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:nome, :latitude, :longitude, :tipo, :data_inicio, :data_fim, :app_user_id, :descricao, :gratis)
  end
end
