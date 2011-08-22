require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Receipt.new.valid?
  end
end
