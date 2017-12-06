<template>
  <div>
    <div style="height: 30px; background-color: #eee;"></div>
  	<ul class="menu-ul">
      <li v-for="(item, index) in listData" :key="item.id">
        <div style="float: left; width: 8%; height: 120px; position: relative;">
          <div class="radio-check" v-show="item.isCheck" @click="checkLine(item)"></div>
          <div class="radio-not-check" v-show="!item.isCheck" @click="checkLine(item)">&radic;</div>
          <!--<input type="radio" value="true" v-model="item.isCheck" @click="checkLine(item)" style="position: absolute; top: 70px; display: block; width: 22px; height: 22px;"/>-->
        </div>
        <div style="float: left; width: 92%;">
          <div class="menu-left-shop">
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
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  created () {
    setTimeout(() => {
      this.findall()
    }, 500)
  },
  data () {
    return {
      listData: [],
    }
  },
  computed: {
    user () {
      return this.$store.state.user
    }
  },
  methods: {
    findall () {
      this.$http.get(this.resource + '/api/shop/findall', {params: {uid: this.user.id}}).then(res => {
        console.log(JSON.stringify(res.data))
        this.listData = res.data
      })
    },
    checkLine (item) {
      console.log(item.isCheck)
      item.isCheck = !item.isCheck
    },
    add (item) {
      item.total ++
    },
    remove (item) {
      item.total > 1 && item.total --
    },
  }
}
</script>

<style>

</style>
