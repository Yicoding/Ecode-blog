<template>
  <div>
    <div class="bar left">
      <router-link to="/root/order" class="tab"><span class="icon-menu"></span><br/>订单</router-link>
    </div>
    <div class="bar left">
      <router-link to="/root/system/menu" class="tab"><span class="icon-menu"></span><br/>菜单</router-link>
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
      <a class="tab" :class="system?'active':''"><span class="icon-cog"></span><br/>系统</a>
    </div>
    <div class="bar left">
      <router-link to="/root/mine" class="tab"><span class="icon-home"></span><br/>我的</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      modalSystem: false,
    }
  },
  computed: {
    system() {
      if (this.$route.path == '/root/system/user' || this.$route.path == '/root/system/part' || this.$route.path == '/root/system/role') {
        return true
      } else {
        return false
      }
    },
  },
  methods: {
    getSystem () {
      this.modalSystem = false
    }
  }
}
</script>

<style>

</style>
