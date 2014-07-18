class BuddhistsController < ApplicationController
  before_action :set_buddhist, only: [:show, :edit, :update, :destroy]

  # GET /buddhists
  # GET /buddhists.json
  def index
    authenticate
    if params[:search]
      @buddhists = Buddhist.search_by_name(params[:search]).order("created_at DESC")
    else
      @buddhists = Buddhist.all.order('created_at DESC')
    end
  end

  # GET /buddhists/1
  # GET /buddhists/1.json
  def show
    authenticate
    @payments = Payment.where(:buddhist_id => params[:id]).order(month: :desc)
    !@payments.empty? ? @payments.first.month < Time.now - 2.months ? flash.now[:alert] = "Az elmúlt két hónapra még nem történt befizetés. Az utolsó hónap: #{@payments.first.month.to_formatted_s(:month_and_year )}" : true : true
  end
  # GET /buddhists/new

  def new
    authenticate
    @buddhist = Buddhist.new
  end

  # GET /buddhists/1/edit
  def edit
    authenticate
  end

  # POST /buddhists
  # POST /buddhists.json
  def create
    authenticate
    @buddhist = Buddhist.new(buddhist_params)

    respond_to do |format|
      if @buddhist.save
        format.html { redirect_to @buddhist, notice: 'Buddhist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @buddhist }
      else
        format.html { render action: 'new' }
        format.json { render json: @buddhist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buddhists/1
  # PATCH/PUT /buddhists/1.json
  def update
    authenticate
    respond_to do |format|
      if @buddhist.update(buddhist_params)
        format.html { redirect_to @buddhist, notice: 'Buddhist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @buddhist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buddhists/1
  # DELETE /buddhists/1.json
  def destroy
    authenticate
    @buddhist.destroy
    respond_to do |format|
      format.html { redirect_to buddhists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buddhist
      @buddhist = Buddhist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buddhist_params
      params.require(:buddhist).permit(:status, :name, :email, :buzzer_id, :telephone_number, :program_sms, :address, :local_center)
    end

end
