import Vue from 'vue'
import Router from 'vue-router'

// root
// root （一级路由）
import rootpage from 'components/root/root'
// order (二级路由)
import order from 'components/root/order/order'
// (三级路由)
// system (二级路由)
import system from 'components/root/system/system'
// (三级路由)
import sysmenu from 'components/root/system/sysmenu'
import user from 'components/root/system/user'
import userinfo from 'components/root/system/userinfo'
import part from 'components/root/system/part'
import partinfo from 'components/root/system/partinfo'
import role from 'components/root/system/role'
import roleinfo from 'components/root/system/roleinfo'

// admin
// admin (一级路由)
import admin from 'components/admin/admin'
// user (二级路由)
import usermanage from 'components/admin/usermanage'
import userchange from 'components/admin/userchange'
// (三级路由)

// general 
// general (一级路由)
import general from 'components/general/general'

// mine (一级路由)
import mine from 'components/mine'
import minemenu from 'components/minemenu'
import mineinfo from 'components/mineinfo'

// user option
import useroption from 'components/useroption'

// sign
import sign from 'components/sign'

// login (一级路由)
import login from 'components/login/login'

// registered (一级路由)
import registered from 'components/login/registered'

// 菜单
import menulist from 'components/menulist'
import menuinfo from 'components/menuinfo'

// 购物车
import shop from 'components/shop'

// 我的收藏
import collect from 'components/collect'

// 我的订单
import mineorderlist from 'components/mineorderlist'

// 确认订单
import orderlist from 'components/orderlist'

// 单个订单详情
import ordercontent from 'components/ordercontent'

// 去评价
import torate from 'components/torate'
// 我的评价
import minerate from 'components/minerate'
// 编辑菜单
import editmenu from 'components/editmenu'
// 编辑个人信息
import edituser from 'components/edituser'


Vue.use(Router)

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
  ]
})
