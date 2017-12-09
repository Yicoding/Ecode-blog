<template>
  <div>
    <div class="order-tabs">
      <el-tabs v-model="activeName">
        <el-tab-pane label="全部" name="all"></el-tab-pane>
        <el-tab-pane label="待发货" name="0"></el-tab-pane>
        <el-tab-pane label="待收货" name="1"></el-tab-pane>
        <el-tab-pane label="已完成" name="2"></el-tab-pane>
      </el-tabs>
    </div>
    <div v-show="listData.length > 0">
      <ul class="menu-ul">
        <li v-for="(item, index) in listData" :key="item.id">
        	<mt-cell :title="item.createdTime">
        		{{item.status | statusFilter}}
        	</mt-cell>
      		<div class="img-box" @click="checkOrderList(item)">
          		<img :src="todo.picture" :key="todo.id" v-for="todo in item.content"/>
      		</div>
      		<mt-cell>共{{item.menuNum}}件商品 合计：&yen;{{item.priceAll}}</mt-cell>
      		<mt-cell>
      			<mt-button size="small" :plain="true" type="danger" @click="buyagin(item)">再来一单</mt-button>&nbsp;&nbsp;
      			<mt-button size="small" :plain="true" type="primary" v-if="item.status == 1">确认收货</mt-button>
      		</mt-cell>
      		<div class="split"></div>
        </li>
      </ul>
    </div>
    <div v-show="listData.length == 0" class="empty-content">您还没有相关订单 --</div>
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
      activeName: null,
      listData: [],
    }
  },
  watch: {
    activeName (value) {
      if (value) {
        console.log(value)
        if (value == 'all') {
          this.findall()
        } else {
          this.findByType()
        }
      }
    },
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
  	setTimeout(() => {
    	this.activeName = 'all'
  	}, 500)
  },
  // activated () {
  //   this.activeName = 'id'
  // },
  methods: {
    findall () {
      this.$http.get(this.resource + '/api/order/findall', {params: {user_id: this.user.id}}).then((res) => {
        this.listData = res.data.map((item) => {
        	item.content = JSON.parse(item.content)
        	return item
        })
        // console.log(JSON.stringify(this.listData))
      })
    },
    findByType () {

    },
    // 查看单个订单详情
    checkOrderList (item) {
    	console.log(JSON.stringify(item))
    	this.$router.push({path: '/ordercontent', query: {item: JSON.stringify(item)}})
    },
    // 再来一单
    buyagin (item) {
		console.log(JSON.stringify(item))
    	MessageBox.confirm('确定要再次购买吗?').then(action => {
    		this.$http.post(this.resource + '/api/shop/addArr', {user_id: this.user.id, content: item.content}).then((res) => {
    			// this.$http.get(this.resource + '/api/shop/findall', {params: {uid: this.user.id}}).then(result => {
       //        		let num = 0
       //        		result.data.forEach((item) => {
	      //           	num += item.total
	      //         	})
	      //         	this.$store.dispatch('getshopNum', num)
	      //       })
	      		let dataArr = []
	      		item.content.forEach((todo) => {
	      			dataArr.push(todo.menu_id)
	      		})
          		this.$router.push({path: '/orderlist', query: {dataArr: String(dataArr), priceAll: item.priceAll}})
    		})
    	})
    },
  }
}
</script>

<style>

</style>
