require 'test_helper'

class ActivitatsControllerTest < ActionController::TestCase
  setup do
    @activitat = activitats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activitats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activitat" do
    assert_difference('Activitat.count') do
      post :create, activitat: { descripcio: @activitat.descripcio, lat: @activitat.lat, long: @activitat.long, subtitol: @activitat.subtitol, titol: @activitat.titol, user_id: @activitat.user_id }
    end

    assert_redirected_to activitat_path(assigns(:activitat))
  end

  test "should show activitat" do
    get :show, id: @activitat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activitat
    assert_response :success
  end

  test "should update activitat" do
    patch :update, id: @activitat, activitat: { descripcio: @activitat.descripcio, lat: @activitat.lat, long: @activitat.long, subtitol: @activitat.subtitol, titol: @activitat.titol, user_id: @activitat.user_id }
    assert_redirected_to activitat_path(assigns(:activitat))
  end

  test "should destroy activitat" do
    assert_difference('Activitat.count', -1) do
      delete :destroy, id: @activitat
    end

    assert_redirected_to activitats_path
  end
end
