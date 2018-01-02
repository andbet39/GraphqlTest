const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')


environment.loaders.append('vue', vue)

  
environment.loaders.prepend('gql', {
  test: /\.(graphql|gql)$/,
    exclude: /node_modules/,
    loader: 'graphql-tag/loader'
  
} )


environment.loaders.forEach(element => {
  if(element.value) {
    console.log(element)
  }  
});
module.exports = environment
