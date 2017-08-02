<template>
  <div>
    <header>
    	欢迎来到注册界面
    </header>
    <section>
    	<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    	  <el-form-item label="用户名" prop="name">
    	    <el-input v-model.number="ruleForm.name"></el-input>
    	  </el-form-item>
    	  <el-form-item label="年龄" prop="age">
    	    <el-input v-model.number="ruleForm.age"></el-input>
    	  </el-form-item>
    	  <el-form-item label="密码" prop="password">
    	    <el-input type="password" v-model="ruleForm.password" auto-complete="off"></el-input>
    	  </el-form-item>
    	  <el-form-item label="确认密码" prop="checkPass">
    	    <el-input type="password" v-model="ruleForm.checkPass" auto-complete="off"></el-input>
    	  </el-form-item>
    	  <el-form-item>
    	    <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
    	    <el-button @click="resetForm('ruleForm')">重置</el-button>
    	    <el-button @click="cancel" type="warning">取消</el-button>
    	  </el-form-item>
    	</el-form>
    </section>
  </div>
</template>

<script>
  export default {
    data() {
      var checkAge = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('年龄不能为空'));
        }
        setTimeout(() => {
          if (!Number.isInteger(value)) {
            callback(new Error('请输入数字值'));
          } else {
            if (value < 18) {
              callback(new Error('必须年满18岁'));
            } else {
              callback();
            }
          }
        }, 1000);
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm.checkPass !== '') {
            this.$refs.ruleForm.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        ruleForm: {
          name: '',
          age: '',
          password: '',
          checkPass: '',
          role_id: 3
        },
        rules: {
          name: [
            { required: true, message: '请输入用户名', trigger: 'blur' }
          ],
          password: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          age: [
            { validator: checkAge, trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.post('/api/user/add', this.ruleForm).then((res) => {
            	console.log(JSON.stringify(res.data))
            	this.$message({
		          showClose: true,
		          message: '恭喜你，注册成功，3秒后自动跳转到登录界面',
		          type: 'success'
		        });
		        setTimeout(() => {
		        	this.$router.push('/login')
		        }, 3000)
            }).catch((err) => {
            	this.$message({
		          showClose: true,
		          message: '用户名已存在，请取一个独一无二的个性名称',
		          type: 'error'
		        });
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
      cancel () {
      	this.$router.push('/login')
      }
    }
  }
</script>

<style>
	
</style>
