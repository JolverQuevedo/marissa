<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Listado real</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>

	<div id="movcab">
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script>
		var movcab = new Vue({
			el:'#movcab',
			data:{
				list:{}
			},
			mounted:function(){
				this.jalaData();
			},
			methods:{
				jalaData:function(){
					axios.get("http://localhost/marissa/lists/cabecerareal.asp").then(res=>{
						this.list=res.data.data;
					});
				}
			}
		});
	</script>
</body>
</html>