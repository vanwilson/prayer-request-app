require "test_helper"

class PrayersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/prayers.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Prayer.count, data.length
  end

  test "create" do
    assert_difference "Prayer.count", 1 do
      post "/prayers.json", params: { title: "Need", body: "prayers" }
      assert_response 200
    end
  end
end
