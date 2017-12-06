<template>
  <div>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
    <footer>
    	<div class="box left">
    		<router-link to="/general/menu" class="tab"><span class="icon-menu"></span><br/>菜单</router-link>
    	</div>
      <div class="box left">
        <router-link to="/general/shop" class="tab"><span class="icon-cart"></span><br/>购物车</router-link>
      </div>
    	<div class="box left">
    		<router-link to="/general/mine" class="tab"><span class="icon-home"></span><br/>我的</router-link>
    	</div>
    </footer>
  </div>
</template>

<script>
export default {
  data () {
  	return {
  		
  	}
  },
  methods: {
  	
  }
}
</script>

<style>

</style>
