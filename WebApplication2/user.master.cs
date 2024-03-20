using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace WebApplication2
{
    public partial class user : System.Web.UI.MasterPage
    {
        sqlDbConnection conn = new sqlDbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_categories", conn.myConnection());
            SqlDataReader dr = cmd.ExecuteReader();
            Repeater2.DataSource = dr;
            Repeater2.DataBind();
        }
    }
}