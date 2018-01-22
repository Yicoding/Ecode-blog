<template>
	<div>
		<div style="padding: 5px 10px;">
      		<el-button size="small" icon="arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
	    </div>
	    <div class="split"></div>
	    <div class="cover-img">
	    	<div class="user-img">
		      <img v-if="user.avatar" :src="user.avatar" alt=""/>
		      <img v-if="!user.avatar" :src="avatar" alt=""/>
		    </div>
	    	<div class="div-top"></div>
	    	<form enctype="multipart/form-data" id="formExcel">
    			<a href="javascript:;" class="file">
    				<span>更换头像</span>
    				<input type="file" name="image" id="image" accept="image/*"/>
    			</a>
    		</form>
	    	<div class="div-top"></div>
	    </div>
	    <mt-field label="昵称" placeholder="请输入昵称" v-model.trim="user.name"></mt-field>
	    <mt-field label="年龄" placeholder="请输入年龄" type="number" v-model="user.age"></mt-field>
	    <mt-field label="个性签名" placeholder="请输入个性签名" type="textarea" rows="4" v-model.trim="user.minesign"></mt-field>
	    <div class="split"></div>
	    <mt-cell title="请绘制你的艺术签"></mt-cell>
	    <div style="margin: 10px; border: 1px solid #aaa; border-radius: 3px; overflow: hidden;">
	    	<vueSignature ref="signature" :sigOption="option" :w="'100%;'" :h="'200px'"></vueSignature>
	    </div>
	    <el-button style="margin-left: 10px;" size="small" @click="clear">重新绘制</el-button>
	    <mt-button style="position: fixed; bottom: 0;" size="large" type="danger" @click="save">保存</mt-button>
	    <div class="div-top"></div>
	    <div class="split"></div>
	</div>
</template>

<script>
import vueSignature from "components/vue-signature.vue"
import { MessageBox } from 'mint-ui'
export default {
	data () {
		return {
			avatar: 'static/user/defaultimg.jpg',
			option:{
				penColor:"rgb(0, 0, 0)"
			},
		}
	},
	components: {
		vueSignature
	},
	computed: {
  		user () {
	    	return this.$store.state.user
  		}
	},
	created () {

	},
	mounted () {
		this.$nextTick(function () {
		    // 代码保证 this.$el 在 document 中
		    document.getElementById('image').onchange = () => {
		    	// console.log('change')
		    	let formData = new FormData(document.getElementById('formExcel'))
		    	formData.append('id', this.user.id)
		    	this.$http.post(this.resource + '/api/img/user', formData).then((response) => {
			      // console.log(response.data.filename)
			      this.user.avatar = 'static/user/' + response.data
			      // this.$http.get(this.resource + '/api/user/findone', {params: {id: this.user.id}}).then((res) => {
			      //   this.$store.dispatch('getUser', res.data)
			      // })
			    },(response) => {
			      this.$toast('上传失败，请检查')
			    })
		    }
	  	})
	},
	methods: {
		clear () {
			this.$refs.signature.clear();
		},
		save () {
			let png = this.$refs.signature.save()
			let jpeg = this.$refs.signature.save('image/jpeg')
			let svg = this.$refs.signature.save('image/svg+xml')
			console.log(png)
			// console.log(jpeg)
			// console.log(svg)
			// console.log(svg.length)
			console.log(png.length)
			this.user.artsign = png
			if (!this.user.name) {
				this.$toast('昵称不能为空')
			} else if (!this.user.age) {
				this.$toast('年龄不能为空')
			} else {
				this.$http.put(this.resource + '/api/user/selfedit', this.user).then((res) => {
					this.$toast('保存成功了呦')
					this.$http.get(this.resource + '/api/user/loginname', {params: {id: this.user.id}}).then((res) => {
			        	this.$store.dispatch('getUser', res.data)
			        })
				})
			}
		},
	},
}
</script>

<style>
	
</style>