<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pet"%>
<%@page import="model.dao.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cadastro Pet</title>
        <style>
            /* Reset básico de estilos */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f7f7f7;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                color: #333;
            }

            .container {
                background-color: #fff;
                width: 100%;
                max-width: 600px;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h1 {
                color: #4CAF50;
                margin-bottom: 30px;
                font-size: 32px;
                font-weight: 600;
            }

            .message {
                margin-top: 20px;
                font-size: 18px;
                font-weight: bold;
                color: #333;
            }

            .success {
                color: green;
            }

            .error {
                color: red;
            }

            .form-group {
                margin-bottom: 20px;
                text-align: left;
            }

            label {
                font-size: 16px;
                font-weight: bold;
                color: #333;
                margin-bottom: 8px;
            }

            input[type="text"] {
                padding: 12px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: 100%;
                max-width: 100%;
                box-sizing: border-box;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus {
                border-color: #4CAF50;
                outline: none;
            }

            .btn-submit {
                padding: 12px 20px;
                font-size: 16px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: 100%;
            }

            .btn-submit:hover {
                background-color: #45a049;
            }

            /* Estilo do botão voltar ao menu */
            .button-container {
                margin-top: 20px;
                text-align: center;
            }

            .button {
                padding: 12px 25px;
                font-size: 18px;
                background-color: #4CAF50; /* Verde igual aos anteriores */
                color: white;
                text-decoration: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .button:hover {
                background-color: #45a049;
            }

            /* Responsividade */
            @media (max-width: 600px) {
                .container {
                    padding: 30px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
        <%
            // Entrada
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");            
            String raca = request.getParameter("raca");
            String nomeDono = request.getParameter("nomeDono");
            String telefone = request.getParameter("telefone");

            // Instância do objeto e atribuição de dados
            Pet pet = new Pet();
            pet.setId(id);
            pet.setNome(nome);
            pet.setRaca(raca);
            pet.setNomeDono(nomeDono);
            pet.setTelefone(telefone);

            PetDAO petDAO = new PetDAO();
            
            if (petDAO.altPet(pet)){    
                // Cadastro alterado com sucesso
        %>
                <div class="message success">
                    Cadastro alterado com sucesso!
                </div>
        <%
            } else {
                // Erro ao alterar cadastro
        %>
                <div class="message error">
                    Cadastro não alterado! Por favor, tente novamente.
                </div>
        <%
            }          
        %>

        <!-- Botão Voltar ao Menu Principal -->
        <div class="button-container">
            <a href="../index.html" class="button">VOLTAR AO MENU PRINCIPAL</a>
        </div>

        </div>
    </body>
</html>
