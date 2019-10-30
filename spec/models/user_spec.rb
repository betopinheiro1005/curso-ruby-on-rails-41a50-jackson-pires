require 'rails_helper'

RSpec.describe User, type: :model do

  context "Testando a View User" do
    it "Cadastrar um usuário" do

      users = User.all
      size_old = users.size

      visit '/users/new'
      within("#form_user") do
        fill_in 'Name', with: 'Jackson'
        fill_in 'Email', with: 'jackson@gmail.com'
      end
      click_button 'Create User'
      expect(page).to have_content 'User was successfully created.'

      users = User.all
      expect(users.size).to eq(size_old + 1)

    end
  end

  context "Validade de um Usuário" do
    it "Usuário válido?" do
      user = User.new
      user.name = "Jackson"
      user.email = "jackson@gmail.com"
      expect(user.valid?).to be_truthy
    end

    it "Usuário inválido?" do
      user = User.new
      user.name = "Jackson"
      user.email = nil
      expect(user.valid?).to be_falsey
    end
  end

  context "Títulos válidos" do
    it "Título completo" do
      user = User.new
      user.name = "Jackson"
      user.email = "jackson@gmail.com"
      expect(user.titulo_completo).to eq("Sr. Jackson - Email: jackson@gmail.com")
    end
  end

end
