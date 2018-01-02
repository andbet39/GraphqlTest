<template>
    <div>
        <vue-editor v-model="answer_text"></vue-editor>
        <button class="btn btn-success" @click="createAnswer" > Save </button>
    </div>
</template>

<script>
    import { VueEditor } from 'vue2-editor'

    export default {
        data() {
            return {
                answer_text: ""
            }
        },
        components: {
            VueEditor
        },
        created:()=>{
        },
        methods: {
           createAnswer(){
               this.$emit('create-answer',{content:this.answer_text})
           }
        },
    }
</script>

<style scoped>

</style>