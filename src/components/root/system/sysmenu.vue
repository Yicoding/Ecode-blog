<template>
  <div>
    <mt-search v-model="searchContent" placeholder="请输入商品名"></mt-search>
    <div class="order-tabs">
      <el-tabs v-model="activeName">
        <el-tab-pane label="默认" name="id"></el-tab-pane>
        <el-tab-pane label="价格" name="price"></el-tab-pane>
        <el-tab-pane label="上架时间" name="createTime"></el-tab-pane>
      </el-tabs>
      <el-button size="small" class="add-button" @click="add" style="color: #20A0FF;" icon="el-icon-plus"></el-button>
      <el-button v-show="order == 'ASC'" size="small" class="order-button" @click="byOrder('DESC')" style="color: #e4393c;">&uarr;</el-button>
      <el-button v-show="order == 'DESC'" size="small" class="order-button" @click="byOrder('ASC')" style="color: #e4393c;">&darr;</el-button>
    </div>
    <div v-show="listData.length">
      <ul class="menu-ul">
        <li v-for="item in listData" :key="item.id" @click="jump(item)">
          <div class="menu-left">
            <img v-lazy="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <div style="overflow: hidden;">
              <h4 v-text="item.name"></h4>
              <p v-text="item.descript" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; padding: 5px 0;"></p>
              <div class="menu-num">共销售{{item.num}}&nbsp;&nbsp;&nbsp;共{{item.rateAllNum}}条评价</div>
            </div>
            <div class="munu-price">
              <div class="left" style="width: 40%;">
                &yen;{{item.price}}
              </div>
              <div class="menu-shop">
                <el-button icon="el-icon-edit" type="text" @click.stop="edit(item)"></el-button>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <transition name="fade">
      <div v-show="!listData.length && searchContent" class="empty-content">没有查到符合你要求的商品哦，换个名称试试 --</div>
    </transition>
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
    },
  },
  created () {
    this.activeName = 'id'
  },
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
    // 添加菜单
    add (item) {
      this.$router.push({path: '/editmenu'})
      window.sessionStorage.setItem('method', 'add')
    },
    // 编辑菜单
    edit (item) {
      this.$router.push({path: '/editmenu', query: {id: item.id}})
      window.sessionStorage.setItem('method', 'edit')
      window.sessionStorage.setItem('menu_id', item.id)
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
