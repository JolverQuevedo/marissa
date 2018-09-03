<% Response.CacheControl = "no-cache" %>
<% Response.Buffer = true %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Rhin</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1,
      maximum-scale=1, user-scalable=no, minimal-ui">
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

  <link rel="stylesheet" href="/marissa/css/bootstrap.min.css">
  <script src="/marissa/js/jquery.min.js"></script>
  <script src="/marissa/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/marissa/css/jquery.dataTables.css">
  <script type="text/javascript" charset="utf8" src="/marissa/js/jquery.dataTables.js"></script>
  <script src="/marissa/js/vue.min.js"></script>
  <script src="/marissa/js/axios.min.js"></script>



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
		  user:function(){
			if(localStorage.getItem("user")!= null){
				window.location.href="/marissa/guias.asp"
			}
		  },
		  
		  login:function(){
			  var usuario=$("#txtusuario").val();
			  var clave=$("#txtclave").val();
			  var cad="/marissa/lists/login.asp?usuario="+usuario+"&clave="+clave;
			  console.log(cad);
			axios.get(cad).then(
				function(res){
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