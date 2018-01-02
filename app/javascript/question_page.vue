<template>
    <div class="row">
        <div class="col-sm-6">
            <div  v-if="question != null">
                <div>
                 <h3>{{question.title}}</h3>
            </div>
            <p>
                {{question.content}}
            </p>
            <ul>
                <li v-for="answer in question.answers" > {{answer.content}}</li>
            </ul>
            <div>
              <answerform @create-answer="createAnswer"></answerform>
            </div>
        </div>
        <div v-if="question == null"> Loading... </div>
    </div>

    </div>
</template>

<script>
    import gql from 'graphql-tag'
    import  {GetQuestion}  from './graphql/question.gql';
    import AnswerForm from './components/answer_form.vue'
    
    export default {
        components:{
            'answerform':AnswerForm
        },
        data() {
            return {
                question: null
            }
        },
        props: {
            question_id: {
                type: String,
                default: null
            },
        },
        created: ()=>{
            console.log(GetQuestion)
        },
        apollo:{
            question: 
            {
                query: gql`query GetQuestion($qid: ID!){
                                question(id:$qid){
                                    title
                                    content
                                    answers{
                                        id
                                        content
                                    }
                                }
                            }`,
                variables() {
                    return {
                         qid: this.question_id,
                    }
                }
            }
        },
        methods: {
            createAnswer(answer) {
             console.log(answer)
             const question_id = this.question_id
             const content = answer.content
            console.log(question_id)    
            try {
                this.$apollo.mutate({
                    mutation: gql`mutation createAnswer($question_id:ID!, $content:String!){
                                  createAnswer(question_id:$question_id,content: $content)
                                        {id,content}   
                                }`,
                    variables: {
                        question_id: question_id,
                        content : content
                    },
                    update: (store, { data: { createAnswer } }) => {

                        console.log ("Update")
                        console.log(createAnswer)

                        const data = store.readQuery({ query: gql`query GetQuestion($qid: ID!){
                                question(id:$qid){
                                    title
                                    content
                                    answers{
                                        id
                                        content
                                    }
                                }
                            }`,variables: { qid: this.question_id }, })
        // Add our tag from the mutation to the end
                           data.question.answers.push(createAnswer)
        console.log(data)
        // Write our data back to the cache.
        store.writeQuery({ query: gql`query GetQuestion($qid: ID!){
                                question(id:$qid){
                                    title
                                    content
                                    answers{
                                        id
                                        content
                                    }
                                }
                            }`,variables: { qid: this.question_id }, data })
                   
                    },
                    optimisticResponse: {
                        __typename: 'Mutation',
                        createAnswer: {
                            __typename: 'Answer',
                            id: null,
                            content: content,
                            question_id : question_id,
                        },
                    },
                })
            } catch (e) {
                console.error(e)
                this.answer_text = ""
            }   
             }
                
            
        },
    }
</script>

<style scoped>

</style>