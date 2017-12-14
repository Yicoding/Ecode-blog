<template>
	<div>
		<div style="padding: 5px 10px;">
		  <el-button size="small" icon="arrow-left" type="text" @click="$router.go(-1)">返回</el-button>
		</div>
		<div class="split"></div>
		<vueSignature ref="signature" :sigOption="option" :w="'100%;'" :h="'300px'"></vueSignature> 
		<!--<vueSignature ref="signature1" :sigOption="option"></vueSignature>--> 
		<div style="text-align: center;">
			<button @click="save">保存</button>
			<button @click="clear">清除</button>
		</div>
		<img style="width: 100%;" :src="bindSrc" alt=""/>
	</div>
</template>

<script>
export default {
	data() {
		return {
			option:{
				penColor:"rgb(0, 0, 0)"
			},
			bindSrc: null,
		}
	},
	methods:{
		save () {
			var png = this.$refs.signature.save()
			var jpeg = this.$refs.signature.save('image/jpeg')
			var svg = this.$refs.signature.save('image/svg+xml')
			// console.log(png)
			// console.log(jpeg)
			// console.log(svg)
			console.log(png.length)
			this.bindSrc = svg
		},
		clear () {
			this.$refs.signature.clear();
		}
	}
};
</script>