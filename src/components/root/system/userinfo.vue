<template>
  <div>
    <mt-field label="姓名" placeholder="请输入姓名" v-model="user.name"></mt-field>
    <mt-field label="年龄" placeholder="请输入年龄" v-model="user.age" type="number"></mt-field>
    <mt-field label="密码" placeholder="请输入密码" v-model="user.password" type="password"></mt-field>
    <mt-popup v-model="popuptype" position="bottom" class="mint-popup-4">
      <mt-picker :slots="typeSlot" @change="ontypetChange" :visible-item-count="5" value-key="name"></mt-picker>
    </mt-popup>
    <mt-cell title="部门" v-if="user.role_id == 3">
      <el-button type="text" @click.native="popuptype = true" style="width: 200px;">{{partName}}</el-button>
    </mt-cell>
    <mt-button @click.native="send" size="large" type="primary">保存</mt-button>
    <br/>
    <mt-button size="large" @click="back" type="primary" plain>取消</mt-button>
  </div>
</template>

<script>
export default {
  created () {
    
  },
  data () {
    return {
      user: {
      	id: '',
      	name: '',
      	age: '',
      	password: '',
      	role_id: 3,
      	part_id: null,
      },
      partName: '',
      method: '',
      typeSlot: [{
        flex: 1,
        defaultIndex: 0,
        values: [],
        className: 'slot1',
      }],
      popuptype: false,
    }
  },
  mounted () {
  	if (this.$route.query.id) {
    	this.method = 'put'
    	this.$http.get('/api/user/findone', {params: {id: this.$route.query.id}}).then((res) => {
    		console.log(JSON.stringify(res.data))
	        this.user = res.data
	        this.$http.get('/api/part/findall').then((response) => {
		  		for (var k = 0; k < response.data.length; k ++) {
		  			this.typeSlot[0].values.push({id: response.data[k].id, name: response.data[k].name})
		  			if (res.data.part_id == response.data[k].id) {
						this.typeSlot[0].defaultIndex = k
					}
		  		}
		  	})
  		})
    } else {
    	this.method = 'post'
    	this.$http.get('/api/part/findall').then((response) => {
    		this.typeSlot[0].values.push({id: 0, name: '请选择'})
    		for (var k = 0; k < response.data.length; k ++) {
	  			this.typeSlot[0].values.push({id: response.data[k].id, name: response.data[k].name})
	  		}
	  	})
	}
  },
  methods: {
  	send () {
  		if (this.method == 'post') {
  			this.$http.post('/api/user/rootadd', this.user).then(res => {
		        console.log(JSON.stringify(res.data))
		        if (res.data.code == 500) {
		        	this.$message({
			          showClose: true,
			          message: res.data.message,
			          type: 'error'
			        });
		        } else {
		        	this.$router.push('/root/system/user')
		        }
    		})
  		} else {
  			this.$http.put('/api/user/rootput', this.user).then(res => {
		        console.log(JSON.stringify(res.data))
		        if (res.data.code == 500) {
		        	this.$message({
			          showClose: true,
			          message: res.data.message,
			          type: 'error'
			        });
		        } else {
			        this.$router.push('/root/system/user')
		        }
  			})
  		}
  	},
  	ontypetChange (picker, values) {
      if (values[0] != null) {
        console.log(values[0].id)
        this.partName = values[0].name
        this.user.part_id = values[0].id
      }
    },
    back () {
      this.$router.push('/root/system/user')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
