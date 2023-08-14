using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace PadariaCarmel
{
    class Conectar
    {
        private static string connstring = "server=localhost;port=3306;database=dbpadariacarmel;Uid=senac;pwd=123456";

        private static MySqlConnection conn = null;

        public static MySqlConnection obterConexao()
        {
            conn = new MySqlConnection(connstring);
            try
            {
                conn.Open();
            }
            catch (MySqlException)
            {

                conn = null;
            }            
            return conn;
        }
        public static void fecharConexao()
        {
            if (conn != null)
            {
                conn.Close();
            }
        }

    }
}
