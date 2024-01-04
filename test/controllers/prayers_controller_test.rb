require "test_helper"

class PrayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "test@test.com", password: "password")
    @prayer = Prayer.create(user_id: @user.id, pray_for: "person", title: "needy", prayer_type: "need", body: "prayer")
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/prayers.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Prayer.count, data.length
  end

  test "create" do
    assert_difference "Prayer.count", 1 do
      post "/prayers.json", headers: { "Authorization" => "Bearer #{@jwt}" },
                            params: { user_id: 1, pray_for: "dad", title: "sick", prayer_type: "answered", body: "prayer" }
      assert_response 200
    end
  end

  test "show" do
    get "/prayers/#{Prayer.first.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "pray_for", "title", "prayer_type", "body", "created_at", "updated_at"], data.keys
  end

  test "update" do
    prayer = Prayer.first
    patch "/prayers/#{@prayer.id}.json",
          headers: { "Authorization" => "Bearer #{@jwt}" },
          params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Prayer.count", -1 do
      delete "/prayers/#{Prayer.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
