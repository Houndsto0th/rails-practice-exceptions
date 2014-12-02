require 'rails_helper'

describe PagesController do
  describe '#index' do

    it 'renders index if the session user_id is 3' do
      session[:user_id] = 3

      get :index
      expect(response).to render_template("index")

    end

    it 'redirects to the signin page if the session user_id is nil' do

      get :index
      expect(response).to redirect_to(signin_path)

    end

    it 'renders a 404 for any user_id other than 3' do
      session[:user_id] = 5

      get:index
      expect(response.status).to eq(404)
    end

  end
end
