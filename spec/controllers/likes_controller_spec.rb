require 'rails_helper'

RSpec.describe LikesController, :type => :controller do
  before do
    user = create_user
    secret = user.secrets.create(content: "Oops")
    @like = user.likes.create(user: user, secret: secret)
  end

  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end

    it "cannot access create" do 
      post :create
      expect(response).to redirect_to("/sessions/new")      
    end

    it "cannot access destroy" do
      delete :destroy, id: @like
      expect(response).to redirect_to("/sessions/new")
    end
  end
end
RSpec.describe LikesController, type: :controller do
 before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      user = create_user
      secret = user.secrets.create(content: 'Ooops')
      @like = user.likes.create(user: user, secret: secret)
  end

	describe "when signed in as the wrong user" do
    before do
      session[:user_id] = @wrong_user.id
    end

    it "cannot access create" do 
      post :create
      expect(response).to redirect_to("/sessions/new")      
    end

    it "cannot access destroy" do
      delete :destroy, id: @like
      expect(response).to redirect_to("/sessions/new")
    end
end
end
