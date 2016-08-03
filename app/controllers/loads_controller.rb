class LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy, :add_order, :remove_order]

  # GET /loads
  # GET /loads.json
  def index
    @loads = Load.all
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
    @order_fields = Order.column_names - %w(id phone_ext raw_order_id created_at updated_at)
    @pending_orders = Order.order(:delivery_date).where(:load => nil).all
    @total_volume = @load.orders.all.to_a.sum(&:volume)
    @is_vloume_exceeded = @total_volume > @load.driver.truck.max_volume
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1
  # PATCH/PUT /loads/1.json
  def update
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { render :edit }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_order
    load_order_params
    order = Order.find(params[:order_id])
    order.update(:load => @load)
    redirect_to edit_load_path(@load)
  end

  def remove_order
    load_order_params
    order = Order.find(params[:order_id])
    order.update(:load => nil)
    redirect_to edit_load_path(@load)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_load
    @load = Load.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def load_params
    params.require(:load).permit(:delivery_date, :delivery_shift, :driver_id)
  end

  def load_order_params
    params.permit(:id, :order_id)
  end
end
