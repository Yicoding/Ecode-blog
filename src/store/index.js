/**
 * Created by Administrator on 2016/11/5.
 */
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
var uname = ''
uname = window.sessionStorage.getItem('uname')
const store = new Vuex.Store({
  state: {
    user: {
      name: uname
    },
    shopNum: 0,
    priceAll: 0,
  },
  getters: {
    // config: state => state.config
  },
  mutations: {
    setUser (state, data) {
      state.user = data
    },
    setshopNum (state, data) {
      state.shopNum = data
    },
    setpriceAll (state, data) {
      state.priceAll = data
    },
    setonechangeNum (state, data) {
      if (data == 'add') {
        state.shopNum ++
      } else {
        state.shopNum --
      }
    },
    setonepriceAll (state, data) {
      if (data.action == 'add') {
        state.priceAll += data.price
      } else {
        state.priceAll -= data.price
      }
    },
  },
  actions: {
    getUser (store, data) {
    	store.commit('setUser', data)
    },
    getshopNum (store, data) {
      store.commit('setshopNum', data)
    },
    getpriceAll (store, data) {
      store.commit('setpriceAll', data)
    },
    getonechangeNum (store, data) {
      store.commit('setonechangeNum', data)
    },
    getonepriceAll (store, data) {
      store.commit('setonepriceAll', data)
    }
  }
})

export default store
