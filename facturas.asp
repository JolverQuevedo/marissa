<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Facturas</title>
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
            <li><a href="./guias.asp">Guias</a></li>
            <li class="active"><a href="./facturas.asp">facturas</a></li>
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
      Nueva Factura
    </button>
    
  </td>

  </tr>
  </table>
  <br>
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
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
      </tr>
    </thead>
    <tbody>
      <tr style="cursor:pointer" v-for="item in list" v-on:dblclick="verdetalle(item)">
        <td v-for="c in item" >{{c}}</td>
      </tr>
    </tbody>

  </table>


  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Nueva Factura</h4>
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
            <label>serie</label>
            <input class="form-control" type="text" maxlength="3"  id="txtserie">
          </div>
          <div class="form-group col-md-6">
            <label>numdoc</label>
            <input class="form-control"  type="text" maxlength="7"  id="txtnumdoc">
          </div>
          <div class="form-group col-md-4">
            <label>fecha</label>
            <input class="form-control" id="txtfecha" type="date" value="<%=year(now())&"-"&right("00"&month(now()),2)&"-"&right("00"&day(now()),2)%>">
          </div>
          
          <div class="form-group col-md-8">
            <label>numcheque</label>
            <input class="form-control" id="txtnumcheque">
          </div>

          <div class="form-group col-md-12">
            <label>numletra</label>
            <input class="form-control" id="txtnumletra">
          </div>
          <div class="form-group col-md-6">
            <label>tipo</label>
            <select id="txttipo" class="form-control">
              <option value="s">Por Servicio</option>
              <option value="e">Exportacion</option>
              
              
            </select>
          </div>
          <div class="form-group col-md-6">
            <label for="txtestado">estado</label>
            <select id="txtestado" class="form-control" disabled>
              <option value="a">Activo</option>
              <option value="f" >Finalizado</option>
            </select>
          </div>

            </div>
        </div>
        <div class="modal-footer">
        <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" v-on:click="guardarFactura()">Guardar Guia</button>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
  

