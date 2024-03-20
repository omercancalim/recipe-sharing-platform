using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication2.View
{
    public partial class suggest_recipe : System.Web.UI.Page
    {

        sqlDbConnection conn = new sqlDbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            transmitInfo();
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            string selectedFoodId = Request.Form["selectorr"];

            if (FileUpload1.HasFile)
            {
                SqlCommand command = new SqlCommand("INSERT INTO tbl_recipes " +
                "(RecipeName,RecipeGredients,RecipeInstruction,RecipeImage,RecipeOwner,RecipeOwnerMail,RecipeCategoryId)" +
                " values " +
                "(@t1,@t2,@t3,@t4,@t5,@t6,@t7)", conn.myConnection());

                /*
                string uploadFolder = Server.MapPath("~/Images/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string filePath = Path.Combine(uploadFolder, fileName);
                FileUpload1.SaveAs(filePath);
                string linkPath = "../Images/" + fileName;
                */
                FileUpload1.SaveAs(Server.MapPath("~/Images/") + System.IO.Path.GetFileName(FileUpload1.FileName));
                string linkPath = "../Images/" + System.IO.Path.GetFileName(FileUpload1.FileName);
                
                command.Parameters.AddWithValue("@t1", TextBox1.Text);
                command.Parameters.AddWithValue("@t2", TextBox2.Text);
                command.Parameters.AddWithValue("@t3", TextBox3.Text);
                command.Parameters.AddWithValue("@t4", linkPath);
                command.Parameters.AddWithValue("@t5", TextBox4.Text);
                command.Parameters.AddWithValue("@t6", TextBox5.Text);
                command.Parameters.AddWithValue("@t7", selectedFoodId);

                command.ExecuteNonQuery();
                conn.myConnection().Close();
            }
            
            //Response.Write("You suggestion has taken");
            Response.Redirect(Request.RawUrl);
        }

        private void transmitInfo()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_categories", conn.myConnection());
            SqlDataReader reader = cmd.ExecuteReader();
            Repeater1.DataSource = reader;
            Repeater1.DataBind();
        }
    }
}