require 'minitest/autorun'
require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  test "#index should return 10 shows ordered by average score" do
    shows = FactoryGirl.create_list(:show, 20)
    get :index
    assert_equal(assigns[:shows].count, 10)
    assert_equal(assigns[:shows].sort_by {|s| -s.avg_score }, assigns[:shows])
  end
end
