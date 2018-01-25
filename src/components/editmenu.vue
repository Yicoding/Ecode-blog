<template>
	<div>
		<div style="padding: 5px 10px;">
      		<el-button size="small" icon="el-icon-arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
	    </div>
	    <div class="split"></div>
	    <div class="cover-img">
	    	<img v-lazy="menu.picture" alt="" v-show="menu.picture"/>
	    	<div class="div-top"></div>
	    	<form enctype="multipart/form-data" id="formExcel">
    			<a href="javascript:;" class="file">
    				<span>{{menu.picture? '修改封面图片' : '添加封面图片'}}</span>
    				<input type="file" name="image" id="image" accept="image/*"/>
    			</a>
    		</form>
	    	<div class="div-top"></div>
	    </div>
	    <mt-field label="商品名称" placeholder="请输入商品名称" v-model.trim="menu.name"></mt-field>
	    <mt-field label="单价" placeholder="请输入单价" type="number" v-model="menu.price"></mt-field>
	    <mt-field label="商品描述" placeholder="请输入商品描述" type="textarea" rows="4" v-model.trim="menu.descript"></mt-field>
	    <mt-button style="position: fixed; bottom: 50px; z-index: 2000;" v-if="method == 'add'" size="large" type="danger" @click="save">保存</mt-button>
	    <mt-button style="position: fixed; bottom: 50px; z-index: 2000;" v-if="method == 'edit'" size="large" type="danger" @click="save">保存</mt-button>
	    <div class="div-top"></div>
	    <div class="split"></div>
	    <div style="text-align: center;" v-show="method == 'edit'">
	    	<div class="div-top"></div>
		    <el-upload
		      name="image"
		      :action="action"
		      :data="extradata"
		      :file-list="fileList"
		      :on-success="handleAvatarSuccess"
		      :on-remove="handleRemove"
		      list-type="picture-card">
		      <i class="el-icon-plus"></i>
		    </el-upload>
	    </div>
	    <div style="height: 50px;"></div>
	</div>
</template>

<script>
import { MessageBox } from 'mint-ui'
export default {
	data () {
		return {
			method: null,
			menu: {
				id: null,
				name: null,
				price: null,
				descript: null,
				picture: null,
				createTime: null,
			},
			action: null,
			menu_id: null,
			fileList: [],
			extradata: {},
		}
	},
	computed: {
  		user () {
	    	return this.$store.state.user
  		}
	},
	created () {
		this.action = this.resource + '/api/img/menulist'
		this.menu_id = window.sessionStorage.getItem('menu_id')
		this.method = window.sessionStorage.getItem('method')
		this.extradata = {menu_id: this.menu_id}
		if (this.method == 'edit') {
			this.$http.get(this.resource + '/api/menu/findone', {params: {id: this.menu_id}}).then((res) => {
				this.menu = res.data
			})
			this.findImgArr()
		}
	},
	mounted () {
		this.$nextTick(function () {
		    // 代码保证 this.$el 在 document 中
		    document.getElementById('image').onchange = () => {
		    	// console.log('change')
		    	let formData = new FormData(document.getElementById('formExcel'))
		    	this.$http.post(this.resource + '/api/img/menucover', formData).then((response) => {
			      // console.log(response.data.filename)
			      this.menu.picture = 'static/menucover/' + response.data.filename
			    },(response) => {
			      this.$toast('上传失败，请检查')
			    })
		    }
	  	})
	},
	methods: {
		findImgArr () {
			this.$http.get(this.resource + '/api/menu/imgArr', {params: {menu_id: this.menu_id}}).then((res) => {
				this.fileList = res.data.map((item) => {
					return {url: item.src}
				})
			})
		},
		save () {
			if (!this.menu.picture) {
				this.$toast('封面图片不能为空')
			} else if (!this.menu.name) {
				this.$toast('商品名称不能为空')
			} else if (!this.menu.price) {
				this.$toast('单价不能为空')
			} else if (!this.menu.descript) {
				this.$toast('商品描述不能为空')
			} else {
				if (this.method == 'add') {
					this.menu.createTime = this.changedate(new Date(), 'yyyy-MM-dd HH:mm:ss')
					this.$http.post(this.resource + '/api/menu/add', this.menu).then((res) => {
						this.method = 'edit'
						window.sessionStorage.setItem('method', 'edit')
						this.$toast('保存成功了呦')
						window.sessionStorage.setItem('menu_id', res.data.insertId)
						this.menu_id = res.data.insertId
						this.menu.id = res.data.insertId
						this.extradata = {menu_id: res.data.insertId}
					})
				} else {
					this.$http.put(this.resource + '/api/menu/edit', this.menu).then((res) => {
						this.$toast('保存成功了呦')
					})
				}
			}
		},
		handleAvatarSuccess(res, file) {
	        this.findImgArr()
      	},
		handleRemove(file, fileList) {
	        console.log(file);
	        this.findImgArr()
	        MessageBox.confirm('确定要删除该图片吗?').then(action => {
		        this.$http.delete(this.resource + '/api/imgArr/remove', {params: {src: file.url}}).then(() => {
	        		this.findImgArr()
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
	},
}
</script>

<style>
	
</style>