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
        label="角色">
      </el-table-column>
      <el-table-column
        prop="fullname"
        label="角色名" width="140">
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
      this.$http.get('/api/role/findall').then(res => {
        console.log(JSON.stringify(res.data))
        this.data = res.data
      })
    },
    add () {
      this.$router.push('/root/system/roleinfo')
    },
    putrole (data) {
      this.$router.push({path: '/root/system/roleinfo', query: {id: data}})
    },
    deleterole (data) {
      this.$http.delete('/api/role/' + data).then(res => {
        this.findall()
      })
    },
  }
}
</script>

<style>

</style>
