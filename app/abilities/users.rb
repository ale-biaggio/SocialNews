Canard::Abilities.for(:user) do
  can [:read ,  :update , :create , :new , :edit], Post
  cannot [:destroy ], Post
end
