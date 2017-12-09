<template>
  <div>
  <mt-cell>{{listData.status | statusFilter}}</mt-cell>
    <div class="split"></div>
    <div>
      <ul class="menu-ul">
        <li v-for="(item, index) in listData.content" :key="item.id">
          <div class="menu-left">
            <img :src="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <div style="overflow: hidden;">
              <h4 v-text="item.name"></h4>
              <p style="margin-top: 12px;" v-text="item.desc"></p>
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
    <mt-button size="large" style="position: fixed; bottom: 0;" type="primary" @click="$router.go(-1)">返回到订单列表</mt-button>
  </div>
</template>

<script>
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
      menuNum: 0,
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
    // console.log(JSON.parse(this.$route.query.item))
    this.listData = JSON.parse(this.$route.query.item)
    this.listData.content.forEach((item) => {
    	this.menuNum += item.total
    })
  },
  methods: {
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
