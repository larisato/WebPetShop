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
            }

            /* Título da página */
            h1 {
                font-size: 24px;
                color: #4CAF50; /* Cor verde */
                margin-bottom: 20px;
            }

            /* Estilo para mensagens */
            .message {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 20px;
                padding: 10px;
                border-radius: 4px;
                display: inline-block;
            }

            .success {
                color: green;
                background-color: #d4edda;
            }

            .error {
                color: red;
                background-color: #f8d7da;
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
        </style>
    </head>
    <body>
        <div class="result-container">
            <%
            // Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atrib de valor
            Pet pet = new Pet();
            pet.setId(id);
            
            // Select
            PetDAO petDAO = new PetDAO();
            boolean isDeleted = petDAO.exclPetId(pet);
            
            if(isDeleted) {
                out.println("<div class='message success'>REGISTRO EXCLUIDO COM SUCESSO!</div>");
            } else {
                out.println("<div class='message error'>REGISTRO NÃO EXCLUÍDO!</div>");
            }
            %>
            
            <!-- Botão de Voltar -->
            <div class="button-container">
                <a href="../index.html" class="back-btn">VOLTAR AO MENU PRINCIPAL</a>
            </div>
        </div>
    </body>
</html>
