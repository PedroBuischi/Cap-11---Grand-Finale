<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Verifica se o usuário está autenticado
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Obtém o usuário logado
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meu Perfil</title>
</head>
<body>
    <h2>Perfil de <%= usuario.getNome() %></h2>
    <form action="AtualizarPerfilServlet" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<%= usuario.getNome() %>" required><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= usuario.getEmail() %>" required><br>
        <button type="submit">Atualizar</button>
    </form>
    <a href="home.jsp">Voltar à Home</a>
</body>
</html>
