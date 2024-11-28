<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pet"%>
<%@page import="model.dao.PetDAO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar (Id)</title>
        <style>
            /* Estilos gerais para o corpo da página */
            body {
                font-family: Arial, sans-serif;
                background-color: #f7f7f7;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                text-align: center; /* Centralizando o texto */
            }

            /* Estilo para o contêiner principal */
            .container {
                background-color: white;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
            }

            h2 {
                color: #4CAF50;
                font-size: 32px;
                margin-bottom: 30px;
                text-align: center;
                font-weight: 600;
            }

            .form-group {
                margin-bottom: 20px;
                text-align: left;
            }

            label {
                font-weight: bold;
                display: block;
                color: #333;
                margin-bottom: 8px;
            }

            input[type="text"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                color: #333;
                box-sizing: border-box;
                margin-bottom: 10px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus {
                border-color: #4CAF50;
                outline: none;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 14px 22px;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            .message {
                font-size: 18px;
                text-align: center;
                color: red;
                margin-top: 20px;
            }

            /* Responsividade */
            @media (max-width: 600px) {
                .container {
                    padding: 25px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
        <%
        //Entrada/Receber
        int id = Integer.parseInt( request.getParameter("id") );
            
        // Instância e atrib de valor
        Pet pet = new Pet();
        pet.setId(id);
        
         //Select
        PetDAO petDAO = new PetDAO();
        if(petDAO.consPetRegId(pet) != null){
                out.println("<h2>Alteração de Cadastro Pet</h2>");
        %>                          
        <form name="frmPet" method="post" action="updatePet.jsp">
            <div class="form-group">
                <label for="id">Identificador:</label>
                <input type="text" id="id" name="id" value="<%= pet.getId()%>" readonly="true">
            </div>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" value="<%= pet.getNome() %>" minlength="3" maxlength="10">
            </div>
            <div class="form-group">
                <label for="raca">Raça:</label>
                <input type="text" id="raca" name="raca" value="<%= pet.getRaca() %>" minlength="3" maxlength="10">
            </div>
            <div class="form-group">
                <label for="nomeDono">Nome do Dono:</label>
                <input type="text" id="nomeDono" name="nomeDono" value="<%= pet.getNomeDono() %>" minlength="3" maxlength="10">
            </div>
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input type="text" id="telefone" name="telefone" value="<%= pet.getTelefone() %>" minlength="11" maxlength="13">
            </div>
            <input type="submit" value="Salvar Alterações">
        </form>                 
        <%                                
        } else {
               out.println("<div class='message'>Registro não encontrado!</div>");
        }        
        %>
        </div>
    </body>
</html>
