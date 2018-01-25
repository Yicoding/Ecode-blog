<template>
  <div>
    <div class="split"></div>
    <div>
      <ul class="menu-ul">
        <li>
      		<div style="overflow: hidden;">
            <div class="rate-img left">
        		  <img v-lazy="listData.content[index].picture"/>
            </div>
            <div class="rate-star left">
              <h5>评分</h5>
              <div class="div-top"></div>
              <el-rate
                v-model="star"
                show-text>
              </el-rate>
            </div>
      		</div>
      		<mt-field placeholder="请说一下你对改商品的感受吧" type="textarea" rows="6" v-model.trim="rateForm.content"></mt-field>
      		<div class="split"></div>
          <mt-cell>
            <mt-button size="small" :plain="true" type="primary" @click="$router.go(-1)">取消评价</mt-button>&nbsp;&nbsp;<mt-button size="small" :plain="true" type="danger" @click="send">提交评价</mt-button>
          </mt-cell>
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
      listData: {},
      index: null,
      star: null,
      rateForm: {
        menu_id: null,
        content: null,
        star: null,
        time: null,
        user_id: null,
        picture: null,
      },
    }
  },
  watch: {
    star (value) {
      console.log(value)
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
  	this.listData = JSON.parse(this.$route.query.item)
    this.index = this.$route.query.index
    console.log(JSON.parse(this.$route.query.item))
  },
  methods: {
    // 提交评价
    send () {
      if (!this.star) {
        this.$toast('您还没有进行评分哦')
      } else if (!this.rateForm.content) {
        this.$toast('您还没有进行文字评价哦')
      } else {
        this.rateForm.menu_id = this.listData.content[this.index].menu_id
        this.rateForm.star = this.star
        this.rateForm.time = this.changedate(new Date(), 'yyyy-MM-dd HH:mm:ss')
        this.rateForm.user_id = this.user.id
        this.rateForm.picture = this.listData.content[this.index].picture
        // 新增评论
        this.$http.post(this.resource + '/api/rate/add', this.rateForm).then((res) => {
          this.$toast('恭喜你评价成功')
        })
        // 修改订单字段
        this.listData.content[this.index].hasRate = 'exit'
        this.$http.put(this.resource + '/api/order/hasRate', {id: this.listData.id, content: JSON.stringify(this.listData.content)}).then((res) => {
          this.$router.push({path: '/ordercontent', query: {item: JSON.stringify(this.listData)}})
        })
      }
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
