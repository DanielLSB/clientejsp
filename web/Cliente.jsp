<%-- 
    Document   : Cliente
    Created on : 29/09/2021, 20:24:45
    Author     : mutsu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Cliente" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   
    </head>
    <body>
        <h1>Formulario Cliente</h1>
         <div class="container">
          
            <form action="sr_cliente" method="post" class="form-group">
              <label for ="lbl_id">Id</label>
              <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>     
           <label for="lbl_nit">NIT</label>
            <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="00000-0" >    
             <label for="lbl_nombres">Nombres</label>
            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="ejemploo nombre 1" >    
            <label for="lbl_apellidos">Apellidos</label>
            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="ejemploo apellido 1" >    
            <label for="lbl_direccion">Direccion</label>
            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="ejemploo casa no " >    
            <label for="lbl_telefono">Telefono</label>
            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="ejemploo 5555-5555" >     
            <label for="lbl_fn">fecha nacimiento</label>
            <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="dd/mm/aa" >     
            <br>
             <button  name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
             <button  name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary">Modificar</button>
            <button  name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-primary">Eliminar</button>
            
             <br>
             <br>
      <table class="table table-hover">
    <thead>
      <tr>
        <th>Nit</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>direccion</th>
        <th>telefono</th>
        <th>nacimiento</th>
        
        
      </tr>
    </thead>
    <tbody id="tbl_clientes">
   <%
        Cliente cliente = new Cliente();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = cliente.leer();
        for (int t=0;t <tabla.getRowCount();t++){
            out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-idp="+tabla.getValueAt(t, 6)+">");
            out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");
            
            out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
            
            out.println("</tr>");
        }
        
        %>
      
    </tbody>
  </table>
             
                </div>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
      
<script type="text/javascript">
            $('#tbl_clientes').on('click','tr td',function(evt){
                var target,id,nit,nombres,apellidos,direccion,telefono,nacimiento;
                target = $(event.target);
                id = target.parent().data('id');
               
                nit = target.parent("tr").find("td").eq(0).html();
                nombres=target.parent("tr").find("td").eq(1).html();
                apellidos=target.parent("tr").find("td").eq(2).html();
                direccion=target.parent("tr").find("td").eq(3).html();
                telefono=target.parent("tr").find("td").eq(4).html();
                nacimiento=target.parent("tr").find("td").eq(5).html();
                
                $("#txt_id").val(id);
                $("#txt_nit").val(nit);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_fn").val(nacimiento);
               
                
            });
            
        </script>
        
    </body>
</html>
