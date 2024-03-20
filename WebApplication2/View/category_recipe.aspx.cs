using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing.Design;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication2.View
{
    public partial class category_recipe : System.Web.UI.Page
    {
        sqlDbConnection conn = new sqlDbConnection();
        int selectedCategoryId = 0;
        string transmittedCategoryName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (int.TryParse(Request.QueryString["CategoryId"], out int categoryId))
            {
                selectedCategoryId = categoryId;
            }
            transmittedCategoryName = Request.QueryString["CategoryName"];
            selectedCategoryName.InnerText = transmittedCategoryName;

            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_foods WHERE CategoryId=@p1", conn.myConnection());
            cmd.Parameters.AddWithValue("@p1", selectedCategoryId);
            SqlDataReader reader = cmd.ExecuteReader();

            Repeater1.DataSource = reader;
            Repeater1.DataBind();

            cmd = new SqlCommand("SELECT CategoryId, CategoryName FROM tbl_categories", conn.myConnection());
            SqlDataReader reader2 = cmd.ExecuteReader();
            Repeater2.DataSource = reader2;
            Repeater2.DataBind();

            conn.myConnection().Close();

        }
    }
}