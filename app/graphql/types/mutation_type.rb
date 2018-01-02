
Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createQuestion, function: Resolvers::CreateQuestion.new
  field :createAnswer, function: Resolvers::CreateAnswer.new
  field :voteAnswer,  function: Resolvers::VoteAnswer.new
end



