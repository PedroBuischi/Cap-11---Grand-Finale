import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    public Usuario findByEmail(String email) throws SQLException {
        Connection conn = ConnectionManager.getConnection();
        String sql = "SELECT * FROM Usuario WHERE email = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new Usuario(rs.getInt("id"), rs.getString("nome"), rs.getString("email"), rs.getString("senha"));
        }

        return null;
    }

    // Outros métodos como salvar, atualizar e deletar...
}
