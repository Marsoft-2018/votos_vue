import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './registerServiceWorker'
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
import axios from 'axios'

Vue.config.productionTip = false
Vue.use(axios)
Vue.use(Buefy)

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
