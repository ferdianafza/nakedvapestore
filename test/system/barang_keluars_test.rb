require "application_system_test_case"

class BarangKeluarsTest < ApplicationSystemTestCase
  setup do
    @barang_keluar = barang_keluars(:one)
  end

  test "visiting the index" do
    visit barang_keluars_url
    assert_selector "h1", text: "Barang Keluars"
  end

  test "creating a Barang keluar" do
    visit barang_keluars_url
    click_on "New Barang Keluar"

    fill_in "Qty", with: @barang_keluar.qty
    fill_in "Stok", with: @barang_keluar.stok_id
    click_on "Create Barang keluar"

    assert_text "Barang keluar was successfully created"
    click_on "Back"
  end

  test "updating a Barang keluar" do
    visit barang_keluars_url
    click_on "Edit", match: :first

    fill_in "Qty", with: @barang_keluar.qty
    fill_in "Stok", with: @barang_keluar.stok_id
    click_on "Update Barang keluar"

    assert_text "Barang keluar was successfully updated"
    click_on "Back"
  end

  test "destroying a Barang keluar" do
    visit barang_keluars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barang keluar was successfully destroyed"
  end
end
