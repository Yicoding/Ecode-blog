<template>
  <div>
  	<div class="line">
  		<el-button @click="add">新增</el-button>
  	</div>
  	<el-table
      :data="data"
      border
      style="width: 100%">
      <el-table-column
        prop="name"
        label="部门">
      </el-table-column>
      <el-table-column
        prop="admin"
        label="管理员">
      </el-table-column>
      <el-table-column
        label="操作">
        <template scope="scope">
          <el-button type="text" size="small" @click="putrole(scope.row.id)">编辑</el-button>
          <el-button type="text" size="small" @click="deleterole(scope.row.id)">删除</el-button>
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
      this.$http.get('/api/part/findall').then(res => {
        console.log(JSON.stringify(res.data))
        this.data = res.data
      })
    },
    add () {
      this.$router.push('/root/system/partinfo')
    },
    putrole (data) {
      this.$router.push({path: '/root/system/partinfo', query: {id: data}})
    },
    deleterole (data) {
      this.$http.delete('/api/part/' + data).then(res => {
        if (res.data.code == 200) {
          this.$message({
            showClose: true,
            message: res.data.message,
            type: 'success'
          });
          this.findall()
        } else if (res.data.code == 500) {
          this.$message({
            showClose: true,
            message: res.data.message,
            type: 'error'
          });
        }
      })
    },
  }
}
</script>

<style>

</style>
