require 'test_helper'

class StartPageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StartPage.new.valid?
  end
end
