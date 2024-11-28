<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pet"%>
<%@page import="model.dao.PetDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Estilo geral da página */
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            /* Contêiner para o conteúdo */
            .container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 90%;
                max-width: 900px;
                text-align: center;
            }

            /* Título da página */
            h1 {
                color: #4CAF50;
                margin-bottom: 20px;
                font-size: 26px;
            }

            /* Estilo da logo */
            img {
                width: 150px;
                height: 150px;
            }

            /* Estilo da tabela */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                text-align: center;
                border: 1px solid #ddd;
                font-size: 16px;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e1f7d5;
            }

            /* Estilo do contador de registros */
            .records-count {
                font-size: 18px;
                font-weight: bold;
                margin-top: 20px;
                color: #333;
            }

            /* Estilo do botão de voltar */
            .back-btn {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
                margin-top: 20px;
                display: inline-block;
                transition: background-color 0.3s ease;
            }

            .back-btn:hover {
                background-color: #45a049;
            }
         </style>   
    </head>
    <body>
         <div class="container">
             <br> </br>
             
            <img src="../imagens/logo.jpeg" alt="Logo">
        <%        
            //Select "Lista"
            PetDAO petDAO = new PetDAO();
            
            List<Pet> lista = new ArrayList<>();
            lista = petDAO.consPetLista();
            
            int n_reg = 0 ;
         %>   
         <!-- HTML -->
         <table border="1">
                 <tr>
                     <th>#</th>
                     <th>ID.</th>
                     <th>NOME</th>
                     <th>RAÇA</th>
                     <th>NONME DONO</th>
                     <th>TELEFONE</th>
                 </tr>            
         <%
            for( int i = 0; i <= lista.size()-1; i++){  
         %>                                                         
                 <tr>
                     <td><%= i+1%></td>
                     <td><%= lista.get(i).getId() %></td>
                     <td><%= lista.get(i).getNome()%></td>
                     <td><%= lista.get(i).getRaca()%></td>
                     <td><%= lista.get(i).getNomeDono()%></td>
                     <td><%= lista.get(i).getTelefone()%></td>
                 </tr>                
         <%
                n_reg++;                            
            }
         %>
         </table>
         <%
            out.println("<br> <b>TOTAL (REGISTROS): </b>" + n_reg + "<br>");      
        %>

        <!-- Botão de Voltar -->
        <div class="button-container">
            <a href="../index.html" class="back-btn">VOLTAR AO MENU PRINCIPAL</a>
        </div>

         </div>
    </body>
</html>
