<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Guias</title>
  <meta name="viewport" content="width=device-width, initial-scale=1,
      maximum-scale=1, user-scalable=no, minimal-ui">
  <link rel="stylesheet" href="https://bootswatch.com/3/flatly/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

  <div id="guias" class="container">
    <nav class="navbar navbar-default" style="border-radius: 0px">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false">
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
            <li class="active"><a href="./guias.asp">Guias</a></li>
            <li ><a href="./facturas.asp">facturas</a></li>
            <li><a href="./oc.asp">Ordenes Compra</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>


    <table>
      <tr>
        <td class="col-sm-6">
          <div class="row">
            <fieldset>
              <legend>Buscar:</legend>
              <div class="col-sm-4">
                <div class="form-group">
                  CLIENTE
                  <div class="col-sm-12">
                    <input type="text" class="form-control" id="txtbuscarcliente" placeholder="Cliente" autocomplete="off">
                  </div>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group">
                  Estilo
                  <div class="col-sm-12">
                    <input type="text" class="form-control" id="txtbuscarestilo" placeholder="Estilo" autocomplete="off">
                  </div>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group">
                  PO
                  <div class="col-sm-12">
                    <input type="text" class="form-control" id="txtbuscarpo" placeholder="Po" autocomplete="off">
                  </div>
                </div>
              </div>
              
              <div class="col-sm-12">
                <br>
                <button class="btn btn-primary btn-block " v-on:click="buscar()">Buscar</button>
              </div>
            </fieldset>
          </div>
  </div>

  </td>
  <td class="col-sm-6">
    <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">
      Nueva guia
    </button>
  </td>

  </tr>
  </table>
  <br>
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>presupuesto </th>
        <th>cliente </th>
        <th>po </th>
        <th>estilo </th>
        <th>serie </th>
        <th>numdoc </th>
        <th>proveedor </th>
        <th>fecha_emision </th>
        <th>fecha_traslado </th>
        <th>nro_orden</th>
        <th>corte</th>
        <th>num_prendas </th>
        <th>tip_servicio</th>

      </tr>
    </thead>
    <tbody>
      <tr style="cursor:pointer" v-for="item in list">
        <td v-for="c in item">{{c}}</td>

      </tr>
    </tbody>

  </table>


  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Nueva Guia</h4>
        </div>
        <div class="modal-body">


            <div class="row">
              <div class="form-group col-sm-6">
                <label id="lblproveedor">Proveedor</label>
                <div class="col-lg-12">
                  <input type="text" class="form-control" id="txtproveedor" onchange="console.log('');window.open('/marissa/help/hlpproveedores.asp?filtro='+document.getElementById('txtproveedor').value,'','width=600,height=500')" ondblclick="window.open('/marissa/help/hlpproveedores.asp?filtro='+document.getElementById('txtproveedor').value,'','width=600,height=500')"
                    placeholder="Proveedor" autocomplete="off">
                </div>
              </div>
            </div>
            <div class="row">
              
              
              <div class="form-group col-sm-6">
                Serie
                <div class="col-lg-12">
                  <input type="text" maxlength="3" class="form-control" id="txtserie" required placeholder="Serie" autocomplete="off">
                </div>
              </div>
              <div class="form-group  col-sm-6">
                Num Doc
                <div class="col-lg-12">
                  <input type="text"  maxlength="7" class="form-control" id="txtnumdoc" required placeholder="Num Doc" autocomplete="off">
                </div>
              </div>
              <div class="form-group col-sm-6">
                Fecha Emision
                <div class="col-lg-12">
                  <input type="date" class="form-control" id="txtfecemi" value="" required placeholder="Fecha Emisión" autocomplete="off">
                </div>
              </div>

              <div class="form-group  col-sm-6">
                Fecha Traslado
                <div class="col-lg-12">
                  <input type="date" class="form-control" value="" id="txtfectras" required placeholder="Fecha Traslado" autocomplete="off">
                </div>
              </div>
              
              <div class="form-group col-sm-12">
                Servicio
                <div class="col-lg-12">
                  <input type="text" class="form-control" id="txtservicio" required placeholder="Servicio" autocomplete="off">
                </div>
              </div>

              <div class="form-group col-sm-6">
                Presupuesto
                <div class="col-lg-12">
                  <input type="number" class="form-control" id="txtpresupuesto" required placeholder="Presupuesto" autocomplete="off">
                </div>
              </div>
              <div class="form-group col-sm-6">
                Cliente
                <div class="col-lg-12">
                  <input type="text" class="form-control" id="txtcliente" required placeholder="Cliente" autocomplete="off">
                </div>
              </div>
              <div class="form-group col-sm-6">
                Estilo
                <div class="col-lg-12">
                  <input type="text" class="form-control" id="txtestilo" required placeholder="Estilo" autocomplete="off">
                </div>
              </div>
              <div class="form-group col-sm-6">
                Po
                <div class="col-lg-12">
                  <input type="text" class="form-control" id="txtpo" required placeholder="Po" autocomplete="off">
                </div>
              </div>
              <div class="form-group col-sm-4">
                Corte
                <div class="col-lg-12">
                  <input type="text" class="form-control" id="txtcorte" required placeholder="Corte" autocomplete="off">
                </div>
              </div>

              <div class="form-group  col-sm-4">
                Num Prendas
                <div class="col-lg-12">
                  <input type="number" class="form-control" id="txtnumprend" required placeholder="Num Prendas" autocomplete="off">
                </div>
              </div>
              
              <div class="form-group  col-sm-4">
                <div class="col-lg-12">
                  Num Orden
                  <input type="text" class="form-control" id="txtnumord" required placeholder="Num Orden" autocomplete="off">
                </div>
              </div>
              

            </div>
            </div>
            <div class="form-group modal-footer">
              <div class="col-lg-10 col-lg-offset-2">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" v-on:click="grabarnuevaguia()">Guardar Guia</button>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
  </div>


  <!--VUE-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script>
    var app = new Vue({
      el: '#guias',
      data: {
        list: []
      },
      mounted: function () {
        this.getGuias();
      },
      methods: {
        getGuias: function () {
          axios.get("/marissa/lists/guias.asp").then(
            (res) => {
              console.log(res)
              this.list = (res.data.data);
            }
          ).catch(
            (error) => {

            }
          );
        },
		limpiarcampos:function(){
			$("#txtcliente").val("");
          	$("#txtestilo").val("");
			$("#txtpo").val("");
			$("#txtpresupuesto").val("");
			$("#txtserie").val("");
			$("#txtnumdoc").val("");
			$("#txtfecemi").val("");
          	$("#txtfectras").val("");
			$("#txtcorte").val("");
			$("#txtnumprend").val("");
			$("#txtnumord").val("");
			$("#txtservicio").val("");
      $("#txtproveedor").val("");
			},
		grabarnuevaguia:function(){
			var txtcliente=$("#txtcliente").val();
          	var txtestilo=$("#txtestilo").val();
			var txtpo=$("#txtpo").val();
			var txtpresupuesto=$("#txtpresupuesto").val();
      var txtproveedor=$("#txtproveedor").val();
			var txtserie=$("#txtserie").val();
			var txtnumdoc=$("#txtnumdoc").val();
			var txtfecemi=$("#txtfecemi").val();
          	var txtfectras=$("#txtfectras").val();
			var txtcorte=$("#txtcorte").val();
			var txtnumprend=$("#txtnumprend").val();
			var txtnumord=$("#txtnumord").val();
			var txtservicio=$("#txtservicio").val();
			
			if(txtcliente=="" || txtpresupuesto=="" || txtpo=="" || txtestilo=="" || txtnumdoc=="" || txtserie=="" || txtproveedor==""){
				alert("Llene los campos correctamente");
			}else{

			
			var cad = "/marissa/comun/insertguia.asp?";
			cad+="presupuesto="+txtpresupuesto;
			cad+="&cliente="+txtcliente;
			cad+="&po="+txtpo;
			cad+="&estilo="+txtestilo;
			cad+="&serie ="+txtserie;
			cad+="&numdoc="+txtnumdoc;
			cad+="&proveedor="+txtproveedor;
			cad+="&fecha_emision="+txtfecemi;
			cad+="&fecha_traslado="+txtfectras;
			cad+="&nro_orde="+txtnumord;
			cad+="&corte="+txtcorte;
			cad+="&num_prendas="+txtnumprend;
			cad+="&tip_servicio="+txtservicio;
			console.log(cad);
			axios.get(cad).then(
				(res) => {
					this.getGuias();
					this.limpiarcampos();
				}
			).catch(
				(error) => {
					this.list = [];
				}
			);
			}




		},
        buscar: function () {
          var estilo=$("#txtbuscarestilo").val();
          var po=$("#txtbuscarpo").val();
          var cliente=$("#txtbuscarcliente").val();
          axios.get("/marissa/lists/guias.asp?cliente="+cliente+"&po="+po+"&estilo="+estilo).then(
            (res) => {
              console.log(res)
              this.list = (res.data.data);
            }
          ).catch(
            (error) => {
              this.list = [];
            }
          );
        }
      }
    });
  </script>



</body>

</html>