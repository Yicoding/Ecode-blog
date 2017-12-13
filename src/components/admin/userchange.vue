<template>
  <div>
    <mt-field label="姓名" placeholder="请输入姓名" v-model="user.name"></mt-field>
    <mt-field label="年龄" placeholder="请输入年龄" v-model="user.age" type="number"></mt-field>
    <mt-field label="密码" placeholder="请输入密码" v-model="user.password" type="password"></mt-field>
    <mt-button @click.native="send" size="large" type="primary">保存</mt-button>
    <br/>
    <mt-button size="large" @click="back" type="primary" plain>取消</mt-button>
  </div>
</template>

<script>
export default {
  computed: {
  	info () {
  		return this.$store.state.user
  	}
  },
  data () {
    return {
      user: {
      	id: '',
      	name: '',
      	age: '',
      	password: '',
      	role_id: '',
      	part_id: '' 
      },
      method: '',
    }
  },
  activated () {
  	if (this.$route.query.id) {
    	this.method = 'put'
    	this.$http.get(this.resource + '/api/user/findone', {params: {id: this.$route.query.id}}).then((res) => {
    		console.log(JSON.stringify(res.data))
	        this.user = res.data
  		})
    } else {
    	this.method = 'post'
	}
  },
  methods: {
  	send () {
  		if (this.method == 'post') {
  			var rid = this.info.role.id
  			this.user.role_id = rid
  			var pid = this.info.part.id
  			this.user.part_id = pid
  			this.$http.post(this.resource + '/api/user/adminadd', this.user).then(res => {
		        console.log(JSON.stringify(res.data))
		        if (res.data.code == 500) {
		        	this.$message({
			          showClose: true,
			          message: res.data.message,
			          type: 'error'
			        });
		        } else {
		        	this.$router.push('/admin/usermanage')
		        }
    		})
  		} else {
  			this.$http.put(this.resource + '/api/user/adminput', this.user).then(res => {
		        console.log(JSON.stringify(res.data))
		        if (res.data.code == 500) {
		        	this.$message({
			          showClose: true,
			          message: res.data.message,
			          type: 'error'
			        });
		        } else {
			        this.$router.push('/admin/usermanage')
		        }
  			})
  		}
  	},
    back () {
      this.$router.push('/admin/usermanage')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
