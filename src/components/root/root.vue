<template>
  <div>
  	<div class="aside">
	  	<el-menu default-active="2" class="el-menu-vertical-demo" theme="dark">
	      <el-submenu index="1">
	        <template slot="title">导航一</template>
	        <el-menu-item-group title="分组一">
	          <el-menu-item index="1-1">选项1</el-menu-item>
	          <el-menu-item index="1-2">选项2</el-menu-item>
	        </el-menu-item-group>
	        <el-menu-item-group title="分组2">
	          <el-menu-item index="1-3">选项3</el-menu-item>
	        </el-menu-item-group>
	        <el-submenu index="1-4">
	          <template slot="title">选项4</template>
	          <el-menu-item index="1-4-1">选项1</el-menu-item>
	        </el-submenu>
	      </el-submenu>
	      <el-menu-item index="2">导航二</el-menu-item>
	      <el-menu-item index="3">导航三</el-menu-item>
	    </el-menu>
  	</div>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  
}
</script>

<style>
  .aside {
  	width: 30%;
  }
</style>
