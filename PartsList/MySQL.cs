using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace PartsList
{
    class MySQL
    {
       
        

        static string _connection_string = null;

        static string ConnectionString
        {
            get
            {
                if (_connection_string == null)
                {
                    StringBuilder connection_string = new StringBuilder();
                    connection_string.Append("Server=localhost;");
                    connection_string.Append("port=3306;");
                    connection_string.Append("Uid=root;");
                    connection_string.Append("password=;");
                    connection_string.Append("database=Partslist;");
                    _connection_string = connection_string.ToString();
                }
                return _connection_string;
            }
        }
        static void listAllEntries()
        {
            string sql = "select * from entry";
            try
            {
                using (var cn = new MySqlConnection(ConnectionString))
                using (var cmd = new MySqlCommand(sql, cn))
                {
                    cn.Open();
                    using (var rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            Console.WriteLine(string.Format("{0,-3} {1,10}, {2}",
                                rd.GetDecimal("id"),
                                rd.GetString("title"),
                                rd.GetString("text")
                                ));

                        }
                    }

                }
            }
            catch (MySqlException e)
            {
                Console.Error.WriteLine("An Error occured {0}", e);
                throw;
            }
        }
        static void addEntry(string title, string text)
        {
            string sql = "INSERT INTO entry (title, text) VALUES (@param_title, @param_text)";
            try
            {
                using (var cn = new MySqlConnection(ConnectionString))
                using (var cmd = new MySqlCommand(sql, cn))
                {
                    cn.Open();
                    cmd.Parameters.AddWithValue("param_title", title);
                    cmd.Parameters.AddWithValue("param_text", text);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
            catch (MySqlException e)
            {
                Console.Error.WriteLine("An Error occured {0} with string {1}", e, sql);
                throw;
            }
        }
    }
}
