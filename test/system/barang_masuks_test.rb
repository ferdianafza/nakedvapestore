require "application_system_test_case"

class BarangMasuksTest < ApplicationSystemTestCase
  setup do
    @barang_masuk = barang_masuks(:one)
  end

  test "visiting the index" do
    visit barang_masuks_url
    assert_selector "h1", text: "Barang Masuks"
  end

  test "creating a Barang masuk" do
    visit barang_masuks_url
    click_on "New Barang Masuk"

    fill_in "Qty", with: @barang_masuk.qty
    fill_in "Stok", with: @barang_masuk.stok_id
    click_on "Create Barang masuk"

    assert_text "Barang masuk was successfully created"
    click_on "Back"
  end

  test "updating a Barang masuk" do
    visit barang_masuks_url
    click_on "Edit", match: :first

    fill_in "Qty", with: @barang_masuk.qty
    fill_in "Stok", with: @barang_masuk.stok_id
    click_on "Update Barang masuk"

    assert_text "Barang masuk was successfully updated"
    click_on "Back"
  end

  test "destroying a Barang masuk" do
    visit barang_masuks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barang masuk was successfully destroyed"
  end
end
