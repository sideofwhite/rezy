require 'test_helper'

class FeaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feature = features(:one)
  end

  test "should get index" do
    get features_url
    assert_response :success
  end

  test "should get new" do
    get new_feature_url
    assert_response :success
  end

  test "should create feature" do
    assert_difference('Feature.count') do
      post features_url, params: { feature: { air: @feature.air, available: @feature.available, bath: @feature.bath, bbq: @feature.bbq, bed: @feature.bed, cat: @feature.cat, deck: @feature.deck, description: @feature.description, dishwasher: @feature.dishwasher, dog: @feature.dog, hardwood: @feature.hardwood, neighbourhood: @feature.neighbourhood, new_kitchen: @feature.new_kitchen, rent: @feature.rent, rental_id: @feature.rental_id, title: @feature.title, washer_dryer: @feature.washer_dryer, year_lease: @feature.year_lease } }
    end

    assert_redirected_to feature_path(Feature.last)
  end

  test "should show feature" do
    get feature_url(@feature)
    assert_response :success
  end

  test "should get edit" do
    get edit_feature_url(@feature)
    assert_response :success
  end

  test "should update feature" do
    patch feature_url(@feature), params: { feature: { air: @feature.air, available: @feature.available, bath: @feature.bath, bbq: @feature.bbq, bed: @feature.bed, cat: @feature.cat, deck: @feature.deck, description: @feature.description, dishwasher: @feature.dishwasher, dog: @feature.dog, hardwood: @feature.hardwood, neighbourhood: @feature.neighbourhood, new_kitchen: @feature.new_kitchen, rent: @feature.rent, rental_id: @feature.rental_id, title: @feature.title, washer_dryer: @feature.washer_dryer, year_lease: @feature.year_lease } }
    assert_redirected_to feature_path(@feature)
  end

  test "should destroy feature" do
    assert_difference('Feature.count', -1) do
      delete feature_url(@feature)
    end

    assert_redirected_to features_path
  end
end
