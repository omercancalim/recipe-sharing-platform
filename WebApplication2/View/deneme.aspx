<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeBehind="deneme.aspx.cs" Inherits="WebApplication2.View.deneme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../Styles/deneme.css" rel="stylesheet" />
    <script src="../Scripts/deneme.js" defer></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="rating-box">
        <div class="stars">
            <i class="fa fa-star" style="font-size: 30vh;"></i>
            <i class="fa fa-star" style="font-size: 30vh;"></i>
            <i class="fa fa-star" style="font-size: 30vh;"></i>
            <i class="fa fa-star" style="font-size: 30vh;"></i>
            <i class="fa fa-star" style="font-size: 30vh;"></i>
            
        </div>
        <div>
            <asp:RadioButton ID="RadioButton1" runat="server" Value="1" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
            <asp:RadioButton ID="RadioButton2" runat="server" Value="2" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
            <asp:RadioButton ID="RadioButton3" runat="server" Value="3" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
            <asp:RadioButton ID="RadioButton4" runat="server" Value="4" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
            <asp:RadioButton ID="RadioButton5" runat="server" Value="5" GroupName="StarRatingGroup" ClientIDMode="Static" CssClass="radio-button-groups"/>
        </div>
    </div>
</asp:Content>
