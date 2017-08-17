/**
 * Created by Administrator on 2016/11/5.
 */
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

// axiso.get()
var uname = ''
// uname = window.localStorage.getItem('uname')
uname = window.sessionStorage.getItem('uname')
const store = new Vuex.Store({
  state: {
    user: {
    	name: uname
    }
  },
  getters: {
    // config: state => state.config
  },
  mutations: {
    setUser: (state, name) => {
      state.user.name = name
    },
  },
  actions: {
    getUser (store, name) {
    	store.commit('setUser', name)
    },
    firstGet (store) {
      axios.get()
    }
  }
})

export default store
