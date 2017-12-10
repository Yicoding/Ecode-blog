<template>
  <div>
    <div style="padding: 5px 10px;">
      <el-button size="small" icon="arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
    </div>
    <div class="split"></div>
    <div>
      <ul class="menu-ul">
        <li v-for="(item, index) in listData" :key="item.id">
          <div class="menu-left" @click="jump(item)">
            <img :src="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <div @click="jump(item)" style="overflow: hidden;">
              <h4 v-text="item.name"></h4>
              <div class="div-top"></div>
              <p v-text="item.desc"></p>
            </div>
            <div class="munu-price">
              <div class="left" style="width: 40%;" @click="jump(item)">
                &yen;{{item.price}}
              </div>
            </div>
    		<i @click="changeCollect(item)" class="el-icon-star-on collect-list-one"></i>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui'
export default {
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
	    this.findall()
  	}, 500)
  },
  activated () {
  	setTimeout(() => {
	    this.findall()
  	}, 500)
  },
  methods: {
  	findall () {
  		this.$http.get(this.resource + '/api/collect/findall',{params: {user_id: this.user.id}}).then((res) => {
		    this.listData = res.data
		    res.data.length == 0 && this.$toast('你还没有收藏任何商品哦，快去收藏一波吧')
	  	})
  	},
    // 跳转到单个商品详情
    jump (item) {
      this.$router.push({path: '/' + this.user.role.name + '/menuinfo', query: {id: item.menu_id}})
    },
    // 移除收藏列表
    changeCollect (item) {
    	MessageBox.confirm('确定要将该商品移出收藏列表?').then(action => {
	    	this.$http.delete(this.resource + '/api/collect/remove', {params: {menu_id: item.menu_id, user_id: this.user.id}}).then((res) => {
				this.findall()	
			})
    	})
    },
  }
}
</script>

<style>

</style>
