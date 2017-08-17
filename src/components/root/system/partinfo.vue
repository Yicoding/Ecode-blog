<template>
  <div>
    <mt-field label="部门" placeholder="请输入部门名" v-model="part.name"></mt-field>
    <mt-field v-if="method == 'post'" label="管理员用户名" placeholder="请输入管理员用户名" v-model="part.admin"></mt-field>
    <mt-field v-if="method == 'post'" label="管理员年龄" placeholder="请输入年龄" v-model="part.age"></mt-field>
    <mt-popup v-if="method == 'put'" v-model="popuptype" position="bottom" class="mint-popup-4">
      <mt-picker :slots="typeSlot" @change="ontypetChange" :visible-item-count="5" value-key="text"></mt-picker>
    </mt-popup>
    <mt-cell title="管理员" v-if="method == 'put'">
      <el-button type="text" @click.native="popuptype = true" style="width: 200px;">{{part.newadmin}}</el-button>
    </mt-cell>
    <mt-button @click.native="send" size="large" type="primary">保存</mt-button>
    <br/>
    <mt-button size="large" @click="back" type="primary" plain>取消</mt-button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      part: {
      	id: '',
        name: '',
        admin: '',
        age: '',
      	newadmin: '',
      },
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
  created () {

  },
  mounted () {
  	if (this.$route.query.id) {
    	this.method = 'put'
    	this.$http.get('/api/part/findone', {params: {id: this.$route.query.id}}).then((res) => {
    		console.log(JSON.stringify(res.data))
	        this.part.id = res.data.id
	        this.part.name = res.data.name
	        this.part.admin = res.data.admin
	        this.part.newadmin = res.data.admin
	  		this.$http.get('/api/part/' + this.$route.query.id + '/users').then((response) => {
	  			console.log(JSON.stringify(response.data))
	  			for (var k = 0; k < response.data.length; k ++) {
	  				this.typeSlot[0].values.push({id: response.data[k].id, text: response.data[k].name})
	  				if (res.data.admin == response.data[k].name) {
	  					this.typeSlot[0].defaultIndex = k
	  				}
	  			}
	  		})
  		})
    } else {
    	this.method = 'post'
    }
  },
  methods: {
  	send () {
  		if (this.method == 'post') {
  			this.$http.post('/api/part/add', this.part).then(res => {
		        console.log(JSON.stringify(res.data))
		        if (res.data.code == 500) {
		        	this.$message({
			          showClose: true,
			          message: res.data.message,
			          type: 'error'
			        });
		        } else {
			        this.$router.push('/root/system/part')
		        }
    		})
  		} else {
  			this.$http.put('/api/part/put', this.part).then(res => {
	        console.log(JSON.stringify(res.data))
	        this.$router.push('/root/system/part')
  			})
  		}
  	},
    back () {
      this.$router.push('/root/system/part')
    },
    ontypetChange (picker, values) {
      if (values[0] != null) {
        console.log(values[0].id)
        this.part.newadmin = values[0].text
      }
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
