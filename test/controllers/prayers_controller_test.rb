require "test_helper"

class PrayersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/prayers.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Prayer.count, data.length
  end
end
