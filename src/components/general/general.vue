<template>
  <div>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
    <footer>
    	<div class="box left">
    		<router-link to="/general/menulist" class="tab"><span class="icon-menu"></span><br/>菜单</router-link>
    	</div>
      <div class="box left" style="position: relative;">
        <router-link to="/general/shop" class="tab"><span class="icon-cart"></span><br/>购物车</router-link>
        <span v-show="shopNum > 0" style="display: block; position: absolute; top: -5px; right: 22%; width: 25px; height: 25px; line-height: 25px; border-radius: 50%; background-color: #FF4949; color: #fff; font-size: 0.7em;">{{shopNum}}</span>
      </div>
    	<div class="box left">
    		<router-link to="/general/mine" class="tab"><span class="icon-home"></span><br/>我的</router-link>
    	</div>
    </footer>
  </div>
</template>

<script>
export default {
  computed: {
    shopNum () {
      return this.$store.state.shopNum
    },
    user () {
      return this.$store.state.user
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

</style>
