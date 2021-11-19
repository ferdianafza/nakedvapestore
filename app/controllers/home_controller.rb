class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
      @barang_keluars = BarangKeluar.all.order(created_at: :desc).page params[:page]
    @barang_masuk = BarangMasuk.new
    @barang_keluar = BarangKeluar.new
    @stok = Stok.new
    @barang_masuks = BarangMasuk.all.order(created_at: :desc).page params[:page]
    @stoks = Stok.all.order(created_at: :desc).page params[:page]
    b = BarangKeluar.where(tanggal: Date.today.to_s).pluck(:keuntungan)
    @harian = 0
      b.each do |hr|
      @harian = @harian + hr.to_i
      end

    c = BarangKeluar.where(tanggal: 1.week.ago..Date.today.to_s).pluck(:keuntungan)
    @mingguan = 0
      c.each do |hr|
      @mingguan = @mingguan + hr.to_i
      end

    d = BarangKeluar.where(tanggal: 1.month.ago..Date.today.to_s).pluck(:keuntungan)
    @bulanan = 0
      d.each do |bl|
      @bulanan = @bulanan + bl.to_i
      end

    e = BarangKeluar.where(tanggal: 1.year.ago..Date.today.to_s).pluck(:keuntungan)
    @tahunan = 0
      d.each do |th|
      @tahunan = @tahunan + th.to_i
      end
    end
end
