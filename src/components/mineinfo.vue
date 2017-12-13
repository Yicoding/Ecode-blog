<template>
  <div>
    <div style="padding: 5px 10px;">
      <el-button size="small" icon="arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
      <el-button size="small" class="right" @click="goEdit">编辑</el-button>
    </div>
  	<mt-header title="我的资料卡"></mt-header>
    <div class="user-img">
      <img v-if="user.avatar" :src="user.avatar" alt=""/>
      <img v-if="!user.avatar" :src="avatar" alt=""/>
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
      <img style="width: 100%;" v-if="user.artsign" :src="user.artsign"/>
      <img style="width: 100%;" v-if="!user.artsign" :src="artsign"/>
    </div>
  </div>
</template>

<script>
export default {
  data () {
  	return {
      avatar: 'static/user/defaultimg.jpg',
      minesign: '叶子的离去是风的追求还是树的不挽留',
      artsign: 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2aWV3Qm94PSIwIDAgMzc0Ljk5OTk5NDQxMjA2NDYgMjk5Ljk5OTk5NTUyOTY1MTciIHdpZHRoPSIzNzQuOTk5OTk0NDEyMDY0NiIgaGVpZ2h0PSIyOTkuOTk5OTk1NTI5NjUxNyI+PHBhdGggZD0iTSA4OC4wMDAsMTAzLjAyNSBDIDkyLjQwMCwxMDAuNjI1IDkyLjcwOSwxMDEuMDM4IDk2LjgwMCw5OC4yMjUiIHN0cm9rZS13aWR0aD0iNS4xOTYiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDk2LjgwMCw5OC4yMjUgQyA5OS4xMDksOTYuNjM4IDk4LjQwOSw5NS41MTcgMTAwLjgwMCw5NC4yMjUiIHN0cm9rZS13aWR0aD0iNC40NzIiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDEwMC44MDAsOTQuMjI1IEMgMTAzLjM0Myw5Mi44NTEgMTAzLjg1NCw5My44OTYgMTA2LjY2Niw5Mi44OTEiIHN0cm9rZS13aWR0aD0iNC4yNDUiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDEwNi42NjYsOTIuODkxIEMgMTA5LjQ1NCw5MS44OTYgMTA5LjIwOSw5MS4yNDAgMTEyLjAwMCw5MC4yMjUiIHN0cm9rZS13aWR0aD0iNC4yMzEiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDExMi4wMDAsOTAuMjI1IEMgMTE2LjU0Myw4OC41NzMgMTE2LjU3Miw4OC4zMjAgMTIxLjMzNCw4Ny41NTkiIHN0cm9rZS13aWR0aD0iMy43NTQiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDEyMS4zMzQsODcuNTU5IEMgMTI2LjU3Miw4Ni43MjAgMTI2LjY4MCw4Ny40NDEgMTMyLjAwMCw4Ny4wMjUiIHN0cm9rZS13aWR0aD0iMy41OTUiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDEzMi4wMDAsODcuMDI1IEMgMTM1LjIxMyw4Ni43NzQgMTM1LjIxNyw4Ni43MzQgMTM4LjQwMCw4Ni4yMjUiIHN0cm9rZS13aWR0aD0iMy45NjAiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDEzOC40MDAsODYuMjI1IEMgMTQxLjg4NCw4NS42NjcgMTQxLjkwMCw4NS42OTkgMTQ1LjMzNCw4NC44OTEiIHN0cm9rZS13aWR0aD0iMy45NzAiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE0NS4zMzQsODQuODkxIEMgMTQ4LjcwMCw4NC4wOTkgMTQ4LjYxOCw4My40MDEgMTUyLjAwMCw4My4wMjUiIHN0cm9rZS13aWR0aD0iNC40NjYiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE1Mi4wMDAsODMuMDI1IEMgMTU0LjYxOCw4Mi43MzQgMTU0LjcwMSw4My4wOTggMTU3LjMzNCw4My41NTkiIHN0cm9rZS13aWR0aD0iNS4wNTEiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE1Ny4zMzQsODMuNTU5IEMgMTYwLjAzNCw4NC4wMzEgMTYwLjA1OSw4NC4wNDQgMTYyLjY2Niw4NC44OTEiIHN0cm9rZS13aWR0aD0iNS4xNTMiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE2Mi42NjYsODQuODkxIEMgMTY1LjM5Miw4NS43NzcgMTY1LjQ3Miw4NS42OTQgMTY4LjAwMCw4Ny4wMjUiIHN0cm9rZS13aWR0aD0iNC45NzUiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDIwNC4wMDAsOTEuMDI1IEMgMjEwLjAwMCw4OS4wMjUgMjA5Ljg3Nyw4OC40MzggMjE2LjAwMCw4Ny4wMjUiIHN0cm9rZS13aWR0aD0iNS4xMTYiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDIxNi4wMDAsODcuMDI1IEMgMjIwLjI3Nyw4Ni4wMzggMjIwLjQwMSw4Ni42MzkgMjI0LjgwMCw4Ni4yMjUiIHN0cm9rZS13aWR0aD0iNC42NjIiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDIyNC44MDAsODYuMjI1IEMgMjMxLjczNSw4NS41NzIgMjMxLjcyMyw4NS4zNDIgMjM4LjY2Niw4NC44OTEiIHN0cm9rZS13aWR0aD0iNC40NzUiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDIzOC42NjYsODQuODkxIEMgMjQxLjk5MCw4NC42NzYgMjQyLjAyMSw4NC42MTEgMjQ1LjMzNCw4NC44OTEiIHN0cm9rZS13aWR0aD0iNC4xNjIiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI0NS4zMzQsODQuODkxIEMgMjQ5Ljg4Nyw4NS4yNzcgMjQ5Ljg0NCw4NS44NjkgMjU0LjQwMCw4Ni4yMjUiIHN0cm9rZS13aWR0aD0iMy43OTMiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI1NC40MDAsODYuMjI1IEMgMjU4LjM3Nyw4Ni41MzYgMjU4LjQwMCw4Ni4yMjUgMjYyLjQwMCw4Ni4yMjUiIHN0cm9rZS13aWR0aD0iMy44MTUiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI2Mi40MDAsODYuMjI1IEMgMjY2LjQwMCw4Ni4yMjUgMjY2LjQxNyw4NS45OTEgMjcwLjQwMCw4Ni4yMjUiIHN0cm9rZS13aWR0aD0iNC4yODciIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI3MC40MDAsODYuMjI1IEMgMjczLjIxNyw4Ni4zOTEgMjczLjI2NSw4Ni4zNTggMjc2LjAwMCw4Ny4wMjUiIHN0cm9rZS13aWR0aD0iNC44MDkiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI3Ni4wMDAsODcuMDI1IEMgMjc4LjczMiw4Ny42OTEgMjc4LjY1OSw4Ny45ODIgMjgxLjMzNCw4OC44OTEiIHN0cm9rZS13aWR0aD0iNC4zODIiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI4MS4zMzQsODguODkxIEMgMjg1LjMyNSw5MC4yNDkgMjg1LjI5OCw5MC4zNDggMjg5LjMzNCw5MS41NTkiIHN0cm9rZS13aWR0aD0iNC40NjkiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDI4OS4zMzQsOTEuNTU5IEMgMjkxLjk2NCw5Mi4zNDggMjkyLjU5MSw5MS4zNjUgMjk0LjY2Niw5Mi44OTEiIHN0cm9rZS13aWR0aD0iNC45NjMiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE0OS4zMzQsMjAwLjg5MSBDIDE1NS4wNjcsMjAxLjU1OCAxNTUuMDY2LDIwMS41NzAgMTYwLjgwMCwyMDIuMjI1IiBzdHJva2Utd2lkdGg9IjUuMzQxIiBzdHJva2U9InJnYigwLCAwLCAwKSIgZmlsbD0ibm9uZSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIj48L3BhdGg+PHBhdGggZD0iTSAxNjAuODAwLDIwMi4yMjUgQyAxNjQuMzk5LDIwMi42MzYgMTY0LjQ1NSwyMDIuMzQzIDE2OC4wMDAsMjAzLjAyNSIgc3Ryb2tlLXdpZHRoPSI0LjIyMCIgc3Ryb2tlPSJyZ2IoMCwgMCwgMCkiIGZpbGw9Im5vbmUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCI+PC9wYXRoPjxwYXRoIGQ9Ik0gMTY4LjAwMCwyMDMuMDI1IEMgMTcxLjM4OCwyMDMuNjc2IDE3MS4yNzksMjA0LjIxNCAxNzQuNjY2LDIwNC44OTEiIHN0cm9rZS13aWR0aD0iNC4xMDkiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE3NC42NjYsMjA0Ljg5MSBDIDE3OS4yNzksMjA1LjgxNCAxNzkuMzUyLDIwNS40NTAgMTg0LjAwMCwyMDYuMjI1IiBzdHJva2Utd2lkdGg9IjMuODA3IiBzdHJva2U9InJnYigwLCAwLCAwKSIgZmlsbD0ibm9uZSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIj48L3BhdGg+PHBhdGggZD0iTSAxODQuMDAwLDIwNi4yMjUgQyAxODcuMzUyLDIwNi43ODQgMTg3LjMxMiwyMDcuMzM1IDE5MC42NjYsMjA3LjU1OSIgc3Ryb2tlLXdpZHRoPSI0LjM4NCIgc3Ryb2tlPSJyZ2IoMCwgMCwgMCkiIGZpbGw9Im5vbmUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCI+PC9wYXRoPjxwYXRoIGQ9Ik0gMTkwLjY2NiwyMDcuNTU5IEMgMTkzLjMxMiwyMDcuNzM1IDE5My4zMzEsMjA3LjAyNSAxOTYuMDAwLDIwNy4wMjUiIHN0cm9rZS13aWR0aD0iNC43MTgiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDE5Ni4wMDAsMjA3LjAyNSBDIDE5OS4zMzEsMjA3LjAyNSAxOTkuNDUyLDIwOC4wNzMgMjAyLjY2NiwyMDcuNTU5IiBzdHJva2Utd2lkdGg9IjQuODg2IiBzdHJva2U9InJnYigwLCAwLCAwKSIgZmlsbD0ibm9uZSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIj48L3BhdGg+PHBhdGggZD0iTSAyMDIuNjY2LDIwNy41NTkgQyAyMDYuMTE4LDIwNy4wMDYgMjA1LjkzNSwyMDYuMDI0IDIwOS4zMzQsMjA0Ljg5MSIgc3Ryb2tlLXdpZHRoPSI0LjcxNCIgc3Ryb2tlPSJyZ2IoMCwgMCwgMCkiIGZpbGw9Im5vbmUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCI+PC9wYXRoPjxwYXRoIGQ9Ik0gMjA5LjMzNCwyMDQuODkxIEMgMjExLjkzNSwyMDQuMDI0IDIxMi4wMDAsMjA0LjIyNSAyMTQuNjY2LDIwMy41NTkiIHN0cm9rZS13aWR0aD0iNC43NzQiIHN0cm9rZT0icmdiKDAsIDAsIDApIiBmaWxsPSJub25lIiBzdHJva2UtbGluZWNhcD0icm91bmQiPjwvcGF0aD48cGF0aCBkPSJNIDIxNC42NjYsMjAzLjU1OSBDIDIxNy4zMzMsMjAyLjg5MiAyMTcuNTg0LDIwMy4zOTggMjIwLjAwMCwyMDIuMjI1IiBzdHJva2Utd2lkdGg9IjQuOTg5IiBzdHJva2U9InJnYigwLCAwLCAwKSIgZmlsbD0ibm9uZSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIj48L3BhdGg+PC9zdmc+',
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
