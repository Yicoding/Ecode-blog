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
    <mt-cell :title="'共有' + listData.length + '条记录'"></mt-cell>
    <div class="split"></div>
    <div v-show="listData.length">
      <ul class="menu-ul">
        <li v-for="item in listData" :key="item.id">
        	<mt-cell :title="item.createdTime">
        		{{item.status | statusFilter}}
        	</mt-cell>
      		<div class="img-box-order" @click="checkOrderList(item)">
          		<img v-lazy="todo.picture" :key="todo.id" v-for="todo in item.content"/>
      		</div>
      		<mt-cell>共{{item.menuNum}}件商品 合计：&yen;{{item.priceAll}}</mt-cell>
      		<mt-cell>
      			<mt-button size="small" :plain="true" type="danger" @click="surepost(item)" v-if="item.status == 0">确认发货</mt-button>&nbsp;&nbsp;
      			<mt-button size="small" :plain="true" type="primary" @click="surearrive(item)" v-if="item.status == 1">确认送达</mt-button>
      		</mt-cell>
      		<div class="split"></div>
        </li>
      </ul>
    </div>
    <transition name="fade">
      <div v-show="!listData.length" class="empty-content">您还没有相关订单 --</div>
    </transition>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui'
export default {
  filters: {
  	statusFilter (value) {
  		if (value == 0) {
  			return '待发货'
  		} else if (value == 1) {
        return '待收货'
      } else {
        return '已完成'
      }
  	}
  }, 
  data () {
    return {
      activeName: '99',
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
  methods: {
    findall () {
      this.$http.get(this.resource + '/api/order/root/findAll').then((res) => {
      	console.log(res.data.length)
        this.listData = res.data.map((item) => {
        	item.content = JSON.parse(item.content)
        	return item
        })
        // console.log(JSON.stringify(this.listData))
      })
    },
    findByType () {
    	this.$http.get(this.resource + '/api/order/root/findByType', {params: {status: this.activeName}}).then((res) => {
    		console.log(res.data.length)
	        this.listData = res.data.map((item) => {
	        	item.content = JSON.parse(item.content)
	        	return item
	        })
      	})
    },
    // 查看单个订单详情
    checkOrderList (item) {
    	console.log(JSON.stringify(item))
    	this.$router.push({path: '/ordercontent', query: {item: JSON.stringify(item)}})
    },
    // 确认发货
    surepost (item) {
		// console.log(JSON.stringify(item))
    	MessageBox.confirm('确定要执行此操作吗?').then(action => {
    		this.$http.put(this.resource + '/api/order/surepost', {id: item.id, acceptTime: this.changedate(new Date(), 'yyyy-MM-dd HH:mm:ss')}).then(() => {
    			if (this.activeName == 'all') {
    			  this.findall()
    			} else {
    			  this.findByType()
    			}
    		})
    	})
    },
    // 确认送达
    surearrive (item) {
    	MessageBox.confirm('确定要执行此操作吗?').then(action => {
    		this.$http.put(this.resource + '/api/order/surearrive', {id: item.id, completeTime: this.changedate(new Date(), 'yyyy-MM-dd HH:mm:ss')}).then(() => {
    			if (this.activeName == 'all') {
    			  this.findall()
    			} else {
    			  this.findByType()
    			}
    		})
    	})
    },
    // 中国标准时间转换
    changedate (time, format) {
      var t = new Date(time);
      var tf = function(i){return (i < 10 ? '0' : '') + i};
      return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
        switch(a){
          case 'yyyy':
              return tf(t.getFullYear());
              break;
          case 'MM':
              return tf(t.getMonth() + 1);
              break;
          case 'mm':
              return tf(t.getMinutes());
              break;
          case 'dd':
              return tf(t.getDate());
              break;
          case 'HH':
              return tf(t.getHours());
              break;
          case 'ss':
              return tf(t.getSeconds());
              break;
        }
      })
    },
  }
}
</script>

<style>

</style>
