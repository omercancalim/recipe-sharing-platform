using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.View
{
    public partial class contact : System.Web.UI.Page
    {
        sqlDbConnection conn = new sqlDbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("INSERT INTO tbl_contact " +
                "(ContactPerson,ContactTitle,ContactMail,ContactContent)" +
                " values " +
                "(@t1,@t2,@t3,@t4)", conn.myConnection());

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

            command.Parameters.AddWithValue("@t1", TextBox1.Text);
            command.Parameters.AddWithValue("@t2", TextBox2.Text);
            command.Parameters.AddWithValue("@t3", TextBox3.Text);
            command.Parameters.AddWithValue("@t4", TextBox4.Text);

            command.ExecuteNonQuery();
            conn.myConnection().Close();

            //Response.Write("You suggestion has taken");
            Response.Redirect(Request.RawUrl);
        }
    }
}