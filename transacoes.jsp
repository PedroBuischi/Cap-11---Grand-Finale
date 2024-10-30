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
    List<Transacao> transacoes = (List<Transacao>) request.getAttribute("transacoes");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Minhas Transações</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Transações de <%= usuario.getNome() %></h2>
    <table>
        <tr>
            <th>Data</th>
            <th>Descrição</th>
            <th>Valor</th>
        </tr>
        <c:forEach var="transacao" items="${transacoes}">
            <tr>
                <td><c:out value="${transacao.data}"/></td>
                <td><c:out value="${transacao.descricao}"/></td>
                <td><c:out value="${transacao.valor}"/></td>
            </tr>
        </c:forEach>
    </table>
    <a href="home.jsp">Voltar à Home</a>
</body>
</html>
