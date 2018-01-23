<template>
  <div>
    <div :class="item.style" v-for="item in menuArr" :key="item.tab" style="position: relative;">
      <router-link :to="item.link" class="tab"><span :class="item.icon"></span><br/>{{item.tab}}</router-link>
      <span v-show="shopNum > 0 && item.isShow" class="shop-ball">{{shopNum}}</span>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      menuArr: []
    }
  },
  computed: {
    shopNum () {
      return this.$store.state.shopNum
    },
    user () {
      return this.$store.state.user
    },
    // isChange() {

    // }
  },
  watch: {
    $route(value) {
      if (this.user.role && this.user.role.name == 'admin') {
        this.menuArr = [
          {style: 'bar left', link: '/admin/menulist', icon: 'icon-menu', isShow: false, tab: '菜单'},
          {style: 'bar left', link: '/admin/usermanage', icon: 'icon-users', isShow: false, tab: '成员'},
          {style: 'bar left', link: '/admin/shop', icon: 'icon-cart', isShow: true, tab: '购物车'},
          {style: 'bar left', link: '/admin/mine', icon: 'icon-home', isShow: false, tab: '我的'},
        ]
      } else {
        this.menuArr = [
          {style: 'box left', link: '/general/menulist', icon: 'icon-menu', isShow: false, tab: '菜单'},
          {style: 'box left', link: '/general/shop', icon: 'icon-cart', isShow: true, tab: '购物车'},
          {style: 'box left', link: '/general/mine', icon: 'icon-home', isShow: false, tab: '我的'},
        ]
      }
    }
  },
  mounted () {
    setTimeout(() => {
      this.$http.get(this.resource + '/api/shop/findall', {params: {uid: this.user.id}}).then(res => {
        let num = 0
        res.data.forEach((item) => {
          num += item.total
        })
        this.$store.dispatch('getshopNum', num)
      })
      
    }, 500)
  }
}
</script>

<style>
  .shop-ball {
    display: block; 
    position: absolute; 
    top: -5px; 
    right: 30%; 
    width: 25px; 
    height: 25px; 
    line-height: 25px; 
    border-radius: 50%; 
    background-color: #FF4949; 
    color: #fff; 
    font-size: 0.7em;
  }
</style>
