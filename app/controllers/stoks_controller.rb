class StoksController < ApplicationController
  before_action :set_stok, only: %i[ show edit update destroy ]

  # GET /stoks or /stoks.json
  def index
    @stoks = Stok.all
  end

  # GET /stoks/1 or /stoks/1.json
  def show
  end

  # GET /stoks/new
  def new
    @stok = Stok.new
  end

  # GET /stoks/1/edit
  def edit
  end

  # POST /stoks or /stoks.json
  def create
    @stok = Stok.new(stok_params)

    respond_to do |format|
      if @stok.save
        format.html { redirect_to "/", notice: "Stok was successfully created." }
        format.json { render :show, status: :created, location: @stok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stok.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stoks/1 or /stoks/1.json
  def update
    respond_to do |format|
      if @stok.update(stok_params)
        format.html { redirect_to @stok, notice: "Stok was successfully updated." }
        format.json { render :show, status: :ok, location: @stok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stok.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stoks/1 or /stoks/1.json
  def destroy
    @stok.destroy
    respond_to do |format|
      format.html { redirect_to stoks_url, notice: "Stok was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stok
      @stok = Stok.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stok_params
      params.require(:stok).permit(:nama_produk, :qty, :modal_beli, :harga_jual)
    end
end
