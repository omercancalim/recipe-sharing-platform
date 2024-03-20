using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;

namespace WebApplication2.View
{
    public partial class recipe_detail : System.Web.UI.Page
    {

        sqlDbConnection conn = new sqlDbConnection();
        int selectedFoodId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["FoodId"], out int foodId))
            {
                selectedFoodId = foodId;
            }

            SqlCommand cmd = new SqlCommand("SELECT FoodName, Ingredient, Recipe, FoodDate, FoodImage, CategoryId FROM tbl_foods WHERE FoodId=@p1", conn.myConnection());
            cmd.Parameters.AddWithValue("@p1", selectedFoodId);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                recipeNameContainer.InnerText = dr[0].ToString();
                RecipeIngredientContainer.InnerText = dr[1].ToString();
                RecipeInstructionContainer.InnerText = dr[2].ToString();
                Image1.ImageUrl = dr[4].ToString();
            }

            cmd = new SqlCommand("SELECT CommentName, CommentDate, CommentContent FROM tbl_comments WHERE FoodId=@p1 AND CommentApproval=1", conn.myConnection());
            cmd.Parameters.AddWithValue("@p1", selectedFoodId);
            dr = cmd.ExecuteReader();
            Repeater1.DataSource = dr;
            Repeater1.DataBind();

            conn.myConnection().Close();
        }

        protected void buttonApply_Click(object sender, EventArgs e)
        {
            int radioButtonValue = getSelectedRadioButtonValue();

            if (radioButtonValue == 0)
            {
                return;    
            }

            SqlCommand cmd = new SqlCommand("INSERT INTO tbl_comments " +
                "(CommentName, CommentMail, CommentContent, FoodId, CommentRate) " +
                "values " +
                "(@p1, @p2, @p3, @p4, @p5)", conn.myConnection());

            cmd.Parameters.AddWithValue("@p1", TextBox1.Text);
            cmd.Parameters.AddWithValue("@p2", TextBox2.Text);
            cmd.Parameters.AddWithValue("@p3", TextBox3.Text);
            cmd.Parameters.AddWithValue("@p4", selectedFoodId);
            cmd.Parameters.AddWithValue("@p5", radioButtonValue);

            cmd.ExecuteNonQuery();
            conn.myConnection().Close();
            //Response.Write("Your comment has taken");
            Response.Redirect(Request.RawUrl);
        }

        private int getSelectedRadioButtonValue()
        {
            int value = 0;

            if (RadioButton1.Checked) { value = 1; }
            else if (RadioButton2.Checked) { value = 2; }
            else if (RadioButton3.Checked) { value = 3; }
            else if (RadioButton4.Checked) { value = 4; }
            else if (RadioButton5.Checked) { value = 5; }

            return value;
        }
    }
}