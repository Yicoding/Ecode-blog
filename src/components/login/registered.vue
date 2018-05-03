<template>
  <div>
    <div style="height: 20px;"></div>
    <div style="width: 150px; margin:auto;">
      <img src="static/img/bind.jpg" style="max-width: 100%; height: 150px; border-radius: 50%;"/>
    </div>
    <div class="split-top"></div>
    <p class="line">
			<input placeholder="请输入手机号" maxlength="13" @input="phoneFormat" ref="phone">
		</p>
    <p class="line">
			<input placeholder="请输入昵称" v-model="ruleForm.name" ref="name">
			<span class='but-clear' @click="clearInfo('name')" v-show="ruleForm.name"></span>
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
          phone: null,
          name: null,
          password: null,
        },
        passwordShow: false,
      }
    },
    methods: {
      // 手机号显示格式 3-4-4
      phoneFormat(e) {
        var val = e.target.value
        var arr = val.split(' ')
        var Arr = []
        var Str = ''
        for(var i = 0; i < arr.length; i ++){
          var arr1 = arr[i].split('')
          for(var j = 0; j < arr1.length; j ++){
            Arr.push(arr1[j])
          }
        }
        if(Arr.length > 3 && Arr.length <= 7){
          Arr.splice(3, 0, ' ');
        }else if(Arr.length > 7){
          Arr.splice(7, 0, ' ');
          Arr.splice(3, 0, ' ');
        }
        Arr.forEach(function(ele){
          Str += ele;
        })
        e.target.value = Str
      },
      clearInfo(info) {
        this.ruleForm[info] = null
      },
      changePassShow(){
        this.passwordShow = !this.passwordShow
      },
      butLogin() {
        this.ruleForm.phone = this.$refs.phone.value.replace(/\s+/g, "")
        if (!this.ruleForm.phone) {
          this.$toast('手机号不能为空')
        } else if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(this.ruleForm.phone))) {
          this.$toast('手机号格式不正确')
        } else if (!this.ruleForm.name) {
          this.$toast('昵称不能为空')
        } else if (!this.ruleForm.password) {
          this.$toast('密码不能为空')
        } else {
          this.$http.post(this.resource + '/user/add', this.ruleForm).then((res) => {
            this.$message({
              showClose: true,
              message: '恭喜你，注册成功，3秒后自动跳转到登录界面',
              type: 'success'
            })
            setTimeout(() => {
              this.$router.push('/login')
            }, 3000)
          }).catch(err => {
            console.log(err.response.data.errMsg)
            this.$message({
              showClose: true,
              message: err.response.data.errMsg,
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
    height: 16px;
    width: 16px;
    background: url(../../assets/icon-clear.png) no-repeat;
    background-size:16px 16px;
    right: 3px;
    top: 19px;
    z-index: 10;
  }
  .but-nosee {
    display: inline-block;
    position: absolute;
    height: 15px;
    width: 23px;
    background: url(../../assets/icon-nosee.png) no-repeat;
    background-size:23px 15px;
    right: 0;
    top: 19px;
    z-index: 10;
  }
  .see {
    background: url(../../assets/icon-see.png) no-repeat;
    background-size:23px 15px;
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
