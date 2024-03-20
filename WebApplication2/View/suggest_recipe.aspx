<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeBehind="suggest_recipe.aspx.cs" Inherits="WebApplication2.View.suggest_recipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Styles/SuggestRecipe.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="suggest-main-container">
        <div>
            <div class="row-container">
                <div class="row-text-container">
                    <span class="row-text">
                        Recipe:

                    </span></div>
                <div class="row-input-container">
                    <asp:TextBox ID="TextBox1" 
                        Rows="1"
                        TextMode="MultiLine" 
                        runat="server" 
                        CssClass="row-inputs" 
                        ClientIDMode="Static"
                        ></asp:TextBox></div>
            </div>

            <div class="row-container">
                <div class="row-text-container">
                    <span class="row-text">
                    Ingredients:

                    </span></div>
                <div class="row-input-container">
                    <asp:TextBox ID="TextBox2" 
                        Rows="1"
                        TextMode="MultiLine" 
                        runat="server" 
                        CssClass="row-inputs" 
                        ClientIDMode="Static"
                        ></asp:TextBox></div>
            </div>

            <div class="row-container">
                <div class="row-text-container">
                    <span class="row-text">
                        Instruction:

                    </span></div>
                <div class="row-input-container">
                    <asp:TextBox ID="TextBox3" 
                        Rows="1"
                        TextMode="MultiLine" 
                        runat="server" 
                        CssClass="row-inputs" 
                        ClientIDMode="Static"
                        ></asp:TextBox></div>
            </div>

            <div class="row-container">
                <div class="row-text-container"><span class="row-text">Image:</span></div>
                <div class="row-input-container">
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload" />
                    <div class="hide-file-upload-text"></div>
                </div>
            </div>

            <div class="row-container">
                <div class="row-text-container">
                    <span class="row-text">
                        Category:
                    </span>
                </div>
                <div class="row-input-container">
                    <select class="selector" id="selector1" name="selectorr">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <option value="<%# Eval("CategoryId") %>"><%# Eval("CategoryName") %></option>
                            </ItemTemplate>
                        </asp:Repeater>
                    </select>
                </div>
            </div>

            <div class="row-container">
                <div class="row-text-container">
                    <span class="row-text">
                        Suggested by:

                    </span>
                </div>
                <div class="row-input-container">
                    <asp:TextBox ID="TextBox4" 
                        Rows="1"
                        TextMode="MultiLine" 
                        runat="server" 
                        CssClass="row-inputs" 
                        ClientIDMode="Static"
                        ></asp:TextBox>
                </div>
            </div>

            <div class="row-container">
                <div class="row-text-container">
                    <span class="row-text">
                        Mail:

                    </span>
                </div>
                <div class="row-input-container">
                    <asp:TextBox ID="TextBox5" 
                        TextMode="Email"
                        runat="server" 
                        CssClass="row-inputs row-mail-input" 
                        ClientIDMode="Static"
                        ></asp:TextBox>
                </div>
            </div>

            <div class="row-container">
                <div></div>
                <div class="row-input-container"><asp:Button ID="Button1" runat="server" Text="Submit" CssClass="apply-button" OnClick="btnApply_Click"/></div>
            </div>
            
        </div>
    </div>

    <script src="../Scripts/SuggestRecipe.js"></script>
</asp:Content>
