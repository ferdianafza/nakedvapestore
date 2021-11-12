require "application_system_test_case"

class StoksTest < ApplicationSystemTestCase
  setup do
    @stok = stoks(:one)
  end

  test "visiting the index" do
    visit stoks_url
    assert_selector "h1", text: "Stoks"
  end

  test "creating a Stok" do
    visit stoks_url
    click_on "New Stok"

    fill_in "Nama produk", with: @stok.nama_produk
    fill_in "Qty", with: @stok.qty
    click_on "Create Stok"

    assert_text "Stok was successfully created"
    click_on "Back"
  end

  test "updating a Stok" do
    visit stoks_url
    click_on "Edit", match: :first

    fill_in "Nama produk", with: @stok.nama_produk
    fill_in "Qty", with: @stok.qty
    click_on "Update Stok"

    assert_text "Stok was successfully updated"
    click_on "Back"
  end

  test "destroying a Stok" do
    visit stoks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stok was successfully destroyed"
  end
end
