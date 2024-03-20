<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.View.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Styles/Home.css" rel="stylesheet" />
    <script src="../Scripts/home.js" defer></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main-page-container">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="recipe-container">
                    <div class="recipe-image-container">
                        <a href="recipe_detail.aspx?FoodId=<%# Eval("FoodId") %>&UrlPath=<%# Eval("FoodImage") %>">
                            <%-- <img src="../Images/potato_salad.jpg" /> --%>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FoodImage") %>'/>
                        </a>
                    </div>

                    <div class="recipe-content-container">
                        <div class="recipe-uploader-pp-container">
                            <img src="../Images/Screenshot_8.png" class="uploader-pp"/>
                        </div>
                        <div class="recipe-content-text">
                            <p class="recipe-name limit-text-2-lines"><%# Eval("FoodName") %></p>
                            <div class="recipe-information-container">
                                <div class="recipe-rating-container">
                                    <p class="recipe-info-rate recipe-info-rate-js"><%# Eval("RateAverage") %></p>
                                    <img class="image-rating-js" id="image-rating" src="../Images/rating-10.png" />
                                    <p class="recipe-info-rate-quantity">(<%# Eval("RateQuantity") %>)</p>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
