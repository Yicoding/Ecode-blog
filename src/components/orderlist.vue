<template>
  <div>
  <mt-cell v-if="user.part" :title="user.name + ' - ' + user.part.name + ' - ' + user.role.fullname"></mt-cell>
    <div class="split"></div>
    <div>
      <ul class="menu-ul">
        <li v-for="(item, index) in listData" :key="item.id">
          <div class="menu-left">
            <img :src="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <div style="overflow: hidden;">
              <h4 v-text="item.name"></h4>
              <p style="margin-top: 12px;" v-text="item.descript"></p>
            </div>
            <div class="munu-price">
              <div class="left" style="width: 40%;">
                &yen;{{item.price}}
              </div>
            </div>
            <div class="orderlist-num">x{{item.total}}</div>
          </div>
        </li>
      </ul>
    </div>
    <div class="split"></div>
    <mt-cell>共{{menuNum}}件商品</mt-cell>
    <div class="orderlist-footer">
      <div class="orderlist-footer-left left" @click="cancelOrder">取消订单</div>
      <div class="orderlist-footer-center left">合计：&yen;{{$route.query.priceAll}}</div>
      <div class="orderlist-footer-right right" @click="sendOrder">立即下单</div>
    </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui'
export default {
  data () {
    return {
      listData: [],
      menuNum: 0,
      orderForm: {
        user_id: null,
        createdTime: null,
        content: [],
        menuNum: null,
        priceAll: null
      },
      orderlistArr: [],
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
    this.listData = JSON.parse(this.$route.query.dataArr)
    this.menuNum = this.$route.query.menuNum
    this.listData.forEach((item) => {
      this.orderlistArr.push(item.menu_id)
    })
    console.log(this.orderlistArr)
  },
  methods: {
    // 取消订单
    cancelOrder () {
      MessageBox.confirm('确定要取消订单吗?').then(action => {
        this.$router.go(-1)
      })
    },
    // 立即下单
    sendOrder () {
      MessageBox.confirm('确定要下单了吗?').then(action => {
        this.orderForm = {
          user_id: this.user.id,
          createdTime: this.changedate(new Date, 'yyyy-MM-dd HH:mm:ss'),
          content: JSON.stringify(this.listData),
          menuNum: this.menuNum,
          priceAll: this.$route.query.priceAll
        }
        console.log(JSON.stringify(this.orderForm))
        this.$http.post(this.resource + '/api/order/add', this.orderForm).then((res) => {
          this.$toast('下单成功了哦')
          if (this.$route.query.isDelete == 'true') {
            this.$http.delete(this.resource + '/api/shop/deleteCheck', {params: {data: String(this.orderlistArr), user_id: this.user.id}}).then((res) => {
              // this.$toast('删除成功')
            })
          }
          this.$router.push('/' + this.user.role.name + '/mine/mineorderlist')
        })
        this.listData.forEach((item) => {
          this.$http.post(this.resource + '/api/ordermenu/add', item).then((res) => {

          })
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
