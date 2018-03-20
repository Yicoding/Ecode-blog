<template>
  <div>
    <div style="height: 20px;"></div>
    <div style="width: 150px; margin:auto;">
      <img src="static/img/bind.jpg" style="max-width: 100%; height: 150px; border-radius: 50%;"/>
    </div>
    <div class="split-top"></div>
    <p class="line">
			<input placeholder="请输入用户名" v-model="ruleForm.name" ref="name">
			<span class='but-clear' @click="clearInfo('name')" v-show="ruleForm.name"></span>
		</p>
    <p class="line">
			<input placeholder="请输入年龄" v-model="ruleForm.age" ref="age">
			<span class='but-clear' @click="clearInfo('age')" v-show="ruleForm.age"></span>
		</p>
		<p class="line">
			<input placeholder="请输入密码" v-model="ruleForm.password" :type="passwordShow?'text':'password'" ref="password">
			<span  class='but-nosee' :class="{'see':passwordShow}" @click="changePassShow"></span>
		</p>
		<button class="but-login" @click="butLogin">注册</button>
    <p class="go-back" @click="$router.push('/login')">去登录</p>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        ruleForm: {
          name: null,
          age: null,
          password: null,
          role_id: 3
        },
        passwordShow: false,
      }
    },
    methods: {
      clearInfo(info) {
        this.ruleForm[info] = null
        this.$refs[info].focus()
      },
      changePassShow(){
        this.passwordShow = !this.passwordShow
        this.$refs.password.focus()
      },
      butLogin() {
        if (!this.ruleForm.name) {
          this.$toast('用户名不能为空')
        } else if (!this.ruleForm.age) {
          this.$toast('年龄不能为空')
        } else if (!/^[0-9]+$/.test(this.ruleForm.age)) {
          this.$toast('请输入一个数值且为正整数')
        } else if (this.ruleForm.age < 16) {
          this.$toast('必须年满16岁')
        } else if (!this.ruleForm.password) {
          this.$toast('密码不为空')
        } else {
          this.$http.post(this.resource + '/api/user/add', this.ruleForm).then((res) => {
            this.$message({
              showClose: true,
              message: '恭喜你，注册成功，3秒后自动跳转到登录界面',
              type: 'success'
            })
            setTimeout(() => {
              this.$router.push('/login')
            }, 3000)
          }).catch(() => {
            this.$message({
              showClose: true,
              message: '用户名已存在，请取一个独一无二的个性名称',
              type: 'error'
            })
          })
        }
      }
    }
  }
</script>

<style scoped>
	.split-top {
    height: 20px;
  }
  p {
    margin-top: 10px;
  }
  .line {
    position: relative;
    width: 80%;
    margin: 0 10%;
    line-height: 50px;
    height: 50px;
    border-bottom: 1px solid #ccc;
  }
  .line > input{
    outline: none;
    font-size: 15px;
    border: none;
    padding-left: 5px;
    color: #333333;
    width: 100%;
    background: none;
  }
  .register-p {
    border: none;
  }
  .but-clear {
    display: inline-block;
    position: absolute;
    height: 11px;
    width: 11px;
    background: url(../../assets/icon-clear.png) no-repeat;
    background-size:11px 11px;
    right: 3px;
    top: 17px;
    z-index: 10;
    margin-right: 0.05rem;
  }
  .but-nosee {
    display: inline-block;
    position: absolute;
    height: 11px;
    width: 16px;
    background: url(../../assets/icon-nosee.png) no-repeat;
    background-size:16px 11px;
    right: 0;
    top: 17px;
    z-index: 10;
  }
  .see {
    background: url(../../assets/icon-see.png) no-repeat;
    background-size:16px 11px;
  }
  .but-login{
    background-color: #DB3B3E;
    color: #fff;
    width: 80%;
    margin: 0 auto;
    text-align: center;
    display: block;
    line-height: 40px;
    font-size: 18px;
    margin-top: 40px;
    border-radius: 4px;
    border: none;
  }
  .go-back {
    text-align: right;
    margin-right: 10%;
    margin-top: 30px;
    color: #06be04;
    font-size: 14px;
  }
</style>
