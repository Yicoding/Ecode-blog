<template>
  <div>
    <div class="menuinfo-header">
    	<img :src="food.picture" alt=""/>
    	<div class="back" @click="$router.go(-1)">
    		<i class="el-icon-arrow-left"></i>
    	</div>
    </div>
    <div class="menuinfo-content">
    	<h4>{{food.name}}</h4>
    	<div class="food-num">共销售{{nums}}份&nbsp;&nbsp;&nbsp;好评率{{favoraRate}}%</div>
    	<div class="food-price">&yen;{{food.price}}</div>
    	<i @click="changeCollect('add')" v-show="(iscollect == 0) && user.role && (user.role.name != 'root')" class="el-icon-star-off food-collection"></i>
    	<i @click="changeCollect('remove')" v-show="(iscollect == 1) && user.role && (user.role.name != 'root')" class="el-icon-star-on food-collection-full"></i>
    	<div class="buy" v-if="user.role && (user.role.name != 'root')">
    		<el-button size="small" type="primary" v-if="total == 0" @click="add">加入购物车</el-button>
    		<transition name="fade">
              <div v-show="total > 0" class="shop-first" @click="remove">-</div>
            </transition>
            <transition name="fade">
              <div v-show="total > 0" class="shop-second" v-text="total"></div>
            </transition>
            <div class="shop-third" @click="add" v-show="total > 0">+</div>
    	</div>
    </div>
    <div class="split"></div>
    <div class="info">
    	<div>商品信息</div>
    	<p class="info-p">{{food.descript}}</p>
    </div>
    <div class="split"></div>
    <div class="info">
    	<div>商品参考图</div>
    	<hr/>
    	<div v-for="todo in imgArr" :key="todo.id" class="img-box">
    		<img :src="todo.src" alt=""/>
    	</div>
    </div>
    <div class="split"></div>
    <div class="rate">
    	<div>商品评价</div>
    	<el-tabs v-model="activeName">
	      <el-tab-pane label="全部" name="all"></el-tab-pane>
	      <el-tab-pane label="好评" name="great"></el-tab-pane>
	      <el-tab-pane label="中评" name="good"></el-tab-pane>
	      <el-tab-pane label="差评" name="bad"></el-tab-pane>
	    </el-tabs>
	    <ul class="rate-ul">
	    	<li v-for="item in rateArr">
	    		<div class="food-num">
	    			{{item.time}}
	    			<div class="right">{{item.user_name}} <span class="icon-user"></span></div>
	    		</div>
	    		<el-rate
				  v-model="item.star"
				  disabled
				  show-text
				  text-color="#ff9900"
				  score-template="{value}"
				  :colors="['#99A9BF', '#F7BA2A', '#FF9900']">
				</el-rate>
				<p class="info-p">{{item.content}}</p>
	    	</li>
	    </ul>
	    <div v-show="!rateArr.length" style="text-align: center;">暂无评价！</div>
    </div>
  </div>
</template>

<script>
export default {
	data () {
		return {
			food: {},
			total: 0,
			activeName: 'all',
			rateArr: [],
			favoraRate: null,
			nums: null,
			imgArr: [],
			iscollect: null,
		}
	},
	computed: {
	    user () {
	      return this.$store.state.user
	    }
  	},
  	created () {
  		console.log(this.$route.query.id)
		this.$http.get(this.resource + '/api/menu/findone', {params: {id: this.$route.query.id}}).then((res) => {
			this.food = res.data
		})
		this.total = 0
		this.$http.get(this.resource + '/api/rate/all', {params: {menu_id: this.$route.query.id}}).then((res) => {
			this.rateArr = res.data
			this.$http.get(this.resource + '/api/greatNum/rate', {params: {menu_id: this.$route.query.id}}).then((result) => {
				this.favoraRate = (result.data.greatNum / res.data.length * 100).toFixed(2) || 0
			})
		})
		this.$http.get(this.resource + '/api/menu/saleNum', {params: {menu_id: this.$route.query.id}}).then((res) => {
			if (res.data.nums) {
				this.nums = res.data.nums
			} else {
				this.nums = 0
			}
		})
		// imgArr
		this.$http.get(this.resource + '/api/menu/imgArr', {params: {menu_id: this.$route.query.id}}).then((res) => {
			this.imgArr = res.data
		})
		// 查看是否收藏改商品
		setTimeout(() => {
			this.$http.get(this.resource + '/api/collect/iscollect', {params: {menu_id: this.$route.query.id, user_id: this.user.id}}).then((res) => {
				this.iscollect = res.data.iscollect
			})
		}, 500)
  	},
	activated () {
		console.log(this.$route.query.id)
		this.$http.get(this.resource + '/api/menu/findone', {params: {id: this.$route.query.id}}).then((res) => {
			this.food = res.data
		})
		this.total = 0
		this.$http.get(this.resource + '/api/rate/all', {params: {menu_id: this.$route.query.id}}).then((res) => {
			this.rateArr = res.data
			this.$http.get(this.resource + '/api/greatNum/rate', {params: {menu_id: this.$route.query.id}}).then((result) => {
				this.favoraRate = (result.data.greatNum / res.data.length * 100).toFixed(2) || 0
			})
		})
		this.$http.get(this.resource + '/api/menu/saleNum', {params: {menu_id: this.$route.query.id}}).then((res) => {
			if (res.data.nums) {
				this.nums = res.data.nums
			} else {
				this.nums = 0
			}
		})
		// imgArr
		this.$http.get(this.resource + '/api/menu/imgArr', {params: {menu_id: this.$route.query.id}}).then((res) => {
			this.imgArr = res.data
		})
		// 查看是否收藏改商品
		setTimeout(() => {
			this.$http.get(this.resource + '/api/collect/iscollect', {params: {menu_id: this.$route.query.id, user_id: this.user.id}}).then((res) => {
				this.iscollect = res.data.iscollect
			})
		}, 500)
	},
	watch: {
		activeName (value) {
			console.log(value)
			this.$http.get(this.resource + '/api/rate/' + value, {params: {menu_id: this.$route.query.id}}).then((res) => {
				this.rateArr = res.data
			})
		}
	},
	methods: {
		add () {
			this.total ++
			this.$http.put(this.resource + '/api/shop/put', {user_id: this.user.id, menu_id: this.$route.query.id, action: 'add'}).then((res) => {
		        console.log(JSON.stringify(res.data))
		        this.$store.dispatch('getonechangeNum', 'add')
	      	})
		},
		remove () {
			this.total --
			this.$http.delete(this.resource + '/api/shop/remove', {params: {user_id: this.user.id, menu_id: this.$route.query.id}}).then((res) => {
			  console.log(JSON.stringify(res.data))
			  this.$store.dispatch('getonechangeNum', 'remove')
			})
		},
		// 收藏
		changeCollect (value) {
			if (value == 'add') {
				this.iscollect = 1
				this.$http.post(this.resource + '/api/collect/add', {menu_id: this.$route.query.id, user_id: this.user.id}).then((res) => {

				})
			} else {
				this.iscollect = 0
				this.$http.delete(this.resource + '/api/collect/remove', {params: {menu_id: this.$route.query.id, user_id: this.user.id}}).then((res) => {
					
				})
			}
		}
	}
}
</script>

<style>
  
</style>
