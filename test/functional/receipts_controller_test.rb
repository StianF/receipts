require 'test_helper'

class ReceiptsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Receipt.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Receipt.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Receipt.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to receipt_url(assigns(:receipt))
  end

  def test_edit
    get :edit, :id => Receipt.first
    assert_template 'edit'
  end

  def test_update_invalid
    Receipt.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Receipt.first
    assert_template 'edit'
  end

  def test_update_valid
    Receipt.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Receipt.first
    assert_redirected_to receipt_url(assigns(:receipt))
  end

  def test_destroy
    receipt = Receipt.first
    delete :destroy, :id => receipt
    assert_redirected_to receipts_url
    assert !Receipt.exists?(receipt.id)
  end
end
