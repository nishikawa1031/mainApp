module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: true

    argument :email, String, required: false

    def resolve(**args)
      user = User.create!(args)
      {
        user: user
      }
    end
  end
end