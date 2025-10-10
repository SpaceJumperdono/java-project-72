package hexlet.code.repository;

import hexlet.code.model.Url;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UrlRepository extends BaseRepository {
    public static void save(Url url) throws SQLException {
        String sql = "INSERT INTO urls (name) VALUES (?)";
        try (
                var conn = dataSource.getConnection();
                var preparedStatment = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            preparedStatment.setString(1, url.getName());
            preparedStatment.executeUpdate();
            var generatedKeys = preparedStatment.getGeneratedKeys();
            if (generatedKeys.next()) {
                url.setId(generatedKeys.getLong(1));
            } else {
                throw new SQLException("DB have not returned an id after saving an entity");
            }
        }
    }

    public static Optional<Url> findById(Long id) throws SQLException {
        var sql = "SELECT * FROM urls WHERE id = ?";
        try (
                var conn = dataSource.getConnection();
                var preparedStatment = conn.prepareStatement(sql)
        ) {
            preparedStatment.setLong(1, id);
            var resultSet = preparedStatment.executeQuery();
            if (resultSet.next()) {
                var name = resultSet.getString("name");
                var timestamp = resultSet.getTimestamp("timestamp");
                var url = new Url(name);
                url.setId(id);
                url.setTimestamp(timestamp);
                return Optional.of(url);
            }
            return Optional.empty();
        }
    }
    public static Optional<Url> findByName(String nameUrl) throws SQLException {
        var sql = "SELECT * FROM urls WHERE name = ?";
        try (
                var conn = dataSource.getConnection();
                var preparedStatment = conn.prepareStatement(sql)
        ) {
            preparedStatment.setString(1, nameUrl);
            var resultSet = preparedStatment.executeQuery();
            if (resultSet.next()) {
                var id = resultSet.getLong("id");
                var name = resultSet.getString("name");
                var timestamp = resultSet.getTimestamp("timestamp");
                var url = new Url(name);
                url.setId(id);
                url.setTimestamp(timestamp);
                return Optional.of(url);
            }
            return Optional.empty();
        }
    }

    public static List<Url> getEntities() throws SQLException {
        var sql = "SELECT * FROM urls";
        try (
                var conn = dataSource.getConnection();
                var preparedStatment = conn.prepareStatement(sql)
        ) {
            var resultSet = preparedStatment.executeQuery();
            var result = new ArrayList<Url>();
            while (resultSet.next()) {
                var id = resultSet.getLong("id");
                var name = resultSet.getString("name");
                var timestamp = resultSet.getTimestamp("timestamp");
                var url = new Url(name);
                url.setId(id);
                url.setTimestamp(timestamp);

                result.add(url);
            }
            return result;
        }
    }
}
