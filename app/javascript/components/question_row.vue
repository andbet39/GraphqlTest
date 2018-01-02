<template>
    <div class="card">
        <div class="card-body">
            <div class="card-title">
                <h4> <router-link :to="{ name: 'question', params: { question_id: question.id }}">{{question.title}}</router-link></h4>
            </div>
            <p class="card-text">{{question.answercount}}</p> 
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            question: {
                type: Object,
                default: null
            }
        },
    }
</script>

<style scoped>

</style>