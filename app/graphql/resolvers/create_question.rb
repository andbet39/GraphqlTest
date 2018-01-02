class Resolvers::CreateQuestion < GraphQL::Function
    # arguments passed as "args"
    argument :title, !types.String
    argument :content, !types.String
  
    # return type from the mutation
    type Types::QuestionType
  
    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # _ctx - is the GraphQL context (which would be discussed later)
    def call(_obj, args, _ctx)
      Question.create!(
        title: args[:title],
        content: args[:content],
        user: _ctx[:current_user]
      )
    end
  end