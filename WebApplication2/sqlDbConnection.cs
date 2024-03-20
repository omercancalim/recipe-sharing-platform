using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace WebApplication2
{
    public class sqlDbConnection
    {
        public SqlConnection myConnection()
        {
            // Dont forget to change '??????'
            SqlConnection connection = new SqlConnection(@"Data Source=???????;Initial Catalog=?????;Integrated Security=True;");
            connection.Open();
            return connection;
        }

        private SqlCommand myCommand(string cmd) 
        {
            return new SqlCommand(cmd, myConnection());
        }

        public string sqlListCategoryName()
        {
            List<String> categoryList = new List<String>();

            using (SqlCommand cmd = myCommand("SELECT * FROM dbo.tbl_categories"))
            {
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        string categoryName = dr["CategoryName"].ToString();
                        categoryList.Add(categoryName);
                    }
                }
            }

            string jsonCategoryList = JsonConvert.SerializeObject(categoryList);
            return jsonCategoryList;
        }
    }
}