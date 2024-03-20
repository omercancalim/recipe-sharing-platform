<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebApplication2.View.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>

    <link href="../Styles/admin.css" rel="stylesheet" />
    <script src="../Scripts/admin.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">

        <div class="gray-background" onclick="closeRecipePreview()"></div>

        <div class="main-container">
            <div class="test3">
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div class="test" recipeId="<%# Eval("RecipeId") %>">
                            <p>Recipe ID: </p>
                            <div>#<%# Eval("RecipeId") %></div>

                            <p>Recipe Name: </p>
                            <div><%# Eval("RecipeName") %></div>

                            <p>Owner Mail: </p>
                            <div><%# Eval("RecipeOwnerMail") %></div>

                            <p>Owner: </p>
                            <div><%# Eval("RecipeOwner") %></div>

                            <p>Image: </p>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("RecipeImage") %>' CssClass="recipe-image-preview" />

                            <p>Ingredient: </p>
                            <div><%# Eval("RecipeGredients") %></div>

                            <p>Instructure: </p>
                            <div><%# Eval("RecipeInstruction") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="test4">
                <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                        <div class="test5" commentid="<%# Eval("CommentId") %>">
                            <p>Comment ID: </p>
                            <div>#<%# Eval("CommentId") %></div>

                            <p>Owner: </p>
                            <div><%# Eval("CommentName") %></div>

                            <p>Owner Mail: </p>
                            <div><%# Eval("CommentMail") %></div>

                            <p>Date/Time: </p>
                            <div><%# Eval("CommentDate", "{0:dd/M/yyyy HH:mm}") %></div>

                            <p>Rate: </p>
                            <div><%# Eval("CommentRate") %></div>

                            <p>FoodId: </p>
                            <div><%# Eval("FoodId") %></div>

                            <p>Content: </p>
                            <div><%# Eval("CommentContent") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="suggested-recipes-container specific-radius" onclick="toggleRecipe()">
                <p class="drop-down-text">Suggested Recipes</p>
                <div class="drop-down-icon">
                    <div class="circle-plus closed">
                       <div class="circle">
                         <div class="horizontal"></div>
                         <div class="vertical"></div>
                       </div>
                     </div>
                </div>
            </div>

            <div class="suggested-recipes">
                <div class="display-block" style="display: none; visibility: hidden"></div>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="calculate-height-js">
                            <div class="each-recipe" myVar="<%# Eval("RecipeId") %>" onclick="openRecipePreview(this)">
                                <div>
                                    ID #<%# Eval("RecipeId") %>
                                </div>
                                <div>
                                    <asp:Button ID="BtnAcceptRecipe" runat="server" Text="Accept" CommandName="AcceptRecipe" CommandArgument='<%# Eval("RecipeId") %>' CssClass="buttons accept" OnClientClick="stopPropagation(event)"/>
                                    <asp:Button ID="BtnDeclineRecipe" runat="server" Text="Decline" CommandName="DeclineRecipe" CommandArgument='<%# Eval("RecipeId") %>' CssClass="buttons decline" OnClientClick="stopPropagation(event)"/>
                                </div>
                            </div>
                            <hr style="width: auto; height:5px; background-color:transparent; margin:0; padding: 0; border:none;"/>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="user-comments-container specific-radius" onclick="toggleComment()">
                <p class="drop-down-text">User Comments</p>
                <div class="drop-down-icon">
                    <div class="circle-plus closed">
                       <div class="circle">
                         <div class="horizontal"></div>
                         <div class="vertical"></div>
                       </div>
                     </div>
                </div>
            </div>

            <div class="user-comments">
                <div class="display-block" style="display: none; visibility: hidden"></div>
                <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                    <ItemTemplate>
                        <div class="calculate-height-js-comment">
                            <div class="each-comment" mycomvar="<%# Eval("CommentId") %>" onclick="openCommentPreview(this)">
                                <div>
                                    ID #<%# Eval("CommentId") %>
                                </div>
                                <div>
                                    <asp:Button ID="BtnAcceptComment" runat="server" Text="Accept" CommandName="AcceptComment" CommandArgument='<%# Eval("CommentId") %>' CssClass="buttons accept" OnClientClick="stopPropagation(event)"/>
                                    <asp:Button ID="BtnDeclineComment" runat="server" Text="Decline" CommandName="DeclineComment" CommandArgument='<%# Eval("CommentId") %>' CssClass="buttons decline" OnClientClick="stopPropagation(event)"/>
                                </div>
                            </div>
                            <hr style="width: auto; height:5px; background-color:transparent; margin:0; padding: 0; border:none;"/>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
