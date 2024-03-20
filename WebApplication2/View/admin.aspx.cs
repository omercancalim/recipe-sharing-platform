using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication2.View
{
    public partial class admin : System.Web.UI.Page
    {
        sqlDbConnection conn = new sqlDbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cmd;
                SqlDataReader reader;

                // Query for tbl_recipes
                cmd = new SqlCommand("SELECT * FROM tbl_recipes WHERE Viewed = 0", conn.myConnection());
                reader = cmd.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);
                // Close the reader after loading data into the DataTable
                reader.Close();


                Repeater1.DataSource = dataTable;
                Repeater1.DataBind();

                DataTable dataTableClone = dataTable.Clone();

                // Import the rows into the new DataTable
                foreach (DataRow row in dataTable.Rows)
                {
                    dataTableClone.ImportRow(row);
                }

                // Bind Repeater3 using the new DataTable
                Repeater3.DataSource = dataTableClone;
                Repeater3.DataBind();

                // Query for tbl_comments
                cmd = new SqlCommand("SELECT * FROM tbl_comments WHERE Viewed = 0", conn.myConnection());
                reader = cmd.ExecuteReader();

                dataTable.Clear();
                dataTable.Load(reader);
                reader.Close();


                Repeater2.DataSource = dataTable;
                Repeater2.DataBind();

                dataTableClone.Clear();
                dataTableClone = dataTable.Clone();

                // Import the rows into the new DataTable
                foreach (DataRow row in dataTable.Rows)
                {
                    dataTableClone.ImportRow(row);
                }

                // Bind Repeater3 using the new DataTable
                Repeater4.DataSource = dataTableClone;
                Repeater4.DataBind();

                conn.myConnection().Close();
            }
        }

        protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            int itemIndex = 0;
            string recipeId = "";
            SqlCommand command;

            if (e.CommandName == "AcceptRecipe")
            {
                itemIndex = e.Item.ItemIndex;
                recipeId = e.CommandArgument.ToString();

                command = new SqlCommand("UPDATE tbl_recipes SET Viewed=@p2, RecipeState=@p3 WHERE RecipeId=@p1", conn.myConnection());
                command.Parameters.AddWithValue("@p1", recipeId);
                command.Parameters.AddWithValue("@p3", 1);
                command.Parameters.AddWithValue("@p2", 1);

                command.ExecuteNonQuery();
                conn.myConnection().Close();
            }
            else if (e.CommandName == "DeclineRecipe")
            {
                itemIndex = e.Item.ItemIndex;
                recipeId = e.CommandArgument.ToString();

                command = new SqlCommand("UPDATE tbl_recipes SET Viewed=@p2, RecipeState=@p3 WHERE RecipeId=@p1", conn.myConnection());
                command.Parameters.AddWithValue("@p1", recipeId);
                command.Parameters.AddWithValue("@p3", 0);
                command.Parameters.AddWithValue("@p2", 1);

                command.ExecuteNonQuery();
                conn.myConnection().Close();
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void Repeater2_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            int itemIndex = 0;
            string commentId = "";
            SqlCommand command;

            if (e.CommandName == "AcceptComment")
            {
                itemIndex = e.Item.ItemIndex;
                commentId = e.CommandArgument.ToString();

                command = new SqlCommand("UPDATE tbl_comments SET Viewed=@p2, CommentApproval=@p3 WHERE CommentId=@p1", conn.myConnection());
                command.Parameters.AddWithValue("@p1", commentId);
                command.Parameters.AddWithValue("@p3", 1);
                command.Parameters.AddWithValue("@p2", 1);

                command.ExecuteNonQuery();
                conn.myConnection().Close();
            }
            else if (e.CommandName == "DeclineComment")
            {
                itemIndex = e.Item.ItemIndex;
                commentId = e.CommandArgument.ToString();

                command = new SqlCommand("UPDATE tbl_comments SET Viewed=@p2, CommentApproval=@p3 WHERE CommentId=@p1", conn.myConnection());
                command.Parameters.AddWithValue("@p1", commentId);
                command.Parameters.AddWithValue("@p3", 0);
                command.Parameters.AddWithValue("@p2", 1);

                command.ExecuteNonQuery();
                conn.myConnection().Close();
            }

            Response.Redirect(Request.RawUrl);
        }
    }
}