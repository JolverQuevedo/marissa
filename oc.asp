<% Response.CacheControl = "no-cache" %>
<% Response.Buffer = true %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Ordernes de Compra</title>
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

  <div id="app" class="container-fluid">
    <nav class="navbar navbar-default  navbar-fixed-top" style="border-radius: 0px">
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
            <li ><a href="./guias.asp">Guias</a></li>
            <li ><a href="./facturas.asp">facturas</a></li>
            <li class="active"><a href="./oc.asp">Ordenes Compra</a></li>
            <li class="pull-right2" v-on:click="cerrar()"><a >Cerrar Sesion</a></li>
            
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
      Nueva OC
    </button>
  </td>

  </tr>
  </table>
  <br>
  <table id="table" class="table table-bordered table-hover">
    <thead>
      <tr>
        <th># </th>
        <th>cliente </th>
        <th>po </th>
        <th>estilo </th>
        <th>nro_orden</th>
        <th>proveedor</th>
        <th>presupuesto </th>
        <th>total</th>
        <th>igv</th>
        <th>Eliminar</th>
        
      </tr>
    </thead>
    <tbody>
      <tr style="cursor:pointer" v-for="item in list" v-on:dblclick="mostrardetalle(item)">
        <td v-for="c in item">{{c}}</td>
        <td><button class="btn btn-danger btn-sm" v-on:click="eliminaroc(item)">Eliminar</button></td>
      </tr>
    </tbody>

  </table>


  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Nueva OC</h4>
        </div>
        <div class="modal-body">
          <div class="row"><button class="btn btn-primary col-md-12" onclick="buscarguia()" >Buscar Guia</button></div>
          
          <div class="row">
            <div class="form-group col-md-4">
              <label>cliente</label>
              <input class="form-control" id="txtcliente" readonly>
            </div>

            <div class="form-group  col-md-4">
              <label>po</label>
              <input class="form-control" id="txtpo" readonly>
            </div>
            <div class="form-group col-md-4">
              <label>estilo</label>
              <input class="form-control" id="txtestilo" readonly>
            </div>
            <div class="form-group col-md-6">
              <label>Proveedor</label>
              <input class="form-control" id="txtproveedor" readonly>
            </div>
            <div class="form-group col-md-4">
              <label>Nro Orden</label>
              <input class="form-control" id="txtnro_orden" readonly>
            </div>
            <div class="form-group col-md-6">
              <label>Presupuesto</label>
              <input class="form-control" id="txtpresupuesto" type="number" readonly>
            </div>
            <div class="form-group col-md-6">
              <label>Total</label>
              <input class="form-control" id="txttotal"  type="number" disabled value=0>
            </div>
           </div>
           <div class="modal-footer">
                <button class="btn btn-primary btn-block" v-on:click="guardar()">Guardar</button>
           </div>
        </div>
      </div>
    </div>
  </div>



  <div class="modal fade " id="myModaldetalle" tabindex="-1" role="dialog" aria-labelledby="myModaldetalleLabel">
   <div class="modal-dialog" role="document"  style="width:1300px;" >
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">Detalle Orden de Compra</h4>
         </div>
         <div class="modal-body">
            <div style="border:1px solid #222;padding:1rem 2rem">
               <div class="pull-right" style="border:1px solid #222;padding:1rem 2rem;width:200px;">
                  <b>Orden de compra</b>
               </div>
               Cliente: <b style="text-transform: uppercase">{{oc.cliente}}</b>
               <br>
               Po: <b style="text-transform: uppercase">{{oc.po}}</b>
               <br>
               Estilo: <b style="text-transform: uppercase">{{oc.estilo}}</b>
            </div>
            <table class="table table-hover" v-if="detalle !=[]">
               <thead>
                  <tr>
                     <th>Descripcion</th>
                     <th>Cantidad</th>
                     <th>Unidad</th>
                     <th>Corte</th>
                     <th>Combo</th>
                     <th>Precio</th>
                     <th>Subtotal</th>
                     <th>Igv</th>
                     <th>Total</th>
                     <th>Accion</th>
                  </tr>
               </thead>
               <tbody>
                  <tr v-for="d in detalle">
                     <td>{{d.descripcion}}</td>
                     <td>{{d.cantidad}}</td>
                     <td>{{d.unidad}}</td>
                     <td>{{d.corte}}</td>
                     <td>{{d.combo}}</td>
                     <td>{{d.preciounit}}</td>
                     <td>{{d.subtotal}}</td>
                     <td>{{d.igv}}</td>
                     <td>{{parseFloat(d.subtotal)+parseFloat(d.igv)}}</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td><input type="text" id="txtdescripcion" style="width:100%"></td>
                     <td><input type="number" v-on:change="cambiatotales()" id="txtcantidad" value="0" style="width:100%"></td>
                     <td><input type="text" id="txtunidad" style="width:100%"></td>
                     <td><input type="text" id="txtcorte" style="width:100%"></td>
                     <td><input type="text" id="txtcombo" style="width:100%"></td>
                     <td><input type="number" v-on:change="cambiatotales()" id="txtpreciounit" value="0.0" style="width:100%"></td>
                     <td><input type="number" id="txtsubtotat" value="0.0" readonly style="width:100%"></td>
                     <td><input type="number" id="txtigv2" value="0.0"  readonly style="width:100%"></td>
                     <td><label id="lbltotal"></label></td>
                     <td><button style="width:100%;background:#333;color:#fff;border:1px solid #333" v-on:click="registradetalle()">Guardar</button></td>
                  </tr>
                  <tr>
                     <td>
                        Total : <b>{{total.toLocaleString()}}</b>
                        <br>
                        IGV : <b>{{igv.toLocaleString()}}</b>
                     </td>
                  </tr>
                  <tr v-if="cargando">
                     <td>cargando...</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </div>
