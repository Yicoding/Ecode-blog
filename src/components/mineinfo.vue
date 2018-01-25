<template>
  <div>
    <div style="padding: 5px 10px;">
      <el-button size="small" icon="arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
      <el-button size="small" class="right" @click="goEdit">编辑</el-button>
    </div>
  	<mt-header title="我的资料卡"></mt-header>
    <div class="user-img">
      <img v-if="user.avatar" v-lazy="user.avatar" alt=""/>
      <img v-if="!user.avatar" v-lazy="avatar" alt=""/>
    </div>
    <div class="div-title">个性签名</div>
    <div class="div-content" v-if="user.minesign" v-text="user.minesign"></div>
    <div class="div-content" v-if="!user.minesign" v-text="minesign"></div>
    <div class="div-title">基础资料</div>
    <mt-cell v-if="user" title="用户名" :value="user.name"></mt-cell>
    <mt-cell v-if="user" title="年龄" :value="user.age"></mt-cell>
    <mt-cell v-if="user.role" title="角色" :value="user.role.fullname"></mt-cell>
    <mt-cell v-if="user.part" title="部门" :value="user.part.name"></mt-cell>
    <div class="split"></div>
    <mt-cell title="艺术签"></mt-cell>
    <div>
      <img style="width: 100%; height: 200px;" v-if="user.artsign" v-lazy="user.artsign"/>
    </div>
  </div>
</template>

<script>
export default {
  data () {
  	return {
      avatar: 'static/user/defaultimg.jpg',
      minesign: '叶子的离去是风的追求还是树的不挽留',
  	}
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
    setTimeout(() => {
      console.log(this.user)
    }, 500)
  },
  methods: {
    goEdit () {
      this.$router.push('/edituser')
    },
    logout () {
      this.$http.get(this.resource + '/api/loginfo/logout', {params: {name: this.loginname}}).then((res) => {
        this.$message({
          showClose: true,
          message: '退出成功，下次再见呦',
          type: 'success'
        });
        window.sessionStorage.clear()
        setTimeout(() => {
          this.$store.dispatch('getUser', '')
          this.$router.push('/login')
        }, 1000)
      })
    },
  }
}
</script>

<style>

</style>
