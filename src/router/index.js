import Vue from 'vue'
import Router from 'vue-router'
import login from 'components/login/login'
import registered from 'components/login/registered'

import home from 'components/home'
import rootpage from 'components/root/root'


Vue.use(Router)

export default new Router({
  routes: [
    // {
    //   path: '/',
    //   component: login
    // },
    {
      path: '/login',
      component: login
    },
    {
    	path: '/registered',
    	component: registered
    },
    {
      path: '/home',
      component: home,
      children: [
        {
          path: '/',
          component: rootpage
        },
        {
          path: '/root',
          component: rootpage
        },
      ]
    },
    {
      path: '*',
      redirect: '/login'
    }
  ]
})
