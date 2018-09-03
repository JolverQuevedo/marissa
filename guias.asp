<% Response.CacheControl = "no-cache" %>
<% Response.Buffer = true %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Guias</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1,
      maximum-scale=1, user-scalable=no, minimal-ui">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <script src="./js/jquery.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css">
  <script type="text/javascript" charset="utf8" src="./js/jquery.dataTables.js"></script>
      <style>
         table{
         font-size:1.2rem;
         }
         body {
  min-height: 2000px;
  padding-top: 70px;
}
.pull-right2{
  position:absolute !important;right:0 !important
  }
      </style>
   </head>
   <body>
      <div id="guias" class="container-fluid">
         <nav class="navbar navbar-default navbar-fixed-top" style="border-radius: 0px">
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
                     <li class="active"><a href="./guias.asp">Guias</a></li>
                     <li><a href="./facturas.asp">facturas</a></li>
                     <li><a href="./oc.asp">Ordenes Compra</a></li>
                     <li class="pull-right2" v-on:click="cerrar()"><a >Cerrar Sesion</a></li>
                  </ul>
               </div>
               <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
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
      <table id="table" class="table table-bordered table-hover">
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
               <th>Estado</th>
               <th>Acción</th>
            </tr>
         </thead>
         <tbody>
            <tr style="cursor:pointer" v-for="item in list" v-on:dblclick="verDatos(item)">
               <td v-for="c in item">{{c}}</td>
               <td><button class="btn btn-danger btn-sm" v-on:click="eliminarguia(item)">Eliminar</button></td>
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
                           <input type="text" class="form-control" id="txtproveedor" onchange="console.log('');window.open('/marissa/help/hlpproveedores.asp?filtro='+document.getElementById('txtproveedor').value,'','width=600,height=500')" ondblclick="window.open('/marissa/help/hlpproveedores.asp?filtro='+document.getElementById('txtproveedor').value,'','width=600,height=500')" placeholder="Proveedor" autocomplete="off">
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
                           <input type="text" maxlength="7" class="form-control" id="txtnumdoc" required placeholder="Num Doc" autocomplete="off">
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
      <div class="modal fade" id="myModaldetalle" >
         <div class="modal-dialog" style="width:1200px">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title">Datos relacionados con la Guia</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
                  <h3 >Facturas</h3>
                  <table class="table table-hover">
                     <thead>
                        <th>#</th>
                        <th>cliente</th>
                        <th>po</th>
                        <th>estilo</th>
                        <th>serie</th>
                        <th>numdoc</th>
                        <th>fecha</th>
                        <th>numcheque</th>
                        <th>numletra</th>
                        <th>tipo</th>
                        <th>estado</th>
                        <th>Total</th>
                        <th>igv</th>
                     </thead>
                     <tbody>
                        <tr v-for="i in facturas">
                           <td v-for="col in i">{{col}}</td>
                        </tr>
                     </tbody>
                  </table>
                  <h3 >Ordenes de compra</h3>
                  <table class="table table-hover">
                     <thead>
                        <th># </th>
                        <th>cliente </th>
                        <th>po </th>
                        <th>estilo </th>
                        <th>nro_orden</th>
                        <th>proveedor</th>
                        <th>presupuesto </th>
                        <th>total</th>
                        <th>igv</th>
                     </thead>
                     <tbody>
                        <tr v-for="i in oc">
                           <td v-for="col in i">{{col}}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
      </div>
      <!--VUE-->
      <script src="./js/vue.min.js"></script>
    <script src="./js/axios.min.js"></script>
      <script>
         var app = new Vue({
              el: '#guias',
              data: {
                  list: [],
                  facturas: [],
                  oc: []
              },
              mounted: function() {
                  this.user();
                  this.getGuias();
              },
              methods: {
                  user: function() {
                      if (localStorage.getItem("user") == null) {
                          window.location.href = "/marissa/index.asp"
                      }
                  },
                  eliminarguia: function(item) {
                      var prov = item.proveedor;
                      var serie = item.serie;
                      var numdoc = item.numdoc;
                      var cad = "/marissa/comun/deleteguia.asp?";
                      cad += "prov=" + prov;
                      cad += "&serie=" + serie;
                      cad += "&numdoc=" + numdoc;
                      var that = this;

                      if (confirm("Deseas Eliminar la guia del prov: " + prov + " serie:" + serie + " numdoc:" + numdoc)) {
                          axios.get(cad).then(function(res) {
                              that.getGuias();
                              console.log(cad);
                          });
                      }
                  },
                  getGuias: function() {
                      var that = this;
                      axios.get("/marissa/lists/guias.asp").then(function(res) {
                          console.log(res);
                          that.list = res.data.data;
                          that.initDt();
                      }).catch(function(error) {});
                  },
                  limpiarcampos: function() {
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
                      $("#txtproveedor").removeAttr('readonly');
                      $("#lblproveedor").text("Proveedor");
                  },
                  grabarnuevaguia: function() {
                      var txtcliente = $("#txtcliente").val();
                      var txtestilo = $("#txtestilo").val();
                      var txtpo = $("#txtpo").val();
                      var txtpresupuesto = $("#txtpresupuesto").val();
                      var txtproveedor = $("#txtproveedor").val();
                      var txtserie = $("#txtserie").val();
                      var txtnumdoc = $("#txtnumdoc").val();
                      var txtfecemi = $("#txtfecemi").val();
                      var txtfectras = $("#txtfectras").val();
                      var txtcorte = $("#txtcorte").val();
                      var txtnumprend = $("#txtnumprend").val();
                      var txtnumord = $("#txtnumord").val();
                      var txtservicio = $("#txtservicio").val();
                      var that = this;
                      if (txtcliente == "" || txtpresupuesto == "" || txtpo == "" || txtestilo == "" || txtnumdoc == "" || txtserie == "" || txtproveedor == "") {
                          alert("Llene los campos correctamente");
                      } else {


                          var cad = "/marissa/comun/insertguia.asp?";
                          cad += "presupuesto=" + txtpresupuesto;
                          cad += "&cliente=" + txtcliente;
                          cad += "&po=" + txtpo;
                          cad += "&estilo=" + txtestilo;
                          cad += "&serie =" + txtserie;
                          cad += "&numdoc=" + txtnumdoc;
                          cad += "&proveedor=" + txtproveedor;
                          cad += "&fecha_emision=" + txtfecemi;
                          cad += "&fecha_traslado=" + txtfectras;
                          cad += "&nro_orde=" + txtnumord;
                          cad += "&corte=" + txtcorte;
                          cad += "&num_prendas=" + txtnumprend;
                          cad += "&tip_servicio=" + txtservicio;
                          console.log(cad);
                          axios.get(cad).then(
                              function(res) {
                                  that.getGuias();
                                  that.limpiarcampos();
                              }
                          ).catch(
                              function(error) {
                                  that.list = [];
                              }
                          );
                      }




                  },
                  cerrar: function() {
                      localStorage.removeItem("user");
                      window.location.href = "/marissa/index.asp";
                  },
                  initDt: function() {
                      setTimeout(function() {
                          $(document).ready(function() {
                              $('#table').DataTable();
                          });
                      }, 100);
                  },
                  verDatos: function(item) {
                      var that = this;
                      $("#myModaldetalle").modal("toggle");
                      var cadf = "/marissa/lists/facturas.asp?cliente=" + item.cliente + "&po=" + item.po + "&estilo=" + item.estilo;
                      axios.get(cadf).then(function(res) {
                          that.facturas = res.data.data
                      }).catch();
                      var cado = "/marissa/lists/oc.asp?cliente=" + item.cliente + "&po=" + item.po + "&estilo=" + item.estilo;
                      axios.get(cado).then(function(res) {
                          that.oc = res.data.data
                      }).catch();
                  },
                  buscar: function() {
                      var that = this;
                      var estilo = $("#txtbuscarestilo").val();
                      var po = $("#txtbuscarpo").val();
                      var cliente = $("#txtbuscarcliente").val();
                      axios.get("/marissa/lists/guias.asp?cliente=" + cliente + "&po=" + po + "&estilo=" + estilo).then(
                          function(res) {
                              console.log(res)
                              that.list = (res.data.data);
                              app.initDt()
                          }
                      ).catch(
                          function(error) {
                              that.list = [];
                          }
                      );
                  }
              }
          });
      </script>
   </body>
</html>