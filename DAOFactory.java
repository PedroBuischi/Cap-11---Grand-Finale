public class DAOFactory {
    public static UsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO();
    }

    // Adicione outros DAOs conforme necessário
}
