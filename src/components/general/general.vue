<template>
  <div>
    <router-view></router-view>
    <footer>
    	<div class="bar left">
    		<router-link to="/general/today" class="tab"><span class="icon-home"></span><br/>今日订单</router-link>
    	</div>
    	<div class="bar left">
    		<router-link to="/general/pastorder" class="tab"><span class="icon-home"></span><br/>历史订单</router-link>
    	</div>
    	<div class="bar left">
    		<router-link to="/general/mine" class="tab"><span class="icon-home"></span><br/>个人信息</router-link>
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
