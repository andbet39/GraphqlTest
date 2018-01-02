class Resolvers::CreateAnswer < GraphQL::Function
    # arguments passed as "args"
    argument :question_id, !types.ID
    argument :content, !types.String
  
    type Types::AnswerType
  
    def call(obj, args, ctx)

      @answer = Answer.create!( question_id: args[:question_id], content: args[:content], user: ctx[:current_user])
      @answer
      
    end
  end