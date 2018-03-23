<template>
  <div v-loading="loading" element-loading-text="正在拼命加载，请稍后" class="box-content" ref="boxContent">
    <el-popover
      ref="popover5"
      placement="bottom"
      v-model="visible2">
      <el-button @click="putpwd">修改密码</el-button>
      <!-- <el-button type="primary" @click="logout">退出</el-button>  -->
    </el-popover>
    <el-dialog title="修改密码" :visible.sync="dialogFormVisible" width="80%">
      <el-form :model="form" :rules="rules" ref="form">
        <el-form-item label="用户名">
          <el-tag>{{form.name}}</el-tag>
        </el-form-item>
        <el-form-item label="旧密码" prop="oldpwd">
          <el-input v-model="form.oldpwd"></el-input>
        </el-form-item>
        <el-form-item label="新密码" prop="newpwd">
          <el-input v-model="form.newpwd"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm('form')">确 定</el-button>
        <el-button @click="dialogFormVisible = false">取 消</el-button>
      </div>
    </el-dialog>
    <header class="header">
      <el-button type="text" style="margin-right: 40px;" v-popover:popover5>{{user.name}}</el-button>
    </header>
    <section ref="section">
      <router-view/>
      <vue-progress-bar></vue-progress-bar>
    </section>
    <footer v-show="user.role">
      <footer-all></footer-all>
    </footer>
    <transition name="fade">
      <div class= "returnTop"  @click="backToTop" v-show="show"></div>
    </transition>
  </div>
</template>

<script>
import footerAll from 'components/footer/footer-all.vue'
import {mapActions} from 'vuex'
export default {
  components: {
    footerAll
  },
  data () {
    return {
      visible2: false,
      dialogFormVisible: false,
      form: {
        name: '',
        oldpwd: '',
        newpwd: ''
      },
      rules: {
        oldpwd: [{required: true, message: '请输入旧密码', trigger: 'blur'}],
        newpwd: [{required: true, message: '请输入新密码', trigger: 'blur'}]
      },
      loading: true,
      loginId: null,
      scrollTop: 0,
      show: false,
      interval: null
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
    this.loginId = window.sessionStorage.getItem('loginId')
    if (!((this.$route.path == '/registered' || this.$route.path == '/login')) && this.loginId) {
      this.$http.get(this.resource + '/api/user/loginname', {params: {id: this.loginId}}).then((res) => {
        this.$store.dispatch('getUser', res.data)
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
        } else if (res.data.role.name == 'admin') {
          this.saveMenuList([
            {link: '/admin/menulist', icon: 'icon-menu', showNum: false, showMenu: false, tab: '菜单'},
            {link: '/admin/usermanage', icon: 'icon-users', showNum: false, showMenu: false, tab: '成员'},
            {link: '/admin/shop', icon: 'icon-cart', showNum: true, showMenu: false, tab: '购物车'},
            {link: '/admin/mine', icon: 'icon-home', showNum: false, showMenu: false, tab: '我的'}
          ])
        } else if (res.data.role.name == 'general') {
          this.saveMenuList([
            {link: '/general/menulist', icon: 'icon-menu', showNum: false, showMenu: false, tab: '菜单'},
            {link: '/general/shop', icon: 'icon-cart', showNum: true, showMenu: false, tab: '购物车'},
            {link: '/general/mine', icon: 'icon-home', showNum: false, showMenu: false, tab: '我的'}
          ])
        }
        this.loading = false
        this.$http.get(this.resource + '/api/shop/findall', {params: {uid: res.data.id}}).then(res => {
          let num = 0
          res.data.forEach((item) => {
            item.isCheck === 'true' && (num += item.total)
          })
          this.$store.dispatch('getshopNum', num)
        })
      }).catch(() => {
        this.loading = false
      })
    } else {
      this.$router.push('/login')
      this.loading = false
    }
    this.$Progress.start()
    //  hook the progress bar to start before we move router-view
    this.$router.beforeEach((to, from, next) => {
      //  does the page we want to go to have a meta.progress object
      if (to.meta.progress !== undefined) {
        let meta = to.meta.progress
        // parse meta tags
        this.$Progress.parseMeta(meta)
      }
      //  start the progress bar
      this.$Progress.start()
      //  continue to next page
      next()
    })
    //  hook the progress bar to finish after we've finished moving router-view
    this.$router.afterEach((to, from) => {
      //  finish the progress bar
      this.$Progress.finish()
    })
  },
  mounted () {
    //  [App.vue specific] When App.vue is finish loading finish the progress bar
    this.$nextTick(() => {
      this.$refs.boxContent.style.height = window.innerHeight + 'px'
      this.$Progress.finish()
      this.$refs.section.addEventListener('scroll', this.handleScroll, true)
    })
  },
  methods: {
    ...mapActions([
      'saveMenuList',
    ]),
    handleScroll() {
      this.scrollTop = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 0
      if (this.$refs.section.scrollTop >= this.scrollTop / 2) {
        this.show = true 
      } else {
        this.show = false
      }
    },
    backToTop() {
      clearInterval(this.interval)
      this.interval = setInterval(() => {
        var current = this.$refs.section.scrollTop;
        var step = (0 - current) / 10;
        step = Math.ceil(step);
        current += step;
        if(current <= 10) {
          current = 0 
        }
        this.$refs.section.scrollTop = current
        if (current <= 0) {
          clearInterval(this.interval)
        }
      }, 10)
    },
    putpwd () {
      this.visible2 = false
      this.dialogFormVisible = true
      var name = this.user.name
      this.form.name = name
    },
    logout () {
      this.$message({
        showClose: true,
        message: '退出成功，下次再见呦',
        type: 'success'
      })
      window.sessionStorage.clear()
      this.visible2 = false
      this.$store.dispatch('getUser', '')
      this.$router.push('/login')
    },
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.put(this.resource + '/api/user/put', this.form).then((res) => {
              console.log(JSON.stringify(res.data))
              if (res.data.code == 200) {
                this.dialogFormVisible = false
                this.$message({
                showClose: true,
                message: '老铁没毛病，修改成功',
                type: 'success'
              });
              this.form.oldpwd = ''
              this.form.newpwd = ''
              } else if (res.data.code == 500) {
                this.$message({
                  showClose: true,
                  message: '修改失败：旧密码不正确',
                  type: 'error'
                });
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
    }
  },
  beforeDestroy() {
   this.$refs.section.removeEventListener('scroll', this.handleScroll)
    if (this.interval) {
      clearInterval(this.interval)
    }
  },
}
</script>

<style scoped>
  .fade-enter-active, .fade-leave-active {  
    transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to {
    opacity: 0
  }
  .returnTop {
    position: fixed;
    display: inline-block;
    text-align: center;
    cursor: pointer;
    right: 12px;
    bottom: 200px;
    width: 40px;
    height: 40px;
    border-radius: 4px;
    line-height: 45px;
    background-image: url("assets/ruturnTop.png");
    background-size: 40px 40px;
  }
  
</style>
