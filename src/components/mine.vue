<template>
  <div>
  	<mt-header title="我的资料卡"></mt-header>
    <div class="div-title">个性签名</div>
    <div class="div-content" v-text="minesign"></div>
    <div class="div-title">基础资料</div>
    <mt-cell v-if="user" title="用户名" :value="user.name"></mt-cell>
    <mt-cell v-if="user" title="年龄" :value="user.age"></mt-cell>
    <mt-cell v-if="user.role" title="角色" :value="user.role.fullname"></mt-cell>
    <mt-cell v-if="user.part" title="部门" :value="user.part.name"></mt-cell>
    <mt-button type="danger" size="large" @click.native="logout">退出账号</mt-button>
    <div></div>
  </div>
</template>

<script>
export default {
  data () {
  	return {
      minesign: '叶子的离去是风的追求还是树的不挽留',
  	}
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  methods: {
    logout () {
      this.$http.get('/api/loginfo/logout', {params: {name: this.loginname}}).then((res) => {
        this.$message({
          showClose: true,
          message: '退出成功，下次再见呦',
          type: 'success'
        });
        window.sessionStorage.clear()
        setTimeout(() => {
          this.$store.dispatch('getUser', '')
          window.location.href = '/login'
        }, 1000)
      })
    },
  }
}
</script>

<style>

</style>
