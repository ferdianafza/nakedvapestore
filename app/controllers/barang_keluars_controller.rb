class BarangKeluarsController < ApplicationController
  before_action :set_barang_keluar, only: %i[ show edit update destroy ]

  # GET /barang_keluars or /barang_keluars.json
  def index
    @barang_keluars = BarangKeluar.all
  end

  # GET /barang_keluars/1 or /barang_keluars/1.json
  def show
  end

  # GET /barang_keluars/new
  def new
    @barang_keluar = BarangKeluar.new
  end

  # GET /barang_keluars/1/edit
  def edit
  end

  # POST /barang_keluars or /barang_keluars.json
  def create
    @barang_keluar = BarangKeluar.new(barang_keluar_params)
    @stok = Stok.find_by(id: @barang_keluar.stok_id)
    @harga_jual = @stok.harga_jual
    @modal_beli = @stok.modal_beli
    total_harga_jual = @barang_keluar.qty.to_i * @harga_jual.to_i
    total_modal = @barang_keluar.qty.to_i * @modal_beli.to_i
    # @barang_keluar.keuntungan = total_harga_jual - total_modal
    @barang_keluar.keuntungan = total_harga_jual - total_modal
    @barang_keluar.created_at.to_s

    respond_to do |format|
      if @barang_keluar.save
        @stok = Stok.find_by(id: @barang_keluar.stok_id)
        @stok.qty = @stok.qty - @barang_keluar.qty

        @stok.save
        format.html { redirect_to "/", notice: "Barang keluar was successfully created." }
        format.json { render :show, status: :created, location: @barang_keluar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barang_keluar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barang_keluars/1 or /barang_keluars/1.json
  def update
    respond_to do |format|
      if @barang_keluar.update(barang_keluar_params)
        format.html { redirect_to @barang_keluar, notice: "Barang keluar was successfully updated." }
        format.json { render :show, status: :ok, location: @barang_keluar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barang_keluar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barang_keluars/1 or /barang_keluars/1.json
  def destroy
    @barang_keluar.destroy
    respond_to do |format|
      format.html { redirect_to barang_keluars_url, notice: "Barang keluar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barang_keluar
      @barang_keluar = BarangKeluar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barang_keluar_params
      params.require(:barang_keluar).permit(:stok_id, :qty, :keuntungan, :tanggal)
    end
end
