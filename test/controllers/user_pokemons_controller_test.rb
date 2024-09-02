require "test_helper"

class UserPokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_pokemons_index_url
    assert_response :success
  end
end
