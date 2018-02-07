<template>
  <div>
  	<div class="line">
  		<el-button @click="add" size="small">新增</el-button>
  	</div>
  	<el-table
      :data="data"
      border
      style="width: 100%">
      <el-table-column
        type="index"
        label="序号"
        width="65">
      </el-table-column>
      <el-table-column
        prop="name"
        label="姓名"
        width="90">
      </el-table-column>
      <el-table-column
        prop="age"
        label="年龄" width="65">
      </el-table-column>
      <el-table-column
        prop="password"
        label="密码" width="100">
      </el-table-column>
      <el-table-column
        prop="role.fullname"
        label="角色" width="120">
      </el-table-column>
      <el-table-column
        prop="part.name"
        label="部门" width="100">
      </el-table-column>
      <el-table-column
        label="操作" width="100">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="putrole(scope.row.id)">编辑</el-button>
          <el-button v-if="(scope.row.role.id == 3)" type="text" size="small" @click="deleterole(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  created () {
    this.findall()
  },
  data () {
    return {
      data: [],
    }
  },
  methods: {
    findall () {
      this.$http.get(this.resource + '/api/user/findall').then(res => {
        console.log(JSON.stringify(res.data))
        this.data = res.data
      })
    },
    add () {
      this.$router.push('/root/system/userinfo')
    },
    putrole (data) {
      this.$router.push({path: '/root/system/userinfo', query: {id: data}})
    },
    deleterole (data) {
      this.$http.delete(this.resource + '/api/user/' + data).then(res => {
        this.findall()
      })
    },
  }
}
</script>

<style>

</style>
