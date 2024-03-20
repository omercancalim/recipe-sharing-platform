<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeBehind="recipe_detail.aspx.cs" Inherits="WebApplication2.View.recipe_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Styles/RecipeDetail.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../Scripts/RecipeDetail.js" defer></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recipe-main-container">
        <div class="recipe-image-container">
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FoodImage") %>' CssClass="recipe-image"/>
            <div class="recipe-header-image-text">
                <div class="recipe-header-text" runat="server" id="recipeNameContainer">
                    Recipe Name
                </div>
            </div>
        </div>

        <div class="recipe-ingredient-container">Ingredients:<p runat="server" id="RecipeIngredientContainer"></p></div>

        <div class="recipe-recipe-container">Instruction:<p runat="server" id="RecipeInstructionContainer"></p></div>

        <div class="comment-title-container">
            <div>COMMENTS</div>
            <button class="comment-button" disabled>
                <div class="tooltip">Comment</div>
                <img alt="Comment Icon" src="../Icons/comment.png" class="comment-icon"/>
            </button>
        </div>

        <div class="main-comment-box-container">
            <div class="comment-box-top">
                <div class="comment-box-top-inside-container">
                    <label for="TextBox1" class="comment-box-label">Name:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="comment-box-text-boxes"></asp:TextBox>
                </div>
                <div class="comment-box-top-inside-container">
                    <label for="TextBox2" class="comment-box-label mail-label">Mail:</label>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Email" CssClass="comment-box-text-boxes"></asp:TextBox>
                </div>
                <div class="star-rating-container comment-box-top-inside-container">
                    <p>Rate this recipe: </p>
                    <div class="rating-box">
                        <div class="stars">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <span class="myTooltip">Please select rate</span>
                        </div>

                        <div>
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
                            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
                            <asp:RadioButton ID="RadioButton4" runat="server" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="comment-box-bottom">
                <label for="TextBox3" class="comment-box-label">Comment: </label>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Multiline" CssClass="comment-box-text-boxes main-comment-box"></asp:TextBox>
            </div>
            <div class="apply-button-container">
                <asp:Button ID="buttonApply" runat="server" Text="Apply" CssClass="comment-apply-button" OnClick="buttonApply_Click" OnClientClick="return deneme();" OnMouseOver="handleMouseOver()"/>
            </div>
        </div>

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="main-comment-container">
                    <div class="comment-user-pp-container">
                        <img src="../Images/Screenshot_8.png" class="comment-user-pp"/>
                    </div>
                    <div class="comment-user-info-container">
                        <div class="comment-user-info-top">
                            <div class="comment-user-info-name" runat="server">
                                <%# Eval("CommentName") %>
                            </div>
                            <div class="comment-user-info-date" runat="server">
                                <%# Eval("CommentDate", "{0:dd/M/yyyy HH:mm}") %>
                            </div>
                        </div>
                        <div class="comment-user-info-bottom" runat="server">
                            <%# Eval("CommentContent") %>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
