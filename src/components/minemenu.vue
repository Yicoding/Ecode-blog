<template>
  <div style="background: #eee;">
  	<div style="height: 10px;"></div>
    <!-- 系统管理员 -->
    <div v-if="user.role && user.role.name == 'root'">
     <mt-cell title="个人信息" is-link to="/root/mine/mineinfo"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="用户意见" is-link to="/root/mine/useroption"></mt-cell>
     <div style="height: 5px;"></div>
  	 <mt-cell title="个性签" is-link to="/root/mine/sign"></mt-cell>
    </div>
    <!-- 部门管理员 -->
    <div v-if="user.role && user.role.name == 'admin'">
     <mt-cell title="个人信息" is-link to="/admin/mine/mineinfo"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的收藏" is-link to="/admin/mine/collect"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的订单" is-link to="/admin/mine/mineorderlist"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的评价" is-link to="/admin/mine/minerate"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="意见反馈" is-link to="/admin/mine/useroption"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="个性签" is-link to="/admin/mine/sign"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的积分">120</mt-cell>
    </div>
    <!-- 普通员工 -->
    <div v-if="user.role && user.role.name == 'general'">
     <mt-cell title="个人信息" is-link to="/general/mine/mineinfo"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的收藏" is-link to="/general/mine/collect"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的订单" is-link to="/general/mine/mineorderlist"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的评价" is-link to="/general/mine/minerate"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="意见反馈" is-link to="/general/mine/useroption"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="个性签" is-link to="/general/mine/sign"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的积分">350</mt-cell>
    </div>
    <mt-button type="danger" size="large" @click.native="logout" style="position: fixed; bottom: 42px; height: 55px;">退出账号</mt-button>
    <div></div>
  </div>
</template>

<script>
export default {
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
  	console.log(JSON.stringify(this.user))
  },
  methods: {
    logout () {
      this.$http.get(this.resource + '/api/loginfo/logout', {params: {name: this.loginname}}).then((res) => {
        this.$message({
          showClose: true,
          message: '退出成功，下次再见呦',
          type: 'success'
        });
        window.sessionStorage.clear()
        this.$store.dispatch('getUser', '')
        this.$router.push('/login')
      })
    },
  }
}
</script>

<style>

</style>
