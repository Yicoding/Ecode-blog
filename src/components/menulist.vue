<template>
  <div>
    <mt-search v-model="searchContent" placeholder="请输入商品名"></mt-search>
    <div class="order-tabs">
      <el-tabs v-model="activeName">
        <el-tab-pane label="默认" name="id"></el-tab-pane>
        <!--<el-tab-pane label="销量" name="num"></el-tab-pane>-->
        <el-tab-pane label="价格" name="price"></el-tab-pane>
        <el-tab-pane label="上架时间" name="createTime"></el-tab-pane>
      </el-tabs>
      <el-button v-show="order == 'ASC'" size="small" class="order-button" @click="byOrder('DESC')" style="color: #e4393c;">&uarr;</el-button>
      <el-button v-show="order == 'DESC'" size="small" class="order-button" @click="byOrder('ASC')" style="color: #e4393c;">&darr;</el-button>
    </div>
    <div v-show="listData.length > 0">
      <ul class="menu-ul">
        <li v-for="(item, index) in listData" :key="item.id" @click="jump(item)">
          <div class="menu-left">
            <img v-lazy="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <div style="overflow: hidden;">
              <h4 v-text="item.name"></h4>
              <p v-text="item.descript" style="padding: 10px 0;"></p>
              <div class="menu-num">共销售{{item.num}}&nbsp;&nbsp;&nbsp;共{{item.rateAllNum}}条评价</div>
            </div>
            <div class="munu-price">
              <div class="left" style="width: 40%;">
                &yen;{{item.price}}
              </div>
              <div class="menu-shop">
                <transition name="fade">
                  <div v-show="item.total > 0" class="shop-first" @click.stop="remove(item)">-</div>
                </transition>
                <transition name="fade">
                  <div v-show="item.total > 0" class="shop-second" v-text="item.total"></div>
                </transition>
                <div class="shop-third" @click.stop="add(item)">+</div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div v-show="listData.length == 0" class="empty-content">没有查到符合你要求的商品哦，换个名称试试 --</div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      searchContent: null,
      activeName: null,
      order: 'ASC',
      listData: [],
    }
  },
  watch: {
    activeName (value) {
      if (value) {
        console.log(value)
        if (this.searchContent) {
          this.likeName()
        } else {
          this.findall()
        }
      }
    },
    searchContent (value) {
      console.log(value)
      this.likeName()
    },
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  created () {
    this.activeName = 'id'
  },
  // activated () {
  //   this.activeName = 'id'
  // },
  methods: {
    byOrder (value) {
      this.order = value
      if (this.searchContent) {
        this.likeName()
      } else {
        this.findall()
      }
    },
    findall () {
      this.$http.get(this.resource + '/api/menu/findall/' + this.activeName + '/' + this.order).then((res) => {
        this.listData = []
        res.data.forEach((item) => {
          item.total = 0
          this.$http.get(this.resource + '/api/menu/saleNum', {params: {menu_id: item.id}}).then((result) => {
            if (result.data.nums) {
              item.num = result.data.nums
            } else {
              item.num = 0
            }
            this.$http.get(this.resource + '/api/rateAllNum/rate', {params: {menu_id: item.id}}).then((response) => {
              item.rateAllNum = response.data.rateAllNum
              this.listData.push(item)
            })
          })
        })
      })
    },
    likeName () {
      this.$http.get(this.resource + '/api/menu/like', {params: {name: this.searchContent, type: this.activeName, order: this.order}}).then((res) => {
        this.listData = []
        res.data.forEach((item) => {
          item.total = 0
          this.$http.get(this.resource + '/api/menu/saleNum', {params: {menu_id: item.id}}).then((result) => {
            if (result.data.nums) {
              item.num = result.data.nums
            } else {
              item.num = 0
            }
            this.$http.get(this.resource + '/api/rateAllNum/rate', {params: {menu_id: item.id}}).then((response) => {
              item.rateAllNum = response.data.rateAllNum
              this.listData.push(item)
            })
          })
        })
      })
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    add (item) {
      item.total ++
      this.$http.put(this.resource + '/api/shop/put', {user_id: this.user.id, menu_id: item.id, action: 'add'}).then((res) => {
        console.log(JSON.stringify(res.data))
        this.$store.dispatch('getonechangeNum', 'add')
      })
    },
    remove (item) {
      item.total --
      this.$http.delete(this.resource + '/api/shop/remove', {params: {user_id: this.user.id, menu_id: item.id}}).then((res) => {
        console.log(JSON.stringify(res.data))
        this.$store.dispatch('getonechangeNum', 'remove')
      })
    },
    // 跳转到单个商品详情
    jump (item) {
      this.$router.push({path: '/' + this.user.role.name + '/menuinfo', query: {id: item.id}})
    },
  }
}
</script>

<style>

</style>
