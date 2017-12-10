<template>
  <div>
    <div style="padding: 5px 10px;">
      <el-button size="small" icon="arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
    </div>
    <div class="split"></div>
    <div>
      <ul class="menu-ul">
        <li v-for="item in listData" :key="item.id">
      		<div style="overflow: hidden;">
            <div class="rate-img left">
        		  <img :src="item.picture"/>
            </div>
            <div class="rate-star left">
              <h5>评分</h5>
              <div class="div-top"></div>
              <el-rate
                v-model="item.star"
                show-text disabled>
              </el-rate>
            </div>
          </div>
          <mt-cell title="我的评价："></mt-cell>
          <div v-text="item.content" style="padding: 20px;"></div>
          <div class="split"></div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui'
export default {
  filters: {
  	statusFilter (value) {
  		if (value == 0) {
  			return '待发货'
  		}
  	}
  }, 
  data () {
    return {
      listData: [],
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
  	setTimeout(() => {
      this.$http.get(this.resource + '/api/ratelist/mine', {params: {user_id: this.user.id}}).then((res) => {
        this.listData = res.data
      })
    }, 500)
  },
}
</script>

<style>

</style>
