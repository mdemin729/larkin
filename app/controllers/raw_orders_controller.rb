class RawOrdersController < ApplicationController
  before_action :set_raw_order, only: [:show, :edit, :update, :destroy]

  # GET /raw_orders
  # GET /raw_orders.json
  def index
    @raw_orders = RawOrder.all
  end

  # GET /raw_orders/1
  # GET /raw_orders/1.json
  def show
  end

  # GET /raw_orders/new
  def new
    @raw_order = RawOrder.new
  end

  # GET /raw_orders/1/edit
  def edit
  end

  # POST /raw_orders
  # POST /raw_orders.json
  def create
    @raw_order = RawOrder.new(raw_order_params)

    respond_to do |format|
      if @raw_order.save
        format.html { redirect_to @raw_order, notice: 'Raw order was successfully created.' }
        format.json { render :show, status: :created, location: @raw_order }
      else
        format.html { render :new }
        format.json { render json: @raw_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_orders/1
  # PATCH/PUT /raw_orders/1.json
  def update
    respond_to do |format|
      if @raw_order.update(raw_order_params)
        format.html { redirect_to @raw_order, notice: 'Raw order was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_order }
      else
        format.html { render :edit }
        format.json { render json: @raw_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_orders/1
  # DELETE /raw_orders/1.json
  def destroy
    @raw_order.destroy
    respond_to do |format|
      format.html { redirect_to raw_orders_url, notice: 'Raw order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_order
      @raw_order = RawOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_order_params
      params.require(:raw_order).permit(:delivery_date, :delivery_shift, :origin_name, :origin_raw_line_1, :origin_city, :origin_state, :origin_zip, :client, :name, :destination_raw_line_1, :destination_city, :destination_state, :destination_zip, :phone_number, :mode, :purchase_order_number, :volume, :handling_unit_quantity, :handling_unit_type)
    end
end
