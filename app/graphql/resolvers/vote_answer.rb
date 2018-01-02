class Resolvers::VoteAnswer < GraphQL::Function

    argument :answer_id, !types.ID
  
    type Types::AnswerType
  
    def call(_obj, args, _ctx)

     answer = Answer.find(args[:answer_id])
     answer.vote_by :voter => _ctx[:current_user]
     answer

    end
  end