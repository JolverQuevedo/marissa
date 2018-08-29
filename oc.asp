<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Ordernes de Compra</title>
  <meta name="viewport" content="width=device-width, initial-scale=1,
      maximum-scale=1, user-scalable=no, minimal-ui">
  <link rel="stylesheet" href="https://bootswatch.com/3/flatly/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

  <div id="app" class="container">
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
            <li ><a href="./guias.asp">Guias</a></li>
            <li ><a href="./facturas.asp">facturas</a></li>
            <li class="active"><a href="./oc.asp">Ordenes Compra</a></li>
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
  <table class="table table-bordered table-hover">
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
      </tr>
    </thead>
    <tbody>
      <tr style="cursor:pointer" v-for="item in list" v-on:dblclick="mostrardetalle(item)">
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script>
    var app = new Vue({
      el: '#app',
      data: {
        list: [],
        total:0,
        igv:0,
        detalle:[],
        newdetalle:[],
        cargando:false,
        oc:{}
      },
      mounted: function () {
          this.getOC();
      },
      methods: {
          getOC(){
              var cad="/marissa/lists/oc.asp"
              axios.get(cad).then((res)=>{
                  this.list=res.data.data;
              }).catch();
          },
          registradetalle(){
            var oc_id=this.oc.id;
            var po=this.oc.po;
            var estilo=this.oc.estilo;
            var nro_orden=this.oc.nro_orden;
            var proveedor=this.oc.proveedor;
            var descripcion=$("#txtdescripcion").val();
            var cantidad=$("#txtcantidad").val();
            var unidad=$("#txtunidad").val();
            var corte=$("#txtcorte").val();
            var combo=$("#txtcombo").val();
            var preciounit=$("#txtpreciounit").val();
            var subtotat=$("#txtsubtotat").val();
            var igv=$("#txtigv2").val();
            
            
            var cad ="/marissa/comun/insertdetalleoc.asp?";
            cad+="oc_id="+oc_id;
            cad+="&po="+po;
            cad+="&estilo="+estilo;
            cad+="&nro_orden="+nro_orden;
            cad+="&proveedor="+proveedor;
            cad+="&cantidad="+cantidad;
            cad+="&unidad="+unidad;
            cad+="&corte="+corte;
            cad+="&combo="+combo;
            cad+="&descripcion="+descripcion;
            cad+="&preciounit="+preciounit;
            cad+="&subtotal="+subtotat;
            cad+="&igv="+igv;
            axios.get(cad).then((res)=>{
              console.log(res);
              this.getdetalle();
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
          cambiatotales(){
            var cantidad=$("#txtcantidad").val();
            var preciounit=$("#txtpreciounit").val();
            $("#txtsubtotat").val(Math.round(cantidad*preciounit*1000)/1000);
            $("#txtigv2").val(Math.round(cantidad*preciounit*1000)/1000*0.18);
            $("#lbltotal").text(Math.round(cantidad*preciounit*1000)/1000+Math.round(cantidad*preciounit*1000)/1000*0.18);
          },
          guardar(){
            var cliente=$("#txtcliente").val();
            var po=$("#txtpo").val();
            var estilo=$("#txtestilo").val();
            var nro_orden=$("#txtnro_orden").val();
            var proveedor=$("#txtproveedor").val();
            var presupuesto=$("#txtpresupuesto").val();
            var total=$("#txttotal").val();

            var cad="/marissa/comun/insertoc.asp?"
            cad+="cliente="+cliente+"&"
            cad+="po="+po+"&"
            cad+="estilo="+estilo+"&"
            cad+="nro_orden="+nro_orden+"&"
            cad+="proveedor="+proveedor+"&"
            cad+="presupuesto="+presupuesto+"&"
            cad+="total="+total
            axios.get(cad).then((res)=>{
                  console.log(res.data);
                  this.getOC();
                    $("#txtcliente").val("");
                    $("#txtpo").val("");
                    $("#txtestilo").val("");
                    $("#txtnro_orden").val("");
                    $("#txtproveedor").val("");
                    $("#txtpresupuesto").val("");
                    $("#txttotal").val("");
              }).catch();
          },mostrardetalle(oc){
              $('#myModaldetalle').modal('toggle');
              this.oc=oc;
              this.getdetalle();
          },
          actualizartotal:function(id,total,igv){
              var cad="/marissa/comun/updatetotaloc.asp?id="+id+"&total="+total+"&igv="+igv
              console.log(cad);
              axios.get(cad).then((res)=>{
                  console.log(res);
                 
              });
              this.getOC();
          },
          getdetalle(){
            var cad = "/marissa/lists/detalleoc.asp?id="+this.oc.id;
            axios.get(cad).then((res)=>{
              this.detalle=res.data.data;
              this.total=0;
              this.igv=0;
              for(let i of this.detalle){
                this.total += parseFloat(i.subtotal)+parseFloat(i.igv)
                this.igv += parseFloat(i.igv)
              }
              this.actualizartotal(this.oc.id,this.total,this.igv)
            });
          }
      }
    });
    function buscarguia(){
      window.open("./help/hlpguiaoc.asp","","width=900,height=500");
    }
  </script>
</body>

</html>