</div>
  </div>


  <!--VUE-->
  <script src="./js/vue.min.js"></script>
  <script src="./js/axios.min.js"></script>
  <script>
var idt = 0;
var app = new Vue({
    el: '#app',
    data: {
        list: [],
        total: 0,
        igv: 0,
        detalle: [],
        newdetalle: [],
        cargando: false,
        oc: {}
    },
    mounted: function () {
        this.getOC();
        this.user();
    },
    methods: {
        user: function () {
            if (localStorage.getItem("user") == null) {
                window.location.href = "/marissa/index.asp";
            }
        },
        getOC: function () {
            var _this = this;
            var cad = "/marissa/lists/oc.asp";
            axios.get(cad).then(function (res) {
                _this.list = res.data.data;
                _this.initDt();
            }).catch();
        },
        registradetalle: function () {
            var _this = this;
            var oc_id = this.oc.id;
            var po = this.oc.po;
            var estilo = this.oc.estilo;
            var nro_orden = this.oc.nro_orden;
            var proveedor = this.oc.proveedor;
            var descripcion = $("#txtdescripcion").val();
            var cantidad = $("#txtcantidad").val();
            var unidad = $("#txtunidad").val();
            var corte = $("#txtcorte").val();
            var combo = $("#txtcombo").val();
            var preciounit = $("#txtpreciounit").val();
            var subtotat = $("#txtsubtotat").val();
            var igv = $("#txtigv2").val();
            var cad = "/marissa/comun/insertdetalleoc.asp?";
            cad += "oc_id=" + oc_id;
            cad += "&po=" + po;
            cad += "&estilo=" + estilo;
            cad += "&nro_orden=" + nro_orden;
            cad += "&proveedor=" + proveedor;
            cad += "&cantidad=" + cantidad;
            cad += "&unidad=" + unidad;
            cad += "&corte=" + corte;
            cad += "&combo=" + combo;
            cad += "&descripcion=" + descripcion;
            cad += "&preciounit=" + preciounit;
            cad += "&subtotal=" + subtotat;
            cad += "&igv=" + igv;
            axios.get(cad).then(function (res) {
                console.log(res);
                _this.getdetalle();
                $("#txtdescripcion").val("");
                $("#txtcantidad").val("");
                $("#txtunidad").val("");
                $("#txtcorte").val("");
                $("#txtcombo").val("");
                $("#txtpreciounit").val("");
                $("#txtsubtotat").val("");
                $("#txtigv2").val("");
                $("#lbltotal").text("");
            });
        },
        initDt: function () {
            if (idt == 0) {
                setTimeout(function () {
                    $(document).ready(function () {
                        $('#table').DataTable();
                        idt = 1;
                    });
                }, 100);
            }
            else {
                $('#table').DataTable().reload();
            }
        },
        cambiatotales: function () {
            var cantidad = $("#txtcantidad").val();
            var preciounit = $("#txtpreciounit").val();
            $("#txtsubtotat").val(Math.round(cantidad * preciounit * 1000) / 1000);
            $("#txtigv2").val(Math.round(cantidad * preciounit * 1000) / 1000 * 0.18);
            $("#lbltotal").text(Math.round(cantidad * preciounit * 1000) / 1000 + Math.round(cantidad * preciounit * 1000) / 1000 * 0.18);
        },
        guardar: function () {
            var _this = this;
            var cliente = $("#txtcliente").val();
            var po = $("#txtpo").val();
            var estilo = $("#txtestilo").val();
            var nro_orden = $("#txtnro_orden").val();
            var proveedor = $("#txtproveedor").val();
            var presupuesto = $("#txtpresupuesto").val();
            var total = $("#txttotal").val();
            var cad = "/marissa/comun/insertoc.asp?";
            cad += "cliente=" + cliente + "&";
            cad += "po=" + po + "&";
            cad += "estilo=" + estilo + "&";
            cad += "nro_orden=" + nro_orden + "&";
            cad += "proveedor=" + proveedor + "&";
            cad += "presupuesto=" + presupuesto + "&";
            cad += "total=" + total;
            axios.get(cad).then(function (res) {
                console.log(res.data);
                _this.getOC();
                $("#txtcliente").val("");
                $("#txtpo").val("");
                $("#txtestilo").val("");
                $("#txtnro_orden").val("");
                $("#txtproveedor").val("");
                $("#txtpresupuesto").val("");
                $("#txttotal").val("");
            }).catch();
        }, mostrardetalle: function (oc) {
            $('#myModaldetalle').modal('toggle');
            this.oc = oc;
            this.getdetalle();
        },
        eliminaroc: function (item) {
            var _this = this;
            axios.get("/marissa/comun/deleteoc.asp?id=" + item.id).then(function (res) {
                console.log(item);
                console.log(res);
                _this.getOC();
            });
        },
        cerrar: function () {
            localStorage.removeItem("user");
            window.location.href = "/marissa/index.asp";
        },
        actualizartotal: function (id, total, igv) {
            var cad = "/marissa/comun/updatetotaloc.asp?id=" + id + "&total=" + total + "&igv=" + igv;
            console.log(cad);
            axios.get(cad).then(function (res) {
                console.log(res);
            });
            this.getOC();
        },
        getdetalle: function () {
            var _this = this;
            var cad = "/marissa/lists/detalleoc.asp?id=" + this.oc.id;
            axios.get(cad).then(function (res) {
                _this.detalle = res.data.data;
                _this.total = 0;
                _this.igv = 0;
                for (var _i = 0, _a = _this.detalle; _i < _a.length; _i++) {
                    var i = _a[_i];
                    _this.total += parseFloat(i.subtotal) + parseFloat(i.igv);
                    _this.igv += parseFloat(i.igv);
                }
                _this.actualizartotal(_this.oc.id, _this.total, _this.igv);
            });
        }
    }
});
function buscarguia() {
    window.open("./help/hlpguia.asp", "", "width=900,height=500");
}

  </script>
</body>

</html>