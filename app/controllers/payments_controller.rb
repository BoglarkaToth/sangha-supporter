class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    authenticate
    @payments = Payment.all
    if params[:sorting]
      @payments = Payment.order("#{params[:sorting]} #{params[:order]}")
    end
    if params[:sort_by_month]
      @payments = Payment.where(:month => params[:sort_by_month].to_time)
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    authenticate
    @buddhist = Buddhist.find(@payment.buddhist_id)
    @changes = []
    if @payment.versions
        @payment.versions.each do | payment_version|
            change = Hash.new
            change['name'] = User.find(payment_version.whodunnit.to_i).email
            change['timestamp'] = payment_version.created_at
            change['event'] = payment_version.event
            @changes << change
        end
        @changes = @changes.reverse
    end
  end

  # GET /payments/new
  def new
    authenticate
    @payment = Payment.new
    if params[:buddhist_id]
      @buddhist = Buddhist.find(params[:buddhist_id])
    end
  end

  # GET /payments/1/edit
  def edit
    authenticate
  end

  # POST /payments
  # POST /payments.json
  def create
    authenticate
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    authenticate
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    authenticate
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :month, :currency, :payment_type, :payment_method, :comment, :library_member, :bicycle_member, :gym_member, :parking_motorbike, :parking_car, :buddhist_id)
    end
end
