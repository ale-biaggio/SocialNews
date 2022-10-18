Canard::Abilities.for(:user) do

  if user.admin?
    can :manage, :all
  end

end
