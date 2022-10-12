Canard::Abilities.for(:user) do
  #inserire anche post e user
  can [:read ,  :update , :create , :new , :edit, :destroy], Comment
  cannot [ ], Comment
end
