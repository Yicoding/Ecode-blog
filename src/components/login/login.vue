<template>
  <div>
    <div style="height: 20px;"></div>
    <div style="width: 180px; margin:auto;">
      <img src="static/img/login.gif" style="max-width: 100%; height: 180px; border-radius: 50%;"/>
    </div>
    <div style="padding: 20px;">
    	<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px">
    	  <el-form-item label="用户名" prop="name">
    	    <el-input v-model="ruleForm.name" style="width: 80%"></el-input>
    	  </el-form-item>
    	  <el-form-item label="密码" prop="password">
    	    <el-input type="password" v-model="ruleForm.password" style="width: 80%"></el-input>
    	  </el-form-item>
    	  <el-form-item>
    	    <el-button type="primary" @click="submitForm('ruleForm')">确定</el-button>
    	    <el-button @click="resetForm('ruleForm')">重置</el-button>
    	  </el-form-item>
		    <el-form-item label="还没有账号？">
	  	  	<el-button type="text" @click="register">点我注册</el-button>
	  	  </el-form-item>
    	</el-form>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        ruleForm: {
          name: '',
          password: ''
        },
        rules: {
          name: [
            { required: true, message: '请输入用户名', trigger: 'blur' }
          ],
          password: [
          	{ required: true, message: '请输入密码', trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.get(this.resource + '/api/user/findByName', {params: {name: this.ruleForm.name, password: this.ruleForm.password}}).then((res) => {
            	console.log(res.data)
            	if (res.data.code == 200) {
                window.sessionStorage.setItem('uname', this.ruleForm.name)
	            	this.$message({
  			          showClose: true,
  			          message: '恭喜你，登录成功！欢迎来到home',
  			          type: 'success'
  			        });
                this.$http.get(this.resource + '/api/user/loginfo', {params: {name: this.ruleForm.name}}).then((res) => {
                  this.$store.dispatch('getUser', res.data)
                  if (res.data.role.name == 'root') {
                    this.$router.push('/root/mine')
                  } else if (res.data.role.name == 'admin') {
                    this.$router.push('/admin/mine')
                  } else if (res.data.role.name == 'general') {
                    this.$router.push('/general/mine')
                  }
                })
            	} else if (res.data.code == 500) {
            		this.$message({
  			          showClose: true,
  			          message: res.data.message,
  			          type: 'error'
  			        });
            	}
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      register () {
      	this.$router.push('/registered')
      }
    }
  }
</script>

<style>
	
</style>
