<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication2.View.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Styles/Contact.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-main-container">

        <div class="contact-us-text-container">
            <div class="contact-us-text">CONTACT US</div>
        </div>

        <div class="row-input-container">
            <div class="label-container">
                <label for="TextBox1" class="contact-label-describe">Name:</label>
            </div>
            <div class="input-container">
                <asp:TextBox 
                    ID="TextBox1" 
                    runat="server" 
                    CssClass="row-inputs"
                    ></asp:TextBox>
            </div>
        </div>

        <div class="row-input-container">
            <div class="label-container">
                <label for="TextBox2" class="contact-label-describe">Mail:</label>
            </div>
            <div class="input-container">
                <asp:TextBox 
                    ID="TextBox2" 
                    runat="server"
                    CssClass="row-inputs"
                    ></asp:TextBox>
            </div>
        </div>

        <div class="row-input-container">
            <div class="label-container">
                <label for="TextBox3" class="contact-label-describe">Subject:</label>
            </div>
            <div class="input-container">
                <asp:TextBox 
                    ID="TextBox3" 
                    runat="server"
                    CssClass="row-inputs"
                    ></asp:TextBox>
            </div>
        </div>

        <div class="row-input-container">
            <div class="label-container">
                <label for="TextBox4" class="contact-label-describe">Message:</label>
            </div>
            <div class="input-container">
                <asp:TextBox 
                    ID="TextBox4" 
                    runat="server" 
                    TextMode="MultiLine"
                    Rows="1"
                    CssClass="row-inputs row-input-message"
                    ></asp:TextBox>
            </div>
        </div>

        <div class="row-input-container">
            <div class="label-container"></div>
            <div class="input-container submit-button-container">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="submit-button" OnClick="btnApply_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
