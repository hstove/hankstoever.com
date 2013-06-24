require 'spec_helper'

describe PagesController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', template: "projects"
      response.should be_success
    end
  end

end
