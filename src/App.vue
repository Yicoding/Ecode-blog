<template>
  <div v-loading="loading" element-loading-text="正在拼命加载，请稍后" style="height: 100%;">
    <el-popover
      ref="popover5"
      placement="bottom"
      v-model="visible2">
    <el-button @click="putpwd">修改密码</el-button>
     <el-button type="primary" @click="logout">退出</el-button> 
    </el-popover>
    <el-dialog title="修改密码" :visible.sync="dialogFormVisible" size="large">
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
    <div class="header-home">
      <el-button type="text" style="margin-right: 40px;" v-popover:popover5>{{user.name}}</el-button>
    </div>
    <section>
      <div class="section">
        <router-view></router-view>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data () {
    return {
      user: {},
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
    }
  },
  computed: {
    loginname () {
      return this.$store.state.user.name
    }
  },
  created () {
    console.log(this.loginname)
    this.$http.get('/api/user/loginfo', {params: {name: this.loginname}}).then((res) => {
      console.log(JSON.stringify(res.data))
      this.user = res.data
      this.loading = false
    }).catch(() => {
      this.loading = false
      this.$message({
        showClose: true,
        message: '登录超时，请重新登陆',
        type: 'error'
      });
      setTimeout(() => {
       window.location.href = '/login'
      }, 1000)
  })
  },
  methods: {
    putpwd () {
      this.dialogFormVisible = true
      var name = this.user.name
      this.form.name = name
    },
    logout () {
      this.$http.get('/api/loginfo/logout', {params: {name: this.loginname}}).then((res) => {
        this.$store.dispatch('getUser', '')
        this.$message({
          showClose: true,
          message: '退出成功，下次再见呦',
          type: 'success'
        });
        window.sessionStorage.clear()
        setTimeout(() => {
         window.location.href = '/login'
        }, 1000)
      })
    },
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.put('/api/user/put', this.form).then((res) => {
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
  }
}
</script>

<style>
  
</style>
