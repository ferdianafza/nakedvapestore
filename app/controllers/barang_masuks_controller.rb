class BarangMasuksController < ApplicationController
  before_action :set_barang_masuk, only: %i[ show edit update destroy ]

  # GET /barang_masuks or /barang_masuks.json
  def index
    @barang_masuks = BarangMasuk.all
  end

  # GET /barang_masuks/1 or /barang_masuks/1.json
  def show
  end

  # GET /barang_masuks/new
  def new
    @barang_masuk = BarangMasuk.new
  end

  # GET /barang_masuks/1/edit
  def edit
  end

  # POST /barang_masuks or /barang_masuks.json
  def create
    @barang_masuk = BarangMasuk.new(barang_masuk_params)

    respond_to do |format|
      if @barang_masuk.save
         @stok = Stok.find_by(id: @barang_masuk.stok_id)
         @stok.qty = @stok.qty + @barang_masuk.qty
         @stok.save
        format.html { redirect_to "/", notice: "Barang masuk was successfully created." }
        format.json { render :show, status: :created, location: @barang_masuk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barang_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barang_masuks/1 or /barang_masuks/1.json
  def update
    respond_to do |format|
      if @barang_masuk.update(barang_masuk_params)
        format.html { redirect_to @barang_masuk, notice: "Barang masuk was successfully updated." }
        format.json { render :show, status: :ok, location: @barang_masuk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barang_masuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barang_masuks/1 or /barang_masuks/1.json
  def destroy
    @barang_masuk.destroy
    respond_to do |format|
      format.html { redirect_to barang_masuks_url, notice: "Barang masuk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barang_masuk
      @barang_masuk = BarangMasuk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barang_masuk_params
      params.require(:barang_masuk).permit(:stok_id, :qty)
    end
end
