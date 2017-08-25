<template>
  <div>
    <router-view></router-view>
    <footer>
    	<div class="bar left" v-popover:popover1>
    		<el-popover
    		  ref="popover1"
    		  placement="top"
    		  width="90"
    		  trigger="click" v-model="modalOrder">
    		  <div class="child-div" @click="getOrder">
    		    <router-link to="/admin/myorder/today" class="tab">今日订单</router-link>
    		  </div>
    		  <div class="child-div" @click="getOrder"><router-link to="/admin/myorder/pastorder" class="tab">历史订单</router-link></div>
    		</el-popover>
    		<a class="tab" :class="order?'active':''"><span class="icon-books"></span><br/>我的订单</a>
    	</div>
    	<div class="bar left">
    		<router-link to="/admin/usermanage" class="tab"><span class="icon-home"></span><br/>成员管理</router-link>
    	</div>
    	<div class="bar left">
    		<router-link to="/admin/mine" class="tab"><span class="icon-home"></span><br/>个人信息</router-link>
    	</div>
    </footer>
  </div>
</template>

<script>
export default {
  data () {
  	return {
  		modalOrder: false,
  	}
  },
  computed: {
  	order: {
      get () {
        if (this.$route.path == '/admin/myorder/today' || this.$route.path == '/admin/myorder/pastorder') {
          return true
        } else {
          return false
        }
      },
      set (newValue) {

      }
    },
  },
  methods: {
  	getOrder () {
      this.modalOrder = false
    },
    getSystem () {
    	this.modalSystem = false
    }
  }
}
</script>

<style>

</style>
