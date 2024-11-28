<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pet"%>
<%@page import="model.dao.PetDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Estilos gerais para o corpo da página */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fc; /* Cor de fundo suave */
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                color: #333;
            }

            /* Estilo para o contêiner do resultado da consulta */
            .result-container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 500px;
                text-align: center;
                box-sizing: border-box;
            }

            /* Título da página */
            h1 {
                font-size: 24px;
                color: #4CAF50; /* Cor verde */
                margin-bottom: 20px;
            }

            .result-container b {
                font-size: 18px;
                color: #333;
                box-sizing: border-box;
            }

            .result-container p {
                font-size: 16px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            /* Estilos para a mensagem de erro */
            .error-message {
                font-size: 18px;
                color: #f44336; /* Cor de texto vermelha */
                font-weight: bold;
                margin-top: 15px;
            }

            /* Estilos para a mensagem de sucesso */
            .success-message {
                font-size: 18px;
                color: #4CAF50; /* Cor de texto verde */
                font-weight: bold;
                margin-top: 15px;
            }

            /* Estilo para o botão de voltar */
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

            /* Ajuste para o botão de voltar na nova seção */
            .button-container a {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                transition: background-color 0.3s ease;
            }

            .button-container a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="result-container">
        <%
        //Entrada/Receber
        String telefone = request.getParameter("telefone");
       
        // Instância e atrib de valor
        Pet pet = new Pet();
        pet.setTelefone(telefone);
        
        //Select
        PetDAO petDAO = new PetDAO();
        pet = petDAO.consPetRegTel(pet);
        
        if(pet != null){
                out.println("<div class='success-message'>");
                out.println("<br> <b>Consulta Telefone</b> <br>");
                out.println("<br> Nome: " + pet.getNome());
                out.println("<br> Raça: " + pet.getRaca());
                out.println("<br> Nome Dono: " + pet.getNomeDono());
                out.println("<br> Telefone: " + pet.getTelefone());  
                out.println("</div>");
        }else{
               out.println("<div class='error-message'>");
               out.println("Registro não encontrado!!!");
               out.println("</div>");
        }
        %>
        <div class="button-container">
            <a href="../index.html" class="back-btn">VOLTAR AO MENU PRINCIPAL</a>
        </div>
        </div>
    </body>
</html>
