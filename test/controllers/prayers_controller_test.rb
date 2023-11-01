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

  test "show" do
    get "/prayers/#{Prayer.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "body", "created_at", "updated_at"], data.keys
  end
end
