<template>
  <div>
    <header>
    	欢迎来到登录界面
    </header>
    <section>
    	<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    	  <el-form-item label="用户名" prop="name">
    	    <el-input v-model="ruleForm.name"></el-input>
    	  </el-form-item>
    	  <el-form-item label="密码" prop="password">
    	    <el-input type="password" v-model="ruleForm.password" auto-complete="off"></el-input>
    	  </el-form-item>
    	  <el-form-item>
    	    <el-button type="primary" @click="submitForm('ruleForm')">确定</el-button>
    	    <el-button @click="resetForm('ruleForm')">重置</el-button>
    	  </el-form-item>
		  <el-form-item label="还没有账号？">
	  	  	<el-button type="text" @click="register">点我注册</el-button>
	  	  </el-form-item>
    	</el-form>
    </section>
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
            		this.$store.dispatch('getUser', this.ruleForm.name)
	            	this.$message({
			          showClose: true,
			          message: '恭喜你，登录成功！欢迎来到home',
			          type: 'success'
			        });
			        setTimeout(() => {
		        		this.$router.push('/home')
			        },500)
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
