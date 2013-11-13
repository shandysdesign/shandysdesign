require 'spec_helper'

describe ItemsController do
  let (:user) {FactoryGirl.create(:user)}
  let (:item) {FactoryGirl.create(:item)}

  describe '#new' do
    it 'should redirect to root path if user not signed in' do
      get :new
      response.should redirect_to(root_path)
    end

    it 'should render new if user signed in' do
      sign_in(user)
      get :new
      response.should render_template("new")
    end
  end

  describe '#edit' do
    it 'should redirect to root path if user not signed in' do
      get :edit, id:1
      response.should redirect_to(root_path)
    end

    it 'should not redirect to root path if user signed in' do
      sign_in(user)
      get :edit, id:1
      response.should_not redirect_to(root_path)
    end

    it 'should redirect to items path if item not found' do
      sign_in(user)
      get :edit, id:item.id+1
      response.should redirect_to(items_path)
    end

    it 'should render edit if item found' do
      sign_in(user)
      get :edit, id:item.id
      response.should render_template("edit")
    end
  end

  describe '#create' do
    it 'should redirect to root path if user not signed in' do
      post :create
      response.should redirect_to(root_path)
    end

    it 'should not redirect to root path if user signed in' do
      sign_in(user)
      item_attributes = {name:"Chair"}
      post :create,item:item_attributes
      response.should_not redirect_to(root_path)
    end
  end

  describe '#update' do
    it 'should redirect to root path if user not signed in' do
      put :update,id:item.id
      response.should redirect_to(root_path)
    end

    it 'should not redirect to root path if user signed in' do
      sign_in(user)
      item_attributes = {name:"Chair"}
      put :update,id:item.id
      response.should_not redirect_to(root_path)
    end
  end
end
