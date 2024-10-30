import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
        try {
            Usuario usuario = usuarioDAO.findByEmail(email);
            if (usuario != null && usuario.getSenha().equals(senha)) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("login.jsp?erro=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

