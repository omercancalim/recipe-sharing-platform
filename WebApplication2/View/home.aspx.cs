using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.View
{
    public partial class home : System.Web.UI.Page
    {

        sqlDbConnection conn = new sqlDbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT " +
                "f.FoodId, f.FoodName, f.Ingredient, f.Recipe, f.FoodImage," +
                "f.CategoryId, r.RateAverage AS RateAverage, r.RateQuantity AS RateQuantity " +
                "FROM tbl_foods as f JOIN tbl_foodRate as r ON f.FoodId = r.FoodId " +
                "ORDER BY FoodId DESC", conn.myConnection());
            SqlDataReader reader = cmd.ExecuteReader();
            Repeater1.DataSource = reader;
            Repeater1.DataBind();
            conn.myConnection().Close();
        }
    }
}