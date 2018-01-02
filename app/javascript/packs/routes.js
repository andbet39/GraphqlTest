import QuestionsPage from '../questions_page.vue'
import QuestionPage from '../question_page.vue'

export default [
    {path : '/' , name :"questions" , component:QuestionsPage},
    {path : '/question/:question_id' , name :"question" , component:QuestionPage , props:true}
]
