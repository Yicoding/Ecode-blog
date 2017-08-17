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
    		    <router-link to="/root/order/unorder" class="tab">待确认</router-link>
    		  </div>
    		  <div class="child-div" @click="getOrder"><router-link to="/root/order/sign" class="tab">已确认</router-link></div>
    		  <div class="child-div" @click="getOrder"><router-link to="/root/order/past" class="tab">历史订单</router-link></div>
    		</el-popover>
    		<a class="tab" :class="order?'active':''"><span class="icon-books"></span><br/>订单管理</a>
    	</div>
    	<div class="bar left" v-popover:popover2>
    		<el-popover
    		  ref="popover2"
    		  placement="top"
    		  width="90"
    		  trigger="click" v-model="modalSystem">
    		  <div class="child-div" @click="getSystem">
    		    <router-link to="/root/system/user" class="tab">员工管理</router-link>
    		  </div>
    		  <div class="child-div" @click="getSystem"><router-link to="/root/system/part" class="tab">部门管理</router-link></div>
    		  <div class="child-div" @click="getSystem"><router-link to="/root/system/role" class="tab">角色管理</router-link></div>
    		</el-popover>
    		<a class="tab" :class="system?'active':''"><span class="icon-cog"></span><br/>系统管理</a>
    	</div>
    	<div class="bar left">
    		<router-link to="/mine" class="tab"><span class="icon-home"></span><br/>我的</router-link>
    	</div>
    </footer>
  </div>
</template>

<script>
export default {
  data () {
  	return {
  		modalOrder: false,
  		modalSystem: false,
  	}
  },
  computed: {
  	order: {
      get () {
        if (this.$route.path == '/root/order/unorder' || this.$route.path == '/root/order/sign' || this.$route.path == '/root/order/past') {
          return true
        } else {
          return false
        }
      },
      set (newValue) {

      }
    },
    system: {
      get () {
        if (this.$route.path == '/root/system/user' || this.$route.path == '/root/system/part' || this.$route.path == '/root/system/role') {
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
