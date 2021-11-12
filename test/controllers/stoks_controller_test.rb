require 'test_helper'

class StoksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stok = stoks(:one)
  end

  test "should get index" do
    get stoks_url
    assert_response :success
  end

  test "should get new" do
    get new_stok_url
    assert_response :success
  end

  test "should create stok" do
    assert_difference('Stok.count') do
      post stoks_url, params: { stok: { nama_produk: @stok.nama_produk, qty: @stok.qty } }
    end

    assert_redirected_to stok_url(Stok.last)
  end

  test "should show stok" do
    get stok_url(@stok)
    assert_response :success
  end

  test "should get edit" do
    get edit_stok_url(@stok)
    assert_response :success
  end

  test "should update stok" do
    patch stok_url(@stok), params: { stok: { nama_produk: @stok.nama_produk, qty: @stok.qty } }
    assert_redirected_to stok_url(@stok)
  end

  test "should destroy stok" do
    assert_difference('Stok.count', -1) do
      delete stok_url(@stok)
    end

    assert_redirected_to stoks_url
  end
end
