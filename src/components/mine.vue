<template>
  <div>
  	I am mine
  </div>
</template>

<script>
export default {
  data () {
  	return {
  		user: {}
  	}
  },
  computed: {
    loginname () {
      return this.$store.state.user.name
    }
  },
  mounted () {
  	this.$http.get('/api/user/loginname', {params: {name: this.loginname}}).then((res) => {
  		console.log(JSON.stringify(res.data))

  	})
  },
}
</script>

<style>

</style>
