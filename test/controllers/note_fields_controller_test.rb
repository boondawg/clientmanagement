require 'test_helper'

class NoteFieldsControllerTest < ActionController::TestCase
  setup do
    @note_field = note_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:note_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note_field" do
    assert_difference('NoteField.count') do
      post :create, note_field: { [note_id: @note_field.[note_id, note_template_field_id: @note_field.note_template_field_id, value: @note_field.value }
    end

    assert_redirected_to note_field_path(assigns(:note_field))
  end

  test "should show note_field" do
    get :show, id: @note_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note_field
    assert_response :success
  end

  test "should update note_field" do
    patch :update, id: @note_field, note_field: { [note_id: @note_field.[note_id, note_template_field_id: @note_field.note_template_field_id, value: @note_field.value }
    assert_redirected_to note_field_path(assigns(:note_field))
  end

  test "should destroy note_field" do
    assert_difference('NoteField.count', -1) do
      delete :destroy, id: @note_field
    end

    assert_redirected_to note_fields_path
  end
end
