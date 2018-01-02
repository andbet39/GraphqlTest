
Types::AnswerType = GraphQL::ObjectType.define do
    name 'Answer'
  
    field :id, !types.ID
    field :content, !types.String
    field :votes, !types.String ,"Votes" do
    	resolve -> (obj,args,ctx){
    		obj.votes_for.size
    	}
    end

end