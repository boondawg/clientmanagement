require 'test_helper'

class NoteTemplateFieldsControllerTest < ActionController::TestCase
  setup do
    @note_template_field = note_template_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:note_template_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note_template_field" do
    assert_difference('NoteTemplateField.count') do
      post :create, note_template_field: { defaultValue: @note_template_field.defaultValue, name: @note_template_field.name, note_template_id: @note_template_field.note_template_id, order: @note_template_field.order, type: @note_template_field.type }
    end

    assert_redirected_to note_template_field_path(assigns(:note_template_field))
  end

  test "should show note_template_field" do
    get :show, id: @note_template_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note_template_field
    assert_response :success
  end

  test "should update note_template_field" do
    patch :update, id: @note_template_field, note_template_field: { defaultValue: @note_template_field.defaultValue, name: @note_template_field.name, note_template_id: @note_template_field.note_template_id, order: @note_template_field.order, type: @note_template_field.type }
    assert_redirected_to note_template_field_path(assigns(:note_template_field))
  end

  test "should destroy note_template_field" do
    assert_difference('NoteTemplateField.count', -1) do
      delete :destroy, id: @note_template_field
    end

    assert_redirected_to note_template_fields_path
  end
end
