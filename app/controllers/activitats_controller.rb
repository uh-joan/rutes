class ActivitatsController < ApplicationController
  before_action :set_activitat, only: [:show, :edit, :update, :destroy]

  # GET /activitats
  # GET /activitats.json
  def index
    @activitats = Activitat.all
  end

  # GET /activitats/1
  # GET /activitats/1.json
  def show
  end

  # GET /activitats/new
  def new
    @activitat = Activitat.new
  end

  # GET /activitats/1/edit
  def edit
  end

  # POST /activitats
  # POST /activitats.json
  def create
    @activitat = Activitat.new(activitat_params)

    respond_to do |format|
      if @activitat.save
        format.html { redirect_to @activitat, notice: 'Activitat creada correctament.' }
        format.json { render :show, status: :created, location: @activitat }
      else
        format.html { render :new }
        format.json { render json: @activitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activitats/1
  # PATCH/PUT /activitats/1.json
  def update
    respond_to do |format|
      if @activitat.update(activitat_params)
        format.html { redirect_to @activitat, notice: 'Activitat actualitzada correctament.' }
        format.json { render :show, status: :ok, location: @activitat }
      else
        format.html { render :edit }
        format.json { render json: @activitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activitats/1
  # DELETE /activitats/1.json
  def destroy
    @activitat.destroy
    respond_to do |format|
      format.html { redirect_to activitats_url, notice: 'Activitat destruida correctament.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activitat
      @activitat = Activitat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activitat_params
      params.require(:activitat).permit(:titol, :subtitol, :descripcio, :lat, :long, :user_id, :cover, :puesto)
    end
end
