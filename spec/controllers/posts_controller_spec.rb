require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    let!(:user) {User.create(
                name: "La Repubblica",
                surname: "",
                username: "La Repubblica",
                email: "larepubblica@gmail.com",        
                password: "password"        
                ).tap { |user| user.confirm } }
    let!(:user2) {User.create(        
                name: "Ansa",        
                surname: "",        
                username:  "Ansa",        
                email: "ansa@gmail.com",        
                password: "password"        
            ).tap { |user| user.confirm }}        
    let!(:user3) {User.create(        
                name: "Il Sole 24 Ore",        
                surname: "",        
                username:  "Il Sole 24 Ore",        
                email: "ilsole24ore@gmail.com",        
                password: "password"       
            ).tap { |user| user.confirm }}       
    let!(:user4) {User.create(      
                name: "Football Italia",     
                surname: "",   
                username:  "Football Italia",   
                email: "footballitalia@gmail.com",   
                password: "password"       
            ).tap { |user| user.confirm }}       
    let!(:user5) {User.create(      
                name: "BBC News",      
                surname: "",      
                username:  "BBC News",      
                email: "bbcnews@gmail.com",      
                password: "password"      
            ).tap { |user| user.confirm }}     
    let!(:user6) {User.create(      
                name: "nome_prova",     
                surname: "",    
                username:  "utente_prova",
                email: "11@1",  
                password: "123456"  
            ).tap { |user| user.confirm }}  
    let!(:user7) {User.create(  
                name: "admin",
                surname: "", 
                username:  "admin", 
                email: "admin@gmail.com", 
                password: "123456", 
            ).tap { |user| user.confirm }}
    let!(:user8) {User.create(
                name: "Il Fatto Quotidiano",
                surname: "",
                username:  "Il Fatto Quotidiano",
                email: "ilfattoquotidiano@gmail.com",
                password: "123456"
            ).tap { |user| user.confirm }}
  let(:valid_attributes) { { title: 'Test Title', body: 'Test Body', category: 'Cultura', user_id: user.id, rank: 999 } }
  let(:invalid_attributes) { { title: nil, body: 'Test Body', category: 'Cultura', user_id: user.id } }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

 

  
  describe 'GET #index' do

    it 'assigns all posts as @posts' do
        post = Post.create! valid_attributes
        get :index
        expect(assigns(:posts)).to include(post)
    end
  end

  describe 'GET #new' do
    it 'assigns a new post as @post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

 

  describe 'POST #create' do
    context 'with valid params' do
        it 'creates a new Post' do
            expect {
              post :create, params: { post: valid_attributes}     
            }.to change(Post, :count).by(1)
        end
        it 'assigns a newly created post as @post' do
            post :create, params: { post: valid_attributes }
            expect(assigns(:post)).to be_a(Post)
            expect(assigns(:post)).to be_persisted
        end

 

        it 'redirects to the root_path' do
            post :create, params: { post: valid_attributes }
            expect(response).to redirect_to(root_path)
        end
    end
    context 'with invalid params' do
        it 'does not create a new Post' do
            expect {
              post :create, params: { post: invalid_attributes }
            }.not_to change(Post, :count)
        end
        it 'assigns a newly created but unsaved post as @post' do
          post :create, params: { post: invalid_attributes }
          expect(assigns(:post)).to be_a_new(Post)
        end
        it 're-renders the "new" template' do
          post :create, params: { post: invalid_attributes }
          expect(response).to render_template(:new)
        end
    end
  end
  describe 'PATCH #update' do
      context 'with valid params'do
          let(:new_attributes) { { title: 'New Title' } }
          it 'updates the requested post' do
              post = Post.create! valid_attributes
              patch :update, params: { id: post.to_param, post: new_attributes }
              post.reload
              expect(post.title).to eq('New Title')
          end
          it 'assigns the requested post as @post' do
              post = Post.create! valid_attributes
              patch :update, params: { id: post.to_param, post: new_attributes }
              expect(assigns(:post)).to eq(post)
          end
          it 'redirects to the root_path' do
              post = Post.create! valid_attributes
              patch :update, params: { id: post.to_param, post: new_attributes }
              expect(response).to redirect_to(root_path)
          end
      end          
      context 'with invalid params' do
          it 'does not update the post' do
              post = Post.create! valid_attributes
              patch :update, params: { id: post.to_param, post: invalid_attributes }
              post.reload
              expect(post.title).not_to be_nil
          end
          it 'assigns the post as @post' do
              post = Post.create! valid_attributes
              patch :update, params: { id: post.to_param, post: invalid_attributes }
              expect(assigns(:post)).to eq(post)
          end
          it 're-renders the "edit" template' do
              post = Post.create! valid_attributes
              patch :update, params: { id: post.to_param, post: invalid_attributes }
              expect(response).to render_template(:edit)
          end
      end
  end
  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = Post.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      post = Post.create! valid_attributes
      delete :destroy, params: { id: post.to_param }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'POST #favorite' do

    let!(:created_post) { Post.create!(valid_attributes) }

    context 'when the post is not favorited' do
      it 'creates a new favorite' do
        expect {
          post :favorite, params: { id: created_post.id }
        }.to change(Favorite, :count).by(1)
      end
    end

    context 'when the post is already favorited' do
      let!(:favorite) { Favorite.create!(user: user, post: created_post) }

      it 'removes the favorite' do
        expect {
          post :favorite, params: { id: created_post.id }
        }.to change(Favorite, :count).by(-1)
      end
    end
  end

  describe 'GET #show_favorite' do
    let!(:created_post) { Post.create!(valid_attributes) }
    let!(:favorite) { Favorite.create!(user: user, post: created_post) }

    it 'assigns favorited posts as @posts' do
      get :show_favorite, params: { id: user.id }
      expect(assigns(:posts)).to eq([created_post])
    end
  end

end

