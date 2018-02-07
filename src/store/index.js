/**
 * Created by Administrator on 2016/11/5.
 */
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
const store = new Vuex.Store({
  state: {
    user: {},
    shopNum: 0,
    priceAll: 0,
    timeup: true,
    menuList: [],
  },
  getters: {
    // config: state => state.config
    menuList: state => state.menuList
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
    setTimeup (state, data) {
      state.timeup = data
    },
    setMenuList(state, data) {
      state.menuList = data
    }
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
    },
    getTimeup (store, data) {
      store.commit('setTimeup', data)
    },
    saveMenuList(store, data) {
      store.commit('setMenuList', data)
    }
  }
})

export default store
