<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>RHIN</title>
  <meta name="viewport" content="width=device-width, initial-scale=1,
      maximum-scale=1, user-scalable=no, minimal-ui">
  <link rel="stylesheet" href="https://bootswatch.com/3/flatly/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div id="app" class="container">
    <nav class="navbar navbar-default " style="border-radius: 0px">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">RHIN</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="./index.asp">Login</a></li>
					
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	<div class="row col-md-4 col-md-offset-4">
		<div class="form-group">
			<label >Usuario</label>
			<input type="text" id="txtusuario" class="form-control">
		</div>
		<div class="form-group">
			<label >Contraseña</label>
			<input type="password" id="txtclave" class="form-control">
		</div>
		<div class="form-group">
			<button class="btn btn-primary btn-block" v-on:click="login()">Ingresar</button>
		</div>
	</div>
</div>


  <!--VUE-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script>
    var app = new Vue({
      el: '#app',
      data: {
        list: [],
        facturas:[],
        oc:[]
      },
      mounted: function () {
        this.user();
      },
      methods: {
		  user(){
			if(localStorage.getItem("user")!= null){
				window.location.href="/marissa/guias.asp"
			}
		  },
		  
		  login(){
			  var usuario=$("#txtusuario").val();
			  var clave=$("#txtclave").val();
			  var cad="/marissa/lists/login.asp?usuario="+usuario+"&clave="+clave;
			  console.log(cad);
			axios.get(cad).then(
				res=>{
					console.log(res);
					if(res.data.data.length >0){
						window.location.href="/marissa/guias.asp"
						localStorage.setItem("user",res.data.data[0].USUARIO)
					}
				}
			);


			

		  }
		  
      }
    });
  </script>



</body>

</html>