<template>
  <div style="background: #eee;">
  	<div style="height: 10px;"></div>
    <!-- 系统管理员 -->
    <div v-if="user.role && user.role.name == 'root'">
     <mt-cell title="个人信息" is-link to="/root/mine/mineinfo"></mt-cell>
     <!--<div style="height: 5px;"></div>
     <mt-cell title="用户意见" is-link to="/root/mine/useroption"></mt-cell>
     <div style="height: 5px;"></div>
  	 <mt-cell title="个性签" is-link to="/root/mine/sign"></mt-cell>-->
    </div>
    <!-- 部门管理员 -->
    <div v-if="user.role && user.role.name == 'admin'">
     <mt-cell title="个人信息" is-link to="/admin/mine/mineinfo"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的收藏" is-link to="/admin/mine/collect"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的订单" is-link to="/admin/mine/mineorderlist"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的评价" is-link to="/admin/mine/minerate"></mt-cell>
     <!--<div style="height: 5px;"></div>
     <mt-cell title="意见反馈" is-link to="/admin/mine/useroption"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="个性签" is-link to="/admin/mine/sign"></mt-cell>-->
     <div style="height: 5px;"></div>
     <mt-cell title="我的积分">120</mt-cell>
    </div>
    <!-- 普通员工 -->
    <div v-if="user.role && user.role.name == 'general'">
     <mt-cell title="个人信息" is-link to="/general/mine/mineinfo"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的收藏" is-link to="/general/mine/collect"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的订单" is-link to="/general/mine/mineorderlist"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="我的评价" is-link to="/general/mine/minerate"></mt-cell>
     <!--<div style="height: 5px;"></div>
     <mt-cell title="意见反馈" is-link to="/general/mine/useroption"></mt-cell>
     <div style="height: 5px;"></div>
     <mt-cell title="个性签" is-link to="/general/mine/sign"></mt-cell>-->
     <div style="height: 5px;"></div>
     <mt-cell title="我的积分">350</mt-cell>
    </div>
    <mt-button type="danger" size="large" @click.native="logout" style="position: fixed; bottom: 45px;">退出账号</mt-button>
    <div></div>
    <canvas v-show="!timeup" id="canvas">你的浏览器不支持canvas,请更换浏览器</canvas>
  </div>
</template>

<script>
export default {
  computed: {
    user () {
      return this.$store.state.user
    },
    timeup () {
      return this.$store.state.timeup
    },
  },
  created () {
  	console.log(JSON.stringify(this.user))
  },
  mounted () {
    this.$nextTick(function () {
      // 代码保证 this.$el 在 document 中
      var varrt = setInterval(() => {
        if (!this.timeup) {
          window.clearInterval(varrt)
          var can = document.getElementById('canvas');
          //设置canvas的绘图环境
          var ctx = can.getContext('2d');
          can.style.backgroundColor = 'black'
          can.style.position = 'fixed'
          can.style.top = 0
          can.style.left = 0
          can.style.right = 0
          can.style.bottom = 0
          can.style.zIndex = 9999


          //设置画布的宽高
          var w = can.width =  document.body.clientWidth,
            h = can.height = document.body.scrollHeight;
          window.onresize = function(){
              w = can.width =  document.body.clientWidth,
            h = can.height = document.body.scrollHeight;
          }
          //创建雨滴对象
          function Drop () {
            
          }
          //给对象添加原型
          Drop.prototype = {
            //初始化雨滴属性
            init: function() {
              this.x = random(0, w);
              this.y = 0;
              this.vy =random(4,5);  //生成随机速度值
              this.h = random(h*0.9, h*0.98);
              this.r = 1;//圆形半径
              this.vr = 1; //圆形半径增大值说
            },
            //绘制雨滴
            draw: function() {
                //绘制圆形
                ctx.strokeStyle='#33ffcc'
                ctx.beginPath();//开始路径
                ctx.arc(this.x,this.y,this.r,Math.PI*2,false);
                ctx.stroke();
              
              
              //更新坐标
              this.update();
            },
            //更新坐标
            update:function() {
              if (this.y < this.h) {
                //更新速度
                this.y += this.vy;
              }else{
                ctx.clearRect(0,0,w,h);//清除矩形
                
              }
              
            }
          }
          var drops=[];
          for(var i=0;i<30; i++){
            
            setTimeout(function(){
              var drop=new Drop();
              drop.init();
              drops.push(drop);
            },i*200);
          }
          setInterval(function(){
            ctx.fillStyle='rgba(0,0,0,0.1)';
            ctx.fillRect(0,0,w,h);
            for(i=0;i<drops.length; i++){
              drops[i].draw();
            }
          },30);
          
          
          
          
          
          
          
          function random(min,max) {
            return Math.random() * (max - min) + min;//min-max
          }
          setTimeout(() => {
            this.$store.dispatch('getTimeup', true)
          },10000)
        }
      },50)
    })
  },
  methods: {
    logout () {
      this.$http.get(this.resource + '/api/loginfo/logout', {params: {name: this.loginname}}).then((res) => {
        this.$message({
          showClose: true,
          message: '退出成功，下次再见呦',
          type: 'success'
        });
        window.sessionStorage.clear()
        this.$store.dispatch('getUser', '')
        this.$router.push('/login')
      })
    },
  }
}
</script>

<style>

</style>
