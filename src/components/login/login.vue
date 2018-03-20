<template>
  <div>
    <div style="height: 20px;"></div>
    <div style="width: 180px; margin:auto;">
      <img src="static/img/login.gif" style="max-width: 100%; height: 180px; border-radius: 50%;"/>
    </div>
    <div class="split-top"></div>
    <p class="line">
			<input placeholder="请输入用户名" v-model="ruleForm.name" ref="name">
			<span class='but-clear' @click="clearInfo" v-show="ruleForm.name"></span>
		</p>
		<p class="line">
			<input placeholder="请输入密码" v-model="ruleForm.password" :type="passwordShow?'text':'password'" ref="password">
			<span  class='but-nosee' :class="{'see':passwordShow}" @click="changePassShow"></span>
		</p>
		<button class="but-login" @click="butLogin">登录</button>


		<p class="line register-p">
			<span class="span1">还没有账号？<i> <router-link to="/registered">注册一个</router-link></i></span>
		</p>
  </div>
</template>

<script>
  import {mapActions} from 'vuex'
  export default {
    data() {
      return {
        ruleForm: {
          name: null,
          password: null
        },
        passwordShow: false,
      };
    },
    methods: {
      clearInfo() {
        this.ruleForm.name = null
        this.$refs.name.focus()
      },
      changePassShow(){
        this.passwordShow = !this.passwordShow
        this.$refs.password.focus()
			},
      butLogin() {
        if (!this.ruleForm.name) {
          this.$toast('用户名不能为空')
        } else if (!this.ruleForm.password) {
          this.$toast('密码不能为空')
        } else {
          this.$http.get(this.resource + '/api/user/login', {params: {name: this.ruleForm.name, password: this.ruleForm.password}}).then((res) => {
            this.$store.dispatch('getUser', res.data)
            window.sessionStorage.setItem('loginId', res.data.id)
            this.$message({
              showClose: true,
              message: '恭喜你，登录成功！欢迎来到home',
              type: 'success'
            });
            if (res.data.role.name == 'root') {
              this.saveMenuList([
                {link: '/root/order', icon: 'icon-menu', showNum: false, showMenu: false, tab: '订单'},
                {link: '/root/system/menu', icon: 'icon-menu', showNum: false, showMenu: false, tab: '菜单'},
                {icon: 'icon-cog', showMenu: true, tab: '系统', children: [
                  {option: '员工管理', link: '/root/system/user'},
                  {option: '部门管理', link: '/root/system/part'},
                  {option: '角色管理', link: '/root/system/role'}
                ]},
                {link: '/root/mine', icon: 'icon-home', showNum: false, showMenu: false, tab: '我的'}
              ])
              this.$router.push('/root/mine')
            } else if (res.data.role.name == 'admin') {
              this.saveMenuList([
                {link: '/admin/menulist', icon: 'icon-menu', showNum: false, showMenu: false, tab: '菜单'},
                {link: '/admin/usermanage', icon: 'icon-users', showNum: false, showMenu: false, tab: '成员'},
                {link: '/admin/shop', icon: 'icon-cart', showNum: true, showMenu: false, tab: '购物车'},
                {link: '/admin/mine', icon: 'icon-home', showNum: false, showMenu: false, tab: '我的'}
              ])
              this.$http.get(this.resource + '/api/shop/findall', {params: {uid: res.data.id}}).then(res => {
                let num = 0
                res.data.forEach((item) => {
                  item.isCheck === 'true' && (num += item.total)
                })
                this.$store.dispatch('getshopNum', num)
              })
              this.$router.push('/admin/mine')
            } else if (res.data.role.name == 'general') {
              this.saveMenuList([
                {link: '/general/menulist', icon: 'icon-menu', showNum: false, showMenu: false, tab: '菜单'},
                {link: '/general/shop', icon: 'icon-cart', showNum: true, showMenu: false, tab: '购物车'},
                {link: '/general/mine', icon: 'icon-home', showNum: false, showMenu: false, tab: '我的'}
              ])
              this.$http.get(this.resource + '/api/shop/findall', {params: {uid: res.data.id}}).then(res => {
                let num = 0
                res.data.forEach((item) => {
                  item.isCheck === 'true' && (num += item.total)
                })
                this.$store.dispatch('getshopNum', num)
              })
              this.$router.push('/general/mine')
            }
            // this.$store.dispatch('getTimeup', false)
          }).catch((err) => {
            this.$message({
              showClose: true,
              message: '用户名或密码不正确',
              type: 'error'
            });
          })
        }
      },
      ...mapActions([
        'saveMenuList',
      ])
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
  .register-p .span1 {
    color: #999999;
    text-align: left;
    font-size: 13px;
  }
  .register-p .span1 a, .register-p .span1 i {
    font-style: normal;
    color: #06be04;
    padding: 2px 2px
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
</style>
