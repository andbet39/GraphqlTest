<template>
    <div class="row">
        <div class="col-md-6">          
           <question-row v-for="question in questions" :key="question.id" :question="question"/>
        </div>
    </div>
</template>

<script>
    import gql from 'graphql-tag'
    import questionrow from './components/question_row.vue'

    export default {
        data() {
            return {
                questions: []
            }
        },
        apollo:{
            questions:gql`{
                questions{
                        id
                        title
                        answercount
                    }
                }`,
        },
        components:{
            'question-row':questionrow
        }
    }
</script>

<style scoped>

</style>