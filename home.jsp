<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Verifica se o usuário está autenticado
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Obtém o usuário logado da sessão
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bem-vindo, <%= usuario.getNome() %>!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        nav {
            background-color: #555;
            padding: 15px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-weight: bold;
        }

        nav a:hover {
            background-color: #777;
        }

        main {
            padding: 20px;
            margin: 20px;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <!-- Cabeçalho -->
    <header>
        <h1>Bem-vindo, <%= usuario.getNome() %>!</h1>
    </header>

    <!-- Navegação -->
    <nav>
        <a href="transacoes.jsp">Minhas Transações</a>
        <a href="perfil.jsp">Meu Perfil</a>
        <a href="logout">Sair</a>
    </nav>

    <!-- Conteúdo principal -->
    <main>
        <h2>Olá, <%= usuario.getNome() %>!</h2>
        <p>Aqui você pode visualizar suas transações, atualizar seu perfil e acessar outras funcionalidades.</p>
        <p><strong>Email cadastrado:</strong> <%= usuario.getEmail() %></p>
        <p><strong>Data de hoje:</strong> <%= new java.util.Date() %></p>
    </main>

    <!-- Rodapé -->
    <footer>
        <p>&copy; 2024 - Sistema Fintech</p>
    </footer>
</body>
</html>
