Canard::Abilities.for(:user) do
  #inserire anche post e user
  can [:read ,  :update , :create , :new ], Comment
  cannot [ :edit, :destroy ], Comment
end
