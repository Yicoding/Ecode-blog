<template>
  <div class="footer-menu">
    <div v-for="item in menuList" :key="item.tab" class="bar">
        <div v-if="!item.showMenu">
          <router-link :to="item.link" class="tab">
              <span :class="item.icon"></span> 
              <span>{{item.tab}}</span>
          </router-link>
          <span v-show="shopNum > 0 && item.showNum" class="shop-ball">{{shopNum}}</span>
        </div>
        <div v-else @click="sheetVisible = true">
          <a class="tab" :class="system?'active':''">
            <span :class="item.icon"></span>
            <span>{{item.tab}}</span>
          </a>
        </div>
    </div>
    <mt-actionsheet :actions="actions" v-model="sheetVisible"></mt-actionsheet>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  data() {
    return {
      sheetVisible: false,
      actions: [],
    }
  },
  computed: {
    shopNum () {
      return this.$store.state.shopNum
    },
    system() {
      if (this.$route.path == '/root/system/user' || this.$route.path == '/root/system/part' || this.$route.path == '/root/system/role') {
        return true
      } else {
        return false
      }
    },
    ...mapGetters([
      'menuList'
    ])
  },
  mounted() {
    this.actions = [
        {name: '员工管理', method: this.jumpUser},
        {name: '部门管理', method: this.jumpPart},
        {name: '角色管理', method: this.jumpRole}
      ]
  },
  methods: {
    jumpUser() {
      this.$router.push('/root/system/user')
    },
    jumpPart() {
      this.$router.push('/root/system/part')
    },
    jumpRole() {
      this.$router.push('/root/system/role')
    },
  }
}
</script>

<style scoped>
  .shop-ball {
    display: block; 
    position: absolute; 
    top: -5px; 
    right: 30%; 
    width: 25px; 
    height: 25px; 
    line-height: 25px; 
    border-radius: 50%; 
    background-color: #FF4949; 
    color: #fff; 
    font-size: 0.7em;
  }
</style>
