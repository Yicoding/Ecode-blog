<template>
  <div>
    <div style="height: 30px; background-color: #eee;"></div>
  	<ul class="menu-ul" v-show="listData.length > 0">
      <li v-for="(item, index) in listData" :key="item.id">
        <div style="float: left; width: 8%; height: 120px; position: relative;">
          <div class="radio-check" v-show="item.isCheck == 'false'" @click="checkLine(item)"></div>
          <div class="radio-not-check" v-show="item.isCheck == 'true'" @click="checkLine(item)">&radic;</div>
        </div>
        <div style="float: left; width: 92%;">
          <div class="menu-left-shop" @click="jump(item)">
            <img :src="item.picture" alt=""/>
          </div>
          <div class="menu-right">
            <div @click="jump(item)">
              <h4 v-text="item.name"></h4>
              <p style="margin-top: 12px;" v-text="item.desc"></p>
            </div>
            <div class="munu-price">
              <div class="left" style="width: 40%;" @click="jump(item)">
                &yen;{{item.price}}
              </div>
              <div class="menu-shop">
                <transition name="fade">
                  <div v-if="item.total > 1" class="shop-first" @click="remove(item)">-</div>
                </transition>
                <transition name="fade">
                  <div v-if="item.total > 0" class="shop-second" v-text="item.total"></div>
                </transition>
                <div class="shop-third" @click="add(item)">+</div>
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
    <div v-show="listData.length == 0" class="empty-content">购物车空空如也，快去一些添加进来吧 ----</div>
    <div style="height: 45px;"></div>
    <div class="shop-footer">
      <div class="shop-footer-left">
        <div style="float: left; height: 50px; position: relative;">
          <div class="radio-check-foot" v-show="!isCheckAll" @click="CheckAll('true')"></div>
          <div class="radio-not-check-foot" v-show="isCheckAll" @click="CheckAll('false')">&radic;</div>
        </div>
        <mt-button class="left" size="small" type="danger" :plain="true" style="margin: 8px 5px 0 15px;" @click="deleteCheck">删除</mt-button>
        <div class="left">合计：&yen;{{priceAll}}</div>
      </div>
      <div class="shop-footer-right" @click="gosettle">去结算 <span style="font-size: 0.8em;">({{checkNum}})</span></div>
    </div>
  </div>
</template>

<script>
import { MessageBox } from 'mint-ui'
export default {
  activated () {
    setTimeout(() => {
      this.findall()
    }, 500)
  },
  data () {
    return {
      listData: [],
      isCheckAll: false,
      checkNum: 0,
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    },
    shopNum () {
      return this.$store.state.shopNum
    },
    priceAll () {
      return this.$store.state.priceAll
    },
  },
  methods: {
    findall () {
      this.checkNum = 0
      this.isCheckAll = false
      this.$http.get(this.resource + '/api/shop/findall', {params: {uid: this.user.id}}).then(res => {
        if (res.data.length > 0) {
          console.log(JSON.stringify(res.data))
          this.listData = res.data
          let priceAll = 0
          let isAll = true
          res.data.forEach((item) => {
            if (item.isCheck == 'true'){
              priceAll += item.total * item.price
              this.checkNum += item.total
            } else {
              isAll = false
            }
          })
          isAll && (this.isCheckAll = true)
          this.$store.dispatch('getpriceAll', priceAll)
        } else {
          this.listData = []
          this.$store.dispatch('getpriceAll', 0)
        }
      })
    },
    checkLine (item) {
      console.log(item.isCheck)
      if (item.isCheck == 'true') {
        this.checkNum -= item.total
        this.isCheckAll = false
        item.isCheck = 'false'
        this.$store.dispatch('getonepriceAll', {action: 'remove', price: item.price * item.total})
        this.$http.put(this.resource + '/api/shop/changeone', {isCheck: 'false', user_id: this.user.id, menu_id: item.menu_id}).then(() => {
          
        })
      } else {
        this.checkNum += item.total
        console.log(JSON.stringify(this.listData))
        item.isCheck = 'true'
        this.$store.dispatch('getonepriceAll', {action: 'add', price: item.price * item.total})
        this.$http.put(this.resource + '/api/shop/changeone', {isCheck: 'true', user_id: this.user.id, menu_id: item.menu_id}).then(() => {
          let isAll = true
          this.listData.forEach((item) => {
            if (item.isCheck == 'false'){
              isAll = false
            }
          })
          isAll && (this.isCheckAll = true)
        })
      }
    },
    CheckAll (value) {
      this.isCheckAll = !this.isCheckAll
      this.$http.put(this.resource + '/api/shop/multiple', {isCheck: value, user_id: this.user.id}).then(() => {
        this.findall()
      })
    },
    add (item) {
      item.total ++
      this.$http.put(this.resource + '/api/shop/put', {user_id: this.user.id, menu_id: item.menu_id, action: 'add'}).then((res) => {
        console.log(JSON.stringify(res.data))
        this.$store.dispatch('getonechangeNum', 'add')
        if (item.isCheck == 'true') {
          this.checkNum ++
          this.$store.dispatch('getonepriceAll', {action: 'add', price: item.price})
        }
      })
    },
    remove (item) {
      item.total > 1 && item.total --
      && this.$http.put(this.resource + '/api/shop/put', {user_id: this.user.id, menu_id: item.menu_id, action: 'remove'}).then((res) => {
        console.log(JSON.stringify(res.data))
        this.$store.dispatch('getonechangeNum', 'remove')
        if (item.isCheck == 'true') {
          this.checkNum --
          this.$store.dispatch('getonepriceAll', {action: 'remove', price: item.price})
        }
      })
    },
    // 删除选中的商品
    deleteCheck () {
      let dataArr = []
      this.listData.forEach((item) => {
        if (item.isCheck == 'true') {
          dataArr.push(item.menu_id)
        }
      })
      if (dataArr.length > 0) {
        MessageBox.confirm('确定要删除选中的商品吗?').then(action => {
          // console.log(JSON.stringify(this.listData))
          // console.log(dataArr)
          // console.log(String(dataArr))
          this.$http.delete(this.resource + '/api/shop/deleteCheck', {params: {data: String(dataArr), user_id: this.user.id}}).then((res) => {
            this.findall()
            this.$toast('删除成功')
            this.$http.get(this.resource + '/api/shop/findall', {params: {uid: this.user.id}}).then(result => {
              let num = 0
              result.data.forEach((item) => {
                num += item.total
              })
              this.$store.dispatch('getshopNum', num)
            })
          })
        })
      } else {
        this.$toast('请至少选中一件商品才能删除')
      }
    },
    // 跳转到单个商品详情
    jump (item) {
      this.$router.push({path: '/' + this.user.role.name + '/menuinfo', query: {id: item.menu_id}})
    },
    // 去结算
    gosettle () {
      let dataArr = []
      this.listData.forEach((item) => {
        if (item.isCheck == 'true') {
          dataArr.push(item.menu_id)
        }
      })
      if (dataArr.length > 0) {
        MessageBox.confirm('确定要购买选中的商品吗?').then(action => {
          this.$router.push({path: '/orderlist', query: {dataArr: String(dataArr), priceAll: this.priceAll}})
        })
      } else {
        this.$toast('您还没有选择商品哦')
      }
    },
  }
}
</script>

<style>

</style>
