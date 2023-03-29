require 'rails_helper'

 

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User') }

 

  describe 'validations' do
    it 'is valid with valid attributes' do
      post = Post.new(title: 'Test Title', body: 'Test Body', category: 'Cultura', user: user)
      expect(post).to be_valid
    end

 

    it 'is invalid without a title' do
      post = Post.new(title: nil, body: 'Test Body', category: 'Cultura', user: user)
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

 

    it 'is invalid without a category' do
      post = Post.new(title: 'Test Title', body: 'Test Body', category: nil, user: user)
      expect(post).not_to be_valid
      expect(post.errors[:category]).to include("can't be blank")
    end

 

    it 'is invalid with an invalid category' do
      post = Post.new(title: 'Test Title', body: 'Test Body', category: 'Invalid Category', user: user)
      expect(post).not_to be_valid
      expect(post.errors[:category]).to include("is not included in the list")
    end
  end

 

  describe 'associations' do
    it 'belongs to a user' do
      post = Post.new(title: 'Test Title', body: 'Test Body', category: 'Cultura', user: user)
      expect(post.user).to eq(user)
    end
  end
end