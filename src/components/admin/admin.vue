<template>
  <div>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
    <footer>
      <div class="bar left">
        <router-link to="/admin/menu" class="tab"><span class="icon-menu"></span><br/>菜单</router-link>
      </div>
      <div class="bar left">
        <router-link to="/admin/usermanage" class="tab"><span class="icon-users"></span><br/>成员</router-link>
      </div>
      <div class="bar left">
        <router-link to="/admin/shop" class="tab"><span class="icon-home"></span><br/>购物车</router-link>
      </div>
    	<div class="bar left">
    		<router-link to="/admin/mine" class="tab"><span class="icon-home"></span><br/>我的</router-link>
    	</div>
    </footer>
  </div>
</template>

<script>
export default {}
</script>

<style>

</style>
