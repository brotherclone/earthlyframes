 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/character_settings", type: :request do
  # CharacterSetting. As you add validations to CharacterSetting, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CharacterSetting.create! valid_attributes
      get character_settings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      character_setting = CharacterSetting.create! valid_attributes
      get character_setting_url(character_setting)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_character_setting_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      character_setting = CharacterSetting.create! valid_attributes
      get edit_character_setting_url(character_setting)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CharacterSetting" do
        expect {
          post character_settings_url, params: { character_setting: valid_attributes }
        }.to change(CharacterSetting, :count).by(1)
      end

      it "redirects to the created character_setting" do
        post character_settings_url, params: { character_setting: valid_attributes }
        expect(response).to redirect_to(character_setting_url(CharacterSetting.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CharacterSetting" do
        expect {
          post character_settings_url, params: { character_setting: invalid_attributes }
        }.to change(CharacterSetting, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post character_settings_url, params: { character_setting: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested character_setting" do
        character_setting = CharacterSetting.create! valid_attributes
        patch character_setting_url(character_setting), params: { character_setting: new_attributes }
        character_setting.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the character_setting" do
        character_setting = CharacterSetting.create! valid_attributes
        patch character_setting_url(character_setting), params: { character_setting: new_attributes }
        character_setting.reload
        expect(response).to redirect_to(character_setting_url(character_setting))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        character_setting = CharacterSetting.create! valid_attributes
        patch character_setting_url(character_setting), params: { character_setting: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested character_setting" do
      character_setting = CharacterSetting.create! valid_attributes
      expect {
        delete character_setting_url(character_setting)
      }.to change(CharacterSetting, :count).by(-1)
    end

    it "redirects to the character_settings list" do
      character_setting = CharacterSetting.create! valid_attributes
      delete character_setting_url(character_setting)
      expect(response).to redirect_to(character_settings_url)
    end
  end
end
