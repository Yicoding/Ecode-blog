/**
 * Created by Administrator on 2016/11/5.
 */
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

const store = new Vuex.Store({
  state: {
    user: {
    	name: ''
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
  }
})

export default store
