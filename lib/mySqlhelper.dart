// ignore_for_file: file_names

import 'package:mysql_client/mysql_client.dart';

class Mysql {
  static String host = '10.0.2.2'; //'; //for emulator : 10.0.2.2
  static String user = 'root';
  static String password = 'admin@devcom098';
  static String db = 'devcomdb';

  static int port = 3306;

  Mysql();

  Future<MySQLConnection> getConnection() async {
    return await MySQLConnection.createConnection(
      host: host,
      port: port,
      userName: user,
      password: password,
      databaseName: db,
    );
  }

  Future<Iterable<ResultSetRow>> getResults(String query) async {
    var conn = await getConnection();
    await conn.connect();
    var results = await conn.execute(query);
    conn.close();
    return results.rows;
  }
}
