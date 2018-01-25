import Vue from 'vue'
import Router from 'vue-router'

// // root
// // root （一级路由）
// import rootpage from 'components/root/root'
// // order (二级路由)
// import order from 'components/root/order/order'
// // (三级路由)
// // system (二级路由)
// import system from 'components/root/system/system'
// // (三级路由)
// import sysmenu from 'components/root/system/sysmenu'
// import user from 'components/root/system/user'
// import userinfo from 'components/root/system/userinfo'
// import part from 'components/root/system/part'
// import partinfo from 'components/root/system/partinfo'
// import role from 'components/root/system/role'
// import roleinfo from 'components/root/system/roleinfo'

// // admin
// // admin (一级路由)
// import admin from 'components/admin/admin'
// // user (二级路由)
// import usermanage from 'components/admin/usermanage'
// import userchange from 'components/admin/userchange'
// // (三级路由)

// // general 
// // general (一级路由)
// import general from 'components/general/general'

// // mine (一级路由)
// import mine from 'components/mine'
// import minemenu from 'components/minemenu'
// import mineinfo from 'components/mineinfo'

// // user option
// import useroption from 'components/useroption'

// // sign
// import sign from 'components/sign'

// // login (一级路由)
// import login from 'components/login/login'

// // registered (一级路由)
// import registered from 'components/login/registered'

// // 菜单
// import menulist from 'components/menulist'
// import menuinfo from 'components/menuinfo'

// // 购物车
// import shop from 'components/shop'

// // 我的收藏
// import collect from 'components/collect'

// // 我的订单
// import mineorderlist from 'components/mineorderlist'

// // 确认订单
// import orderlist from 'components/orderlist'

// // 单个订单详情
// import ordercontent from 'components/ordercontent'

// // 去评价
// import torate from 'components/torate'
// // 我的评价
// import minerate from 'components/minerate'
// // 编辑菜单
// import editmenu from 'components/editmenu'
// // 编辑个人信息
// import edituser from 'components/edituser'


Vue.use(Router)

// 路由懒加载技术
// root
const rootpage = () => import('components/root/root')
const order = () => import('components/root/order/order')
const system = () => import('components/root/system/system')
const sysmenu = () => import('components/root/system/sysmenu')
const user = () => import('components/root/system/user')
const userinfo = () => import('components/root/system/userinfo')
const part = () => import('components/root/system/part')
const partinfo = () => import('components/root/system/partinfo')
const role = () => import('components/root/system/role')
const roleinfo = () => import('components/root/system/roleinfo')

// admin
const admin = () => import('components/admin/admin')
const usermanage = () => import('components/admin/usermanage')
const userchange = () => import('components/admin/userchange')

// general 
const general = () => import('components/general/general')

const mine = () => import('components/mine')
const minemenu = () => import('components/minemenu')
const mineinfo = () => import('components/mineinfo')
const useroption = () => import('components/useroption')
const sign = () => import('components/sign')

// login
const login = () => import('components/login/login')
const registered = () => import('components/login/registered')

const menulist = () => import('components/menulist')
const menuinfo = () => import('components/menuinfo')
const shop = () => import('components/shop')
const collect = () => import('components/collect')
const mineorderlist = () => import('components/mineorderlist')
const orderlist = () => import('components/orderlist')
const ordercontent = () => import('components/ordercontent')
const torate = () => import('components/torate')
const minerate = () => import('components/minerate')
const editmenu = () => import('components/editmenu')
const edituser = () => import('components/edituser')


export default new Router({
  linkActiveClass: 'active',
  routes: [
    {
      path: '/root',
      component: rootpage,
      children: [
        { path: '/', component: order },
        { path: 'order', component: order },
        { path: 'menuinfo', component: menuinfo },
        {
          path: 'system',
          component: system,
          children: [
            { path: '/', component: sysmenu },
            { path: 'menu', component: sysmenu },
            { path: 'user', component: user },
            { path: 'userinfo', component: userinfo },
            { path: 'part', component: part },
            { path: 'partinfo', component: partinfo },
            { path: 'role', component: role },
            { path: 'roleinfo', component: roleinfo },
          ]
        },
        {
          path: 'mine',
          component: mine,
          children: [
            { path: '/', component: minemenu },
            { path: 'minemenu', component: minemenu },
            { path: 'mineinfo', component: mineinfo },
            { path: 'useroption', component: useroption },
            { path: 'sign', component: sign },
          ]
        },
      ]
    },
    {
      path: '/admin',
      component: admin,
      children: [
        { path: 'usermanage', component: usermanage },
        { path: 'userchange', component: userchange },
        {
          path: 'mine',
          component: mine,
          children: [
            { path: '/', component: minemenu },
            { path: 'minemenu', component: minemenu },
            { path: 'mineinfo', component: mineinfo },
            { path: 'collect', component: collect },
            { path: 'mineorderlist', component: mineorderlist },
            { path: 'minerate', component: minerate },
            { path: 'useroption', component: useroption },
            { path: 'sign', component: sign },
          ]
        },
        { path: 'menulist', component: menulist },
        { path: 'menuinfo', component: menuinfo },
        { path: 'shop', component: shop },
      ]
    },
    {
      path: '/general',
      component: general,
      children: [
        {
          path: 'mine',
          component: mine,
          children: [
            { path: '/', component: minemenu },
            { path: 'minemenu', component: minemenu },
            { path: 'mineinfo', component: mineinfo },
            { path: 'collect', component: collect },
            { path: 'mineorderlist', component: mineorderlist },
            { path: 'minerate', component: minerate },
            { path: 'useroption', component: useroption },
            { path: 'sign', component: sign },
          ]
        },
        { path: 'menulist', component: menulist },
        { path: 'menuinfo', component: menuinfo },
        { path: 'shop', component: shop },
      ]
    },
    { path: '/login', component: login },
    { path: '/registered', component: registered },
    { path: '/orderlist', component: orderlist },
    { path: '/ordercontent', component: ordercontent },
    { path: '/torate', component: torate },
    { path: '/editmenu', component: editmenu },
    { path: '/edituser', component: edituser },
    { path: '*', redirect: '/login' },
  ]
})
