


import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import { ApolloClient ,createNetworkInterface } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'
import VueRouter from 'vue-router'

import routes from './routes'
import TurbolinksAdapter from 'vue-turbolinks';


var token = $('meta[name="csrf-token"]').attr('content');

const httpLink = new HttpLink({
	// You should use an absolute URL here
		uri: 'http://localhost:3000/graphql',
		credentials: 'same-origin',
	headers: {
	  'X-CSRF-Token': token
		}
})




// Create the apollo client
const apolloClient = new ApolloClient({
	link : httpLink,
	cache: new InMemoryCache(),
	connectToDevTools: true,
})


Vue.use(VueRouter)
Vue.use(VueApollo)
Vue.use(TurbolinksAdapter)


const apolloProvider = new VueApollo({
	defaultClient: apolloClient,
})

const router = new VueRouter(
	{routes : routes}
)

 console.log(token)

document.addEventListener('turbolinks:load', () => {
   const app = new Vue({
		 el: '#main',
		 router,
     apolloProvider,
     components: { App }
   })

})
