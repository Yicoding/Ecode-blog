<template>
  <div>
  <mt-cell>{{listData.status | statusFilter}}</mt-cell>
    <div class="split"></div>
    <div>
      <ul class="menu-ul">
        <li v-for="(item, index) in listData.content" :key="item.id" @click="jump(item)">
          <div class="menu-left">
            <img v-lazy="item.picture" alt=""/>
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
          <div style="clear: both;">
          <mt-cell v-if="(listData.status == 2) && user.role && (user.role.name != 'root') && !item.hasRate" title="去评价该商品" is-link @click.stop.native="gotoRate(index)"></mt-cell>
          <mt-cell v-if="user.role && (user.role.name != 'root') && item.hasRate">已完成评价</mt-cell>
            <div class="split"></div>
          </div>
        </li>
      </ul>
    </div>
    <div class="split"></div>
    <mt-cell>共{{menuNum}}件商品</mt-cell>
    <div style="height: 50px;"></div>
    <mt-button size="large" style="position: fixed; bottom: 45px;" type="primary" @click="back">返回到订单列表</mt-button>
  </div>
</template>

<script>
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
      listData: {},
      menuNum: 0,
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
    console.log(JSON.parse(this.$route.query.item))
    this.listData = JSON.parse(this.$route.query.item)
    this.listData.content.forEach((item) => {
    	this.menuNum += item.total
    })
  },
  methods: {
    jump (item) {
      this.$router.push({path: '/' + this.user.role.name + '/menuinfo', query: {id: item.menu_id}})
    },
    // 去评价
    gotoRate (index) {
      console.log(index)
      this.$router.push({path: '/torate', query: {item: this.$route.query.item, index: index}})
    },
    back () {
      if (this.user.role.name === 'root') {
        this.$router.push('/root/order')
      } else {
        this.$router.push(`/${this.user.role.name}/mine/mineorderlist`)
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
