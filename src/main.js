// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(MintUI)
// 图片懒加载技术
import VueLazyload from 'vue-lazyload'
Vue.use(VueLazyload, {
  loading: require('assets/logo.png')
})
Vue.prototype.$http = axios
Vue.prototype.resource = 'http://192.168.10.239:3000'
// Vue.prototype.resource = 'http://192.168.1.105:3000'
// Vue.prototype.resource = 'http://localhost:3000'
import store from './store'
// 签名
// import vueSignature from "vue-signature"
// Vue.use(vueSignature)
// 图标icom
import 'assets/style.css'
// 自定义css
import 'assets/main.css'
/* eslint-disable no-unused-vars */
// import VConsole from 'vconsole'
// var vConsole = new VConsole()
/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  template: '<App/>',
  components: { App }
})
