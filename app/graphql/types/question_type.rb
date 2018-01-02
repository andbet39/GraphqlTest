
Types::QuestionType = GraphQL::ObjectType.define do
    name 'Question'
  
    field :id, !types.ID
    field :title, !types.String
    field :content, !types.String
    field :user, !Types::UserType
    field :answers, !types[Types::AnswerType]
    field :views, !types.Int , "Number of views"
    field :answercount, !types.Int ,"Count" do
    	resolve -> (obj,args,ctx){
    		obj.answers.size
    	}
    end
end