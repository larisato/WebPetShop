<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pet"%>
<%@page import="model.dao.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pet</title>
        <style>
            /* Estilos básicos para o layout */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                text-align: center;
                color: #333;
                text-transform: uppercase;
            }

            .container {
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 500px;
                font-size: 18px;
            }

            .status {
                font-size: 20px;
                margin: 20px 0;
                font-weight: bold;
            }

            .button-container {
                margin-top: 20px;
            }

            /* Estilos para o botão de menu */
            .button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
            }

            .button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                //Entrada
                String nome = request.getParameter("nome");            
                String raca = request.getParameter("raca");
                String nomeDono = request.getParameter("nomedono");
                String telefone = request.getParameter("telefone");
                
                // Instância do objeto e atrib. de dados
                Pet pet = new Pet();
                pet.setNome(nome);
                pet.setRaca(raca);
                pet.setNomeDono(nomeDono);
                pet.setTelefone(telefone);
                
                PetDAO petDAO = new PetDAO();
                
                boolean isCadastrado = petDAO.incPet(pet);  // Resultado da inserção
                
                if (isCadastrado){    // Se inserido com sucesso
            %>
                <div class="status">
                    CADASTRADO COM SUCESSO!
                </div>
            <%
                }else{  // Se não inserido
            %>
                <div class="status">
                    NÃO CADASTRADO!!!
                </div>
            <%
                }          
            %>
            <div class="button-container">
                <a href="../index.html" class="button">VOLTAR AO MENU PRINCIPAL</a>
            </div>
        </div>
    </body>
</html>
