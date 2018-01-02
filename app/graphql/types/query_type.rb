
  Types::QueryType = GraphQL::ObjectType.define do
    name "Query"
  
    field :questions, !types[Types::QuestionType] do
      resolve -> (obj, args, ctx) {
        Question.all.limit(20)
      }
    end

    field :question do
      type Types::QuestionType
      argument :id, !types.ID
      resolve -> (obj, args, ctx) {
        Question.find(args[:id])
      }
    end

    field :me do
      type Types::UserType 
      resolve -> (obj,args,ctx){
        ctx[:current_user]
      }
    end

  end
