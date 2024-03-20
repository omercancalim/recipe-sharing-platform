<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeBehind="category_recipe.aspx.cs" Inherits="WebApplication2.View.category_recipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Styles/CategoryRecipe.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Proza+Libre:wght@500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Proza+Libre:ital,wght@1,700&display=swap" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-category-recipe-container">
        <div class="category-recipe-left-side-container">
            <div class="categories-left-vertical-tab">
                <p>Categories</p>

                <div class ="seperator-container">
                    <hr class="categories-left-vertical-tab-text-seperator"/>
                </div>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <a href="category_recipe.aspx?CategoryId=<%# Eval("CategoryId") %>&CategoryName=<%# Eval("CategoryName") %>">
                            <div runat="server" class="categories-left-vertical-tab-name"><%# Eval("CategoryName") %></div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="category-recipe-right-side-container">
            <h1>&boxh;&boxh;&boxh;&boxh;&boxh;&boxh; <i runat="server" id="selectedCategoryName">Category Name</i> &boxh;&boxh;&boxh;&boxh;&boxh;&boxh;</h1>
            <div class="recipe-template-container">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="recipe-template">
                            <a href="recipe_detail.aspx?FoodId=<%# Eval("FoodId") %>">
                                <div class="recipe-image-container">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FoodImage") %>'/>
                                </div>
                            </a>
                            <div class="recipe-info-container">
                                <div class="recipe-info-uploader-img-container">
                                    <img src="../Images/Screenshot_8.png" />
                                </div>
                                 <div class="recipe-info">
                                     <p class="limit-text-2-lines" runat="server"><%# Eval("FoodName") %></p>
                                     <div class="recipe-info-date-and-rate">
                                         <div class="recipe-info-rate"><p runat="server">Rate: 000000</p></div>
                                         <div class="recipe-info-date"><p runat="server"><%# Eval("FoodDate", "{0:dd/M/yyyy}") %></p></div>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <script src="../Scripts/CategoryRecipe.js"></script>
</asp:Content>
