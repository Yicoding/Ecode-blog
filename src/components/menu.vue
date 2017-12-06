<template>
  <div>
    <mt-search v-model="value"></mt-search>
    <el-tabs v-model="activeName">
      <el-tab-pane label="默认" name="id"></el-tab-pane>
      <el-tab-pane label="销量" name="num"></el-tab-pane>
      <el-tab-pane label="价格" name="price"></el-tab-pane>
    </el-tabs>
    <div>
      <ul class="menu-ul">
        <li v-for="(item, index) in listData" :key="item.id">
          <div class="menu-left">
            <img :src="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <h4 v-text="item.name"></h4>
            <p v-text="item.desc"></p>
            <div class="menu-num">月售{{item.num}}&nbsp;&nbsp;&nbsp;共{{item.num}}条评价</div>
            <div class="munu-price">
              &yen;{{item.price}}
              <div class="menu-shop">
                <transition name="fade">
                  <div v-if="item.total > 0" class="shop-first" @click="remove(item)">-</div>
                </transition>
                <transition name="fade">
                  <div v-if="item.total > 0" class="shop-second" v-text="item.total"></div>
                </transition>
                <div class="shop-third" @click="add(item)">+</div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      value: null,
      activeName: null,
      order: 'ASC',
      listData: [],
    }
  },
  watch: {
    activeName (value) {
      if (value) {
        console.log(value)
        if (value == 'num') {
          this.order = 'DESC'
        } else {
          this.order = 'ASC'
        }
        this.$http.get(this.resource + '/api/menu/findall/' + value + '/' + this.order).then((res) => {
          this.listData = res.data.map((item) => {
            item.total = 0
            return item
          })
        })
      }
    }
  },
  created () {
    this.activeName = 'id'
  },
  // activated () {
  //   this.activeName = 'id'
  // },
  methods: {
    add (item) {
      item.total ++
    },
    remove (item) {
      item.total --
    },
  }
}
</script>

<style>

</style>
