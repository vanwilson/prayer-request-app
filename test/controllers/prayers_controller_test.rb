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
      post "/prayers.json", params: { pray_for: "dad", title: "sick", type: "need", body: "prayer" }
      assert_response 200
    end
  end

  test "show" do
    get "/prayers/#{Prayer.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "pray_for", "title", "type", "body", "created_at", "updated_at"], data.keys
  end

  test "update" do
    prayer = Prayer.first
    patch "/prayers/#{prayer.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Prayer.count", -1 do
      delete "/prayers/#{Prayer.first.id}.json"
      assert_response 200
    end
  end
end
