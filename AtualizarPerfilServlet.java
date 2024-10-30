@WebServlet("/AtualizarPerfilServlet")
public class AtualizarPerfilServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");

        usuario.setNome(nome);
        usuario.setEmail(email);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.atualizarUsuario(usuario);

        response.sendRedirect("perfil.jsp");
    }
}