<div class="modal fade" id="myModaldetalle" tabindex="-1" role="dialog" aria-labelledby="myModaldetalleLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Detalle Factura</h4>
        </div>
        <div class="modal-body">
            <div style="border:1px solid #222;padding:1rem 2rem">
              <div class="pull-right" style="border:1px solid #222;padding:1rem 2rem;width:200px;">
                <b>Factura</b>
                <br>
                {{factura.serie}} - {{factura.numdoc}}
              </div>
              
              Cliente: <b style="text-transform: uppercase">{{factura.cliente}}</b>
              <br>
              Fecha: <b style="text-transform: uppercase">{{factura.fecha}}</b>
              <br>
              Po: <b style="text-transform: uppercase">{{factura.po}}</b>
              <br>
              Estilo: <b style="text-transform: uppercase">{{factura.estilo}}</b>
              </div>
              <table class="table table-hover" v-if="detalle !=[]">
                <thead>
                  <tr>
                    <th>Descripcion</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Subtotal</th>
                    <th>Igv</th>
                    
                    <th>Total</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="d in detalle">
                    <td>{{d.descripcion}}</td>
                    <td>{{d.cantidad}}</td>
                    <td>{{d.preciounit}}</td>
                    <td>{{d.subtotal}}</td>
                    <td>{{Math.round(d.igv*100)/100}}</td>
                    <td>{{Math.round(((d.subtotal*1)+(d.igv*1))*100)/100}}</td>
                  </tr>
                  <tr>
                    <td><input type="text" id="txtdescripcion" style="width:100%"></td>
                    <td><input type="number" id="txtcantidad" style="width:100%"></td>
                    <td><input type="number" onchange="calcula()" id="txtpreciounit" style="width:100%"></td>
                    <td><input type="number" id="txtsubtotat" readonly style="width:100%"></td>
                    <td><input type="number" id="txtigv2" style="width:100%"></td>
                    
                    <td><button style="width:100%;background:#333;color:#fff;border:1px solid #333" v-on:click="guardardetalle()">Guardar</button></td>
                  
                  </tr>
                  <tr>
                    <td>
                      Total {{parseFloat(total)}}
                    </td>
                    <td>
                      Igv {{igv.toLocaleString()}}
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
</div>
  <!--VUE-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script>


    var app = new Vue({
      el: '#guias',
      data: {
        list: [],
        factura:{},
        detalle:[],
        newdetalle:{},
        cargando:false,
        total:0.00,
        igv:0.00,
      },
      mounted: function () {
        this.getFacturas();
      },
      methods: {
       getFacturas: function () {
          axios.get("/marissa/lists/facturas.asp").then(
            (res) => {
              console.log(res)
              this.list = (res.data.data);
            }
          ).catch(
            (error) => {

            }
          );
        },
        guardardetalle:function(){
          this.cargando=true;
          id_fact=this.factura.id;
          descripcion=$("#txtdescripcion").val();
          cantidad=$("#txtcantidad").val();
          preciounit=$("#txtpreciounit").val();
          subtotat=$("#txtsubtotat").val();
          igv=$("#txtigv2").val();

          var cad = "/marissa/comun/insertdetallefact.asp?";
          cad+="id_fact="+id_fact;
          cad+="&descripcion="+descripcion;
          cad+="&cantidad="+cantidad;
          cad+="&preciounit="+preciounit;
          cad+="&subtotat="+subtotat;
          cad+="&igv="+igv;
          console.log(cad);


          axios.get(cad).then(
            (res) => {
              this.verdetalle(this.factura);
              this.getFacturas();
              this.cargando=false;
              $("#txtdescripcion").val("");
              $("#txtcantidad").val("");
              $("#txtpreciounit").val("");
              $("#txtsubtotat").val("");
              $("#txtigv2").val("");
              $("#txtdescripcion").focus();
            }
          ).catch(
            (error) => {
              this.cargando=false;
            }
          );


        },
        verdetalle:function(factura){
          $("#myModaldetalle").modal("show");
          this.factura={};
          this.factura=factura;
          this.detalle=[];
          axios.get("/marissa/lists/detallefactura.asp?id="+factura.id).then(
            (res) => {
              this.detalle=res.data.data;
              this.total=0.00;
              this.igv=0.00;
              for(let a of this.detalle)
              {
                 this.total += parseFloat(a.subtotal)+parseFloat(a.igv);
                 this.igv =parseFloat(this.igv) + parseFloat(a.igv);
              }
              
              this.actualizartotal(this.factura.id,this.total,this.igv);
            }
          ).catch(
            (error) => {

            }
          );



        },
        actualizartotal:function(id,total,igv){
          
          var cad = "/marissa/comun/updatetotalft.asp?id="+id+"&total="+total+"&igv="+igv;
          
          console.log(cad);
          axios.get(cad).then((res)=>{
              console.log(res);
          });
          this.getFacturas();
        },
        guardarFactura:function(){
          var cliente=$("#txtcliente").val();
          var po=$("#txtpo").val();
          var estilo=$("#txtestilo").val();
          var serie=$("#txtserie").val();
          var numdoc=$("#txtnumdoc").val();
          var fecha=$("#txtfecha").val();
          
          var numcheque=$("#txtnumcheque").val();
          var numletra=$("#txtnumletra").val();
          var tipo=$("#txttipo").val();
          var estado=$("#txtestado").val();
          cad="/marissa/comun/insertfactura.asp?";
          cad=cad+"cliente="+cliente;
          cad=cad+"&po="+po;
          cad=cad+"&estilo="+estilo;
          cad=cad+"&serie="+serie;
          cad=cad+"&numdoc="+numdoc;
          cad=cad+"&fecha="+fecha;
          
          cad=cad+"&numcheque="+numcheque;
          cad=cad+"&numletra="+numletra;
          cad=cad+"&tipo="+tipo;
          cad=cad+"&estado="+estado;
          console.log(cad);
          axios.get(cad).then(
            (res) => {
              console.log(res)
              this.getFacturas();
              $("#txtcliente").val("");
              $("#txtpo").val("");
              $("#txtestilo").val("");
              $("#txtserie").val("");
              $("#txtnumdoc").val("");
              $("#txtfecha").val("");
              $("#txtnumcheque").val("");
              $("#txtnumletra").val("");
              $("#txttipo").val("");
              $("#txtestado").val("");
              $("#mymodal").modal("hide");
            }
          ).catch(
            (error) => {

            }
          );
        },
      }
    });
    function buscarguia(){
      window.open("./help/hlpguia.asp","","width=900,height=500");
    }
    function calcula(){
      cantidad=$("#txtcantidad").val();
      preciounit=$("#txtpreciounit").val();
      subtotat=$("#txtsubtotat").val(cantidad*preciounit);
      console.log(app.factura.tipo);
      if(!app.factura.tipo.includes("e")){
      igv=$("#txtigv2").val((cantidad*preciounit)*0.18);
      }else{
        $("#txtigv2").val(0);
        }
    }
  </script>



</body>

</html>