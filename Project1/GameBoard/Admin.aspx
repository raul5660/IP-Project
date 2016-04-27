<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project1.GameBoard.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
        <li class="tab"><a href="#Users">Users</a></li>
        <li class="tab"><a href="#Games">Games</a></li>
        <li class="tab"><a href="#Categories">Categories</a></li>
        <li class="tab"><a href="#Challenges">Challenges</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tab-content">
        <%--Dashboard--%>
        <div id="Dashboard">
            <h1 class="page-header">Dashboard</h1>
        </div>
        <%--Users--%>
        <div id="Users" style="display: none;">
            <h1 class="page-header">Users</h1>
            <div class="table-responsive">
                <asp:GridView ID="UserGridView" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="UserSqlDataSource" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateUserButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="EditUserValidationGroup"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="CancelUpdateUserButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="EditUserButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="DeleteUserButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="User_ID">
                            <EditItemTemplate>
                                <asp:Label ID="EditUserIDLabel" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="InsertUserLinkButton" runat="server" ValidationGroup="InsertUserValidationGroup">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username" SortExpression="User_UserName">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditUserUserName" runat="server" Text='<%# Bind("User_UserName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditUserUserNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Username is required" ControlToValidate="EditUserUserName" ForeColor="Red" ValidationGroup="EditUserValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="UserUserNameLabel" runat="server" Text='<%# Bind("User_UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertUserUserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertUserUserNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Username is required" ControlToValidate="InsertUserUserName" ForeColor="Red" ValidationGroup="InsertUserValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" SortExpression="User_FirstName">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditUserFirstName" runat="server" Text='<%# Bind("User_FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditUserFirstNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's First name is required" ControlToValidate="EditUserFirstName" ForeColor="Red" ValidationGroup="EditUserValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="UserFirstNameLabel" runat="server" Text='<%# Bind("User_FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertUserFirstName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertUserFirstNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's First name is required" ControlToValidate="InsertUserFirstName" ForeColor="Red" ValidationGroup="InsertUserValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" SortExpression="User_LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditUserLastName" runat="server" Text='<%# Bind("User_LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditUserLastNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Last name is required" ControlToValidate="EditUserLastName" ForeColor="Red" ValidationGroup="EditUserValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="UserLastNameLabel" runat="server" Text='<%# Bind("User_LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertUserLastName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertUserLastNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Last name is required" ControlToValidate="InsertUserLastName" ForeColor="Red" ValidationGroup="InsertUserValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="User_Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditUserEmail" runat="server" Text='<%# Bind("User_Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditUserEmailRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Email is required" ControlToValidate="EditUserEmail" ForeColor="Red" ValidationGroup="EditUserValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="UserEmailLabel" runat="server" Text='<%# Bind("User_Email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertUserEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertUserEmailRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Email is required" ControlToValidate="InsertUserEmail" ForeColor="Red" ValidationGroup="InsertUserValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Account Type" SortExpression="User_AccountType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="EditUserAccountType" runat="server" SelectedValue='<%# Bind("User_AccountType") %>'>
                                    <asp:ListItem>user</asp:ListItem>
                                    <asp:ListItem>admin</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="UserAccountTypeLabel" runat="server" Text='<%# Bind("User_AccountType") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="InsertUserAccountType" runat="server">
                                    <asp:ListItem>user</asp:ListItem>
                                    <asp:ListItem>admin</asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ValidationSummary ID="InsertUserValidationSummary" ValidationGroup="InsertUserValidationGroup" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ID="EditUserValidationSummary" ValidationGroup="EditUserValidationGroup" ForeColor="Red" runat="server" />
                <asp:SqlDataSource ID="UserSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [User] ([User_UserName], [User_Password], [User_FirstName], [User_LastName], [User_Email], [User_AccountType]) VALUES (@User_UserName, @User_Password, @User_FirstName, @User_LastName, @User_Email, @User_AccountType)" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [User_UserName] = @User_UserName, [User_FirstName] = @User_FirstName, [User_LastName] = @User_LastName, [User_Email] = @User_Email, [User_AccountType] = @User_AccountType WHERE [User_ID] = @User_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="User_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="User_UserName" Type="String" />
                        <asp:Parameter Name="User_Password" Type="String" />
                        <asp:Parameter Name="User_FirstName" Type="String" />
                        <asp:Parameter Name="User_LastName" Type="String" />
                        <asp:Parameter Name="User_Email" Type="String" />
                        <asp:Parameter Name="User_AccountType" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User_UserName" Type="String" />
                        <asp:Parameter Name="User_Password" Type="String" />
                        <asp:Parameter Name="User_FirstName" Type="String" />
                        <asp:Parameter Name="User_LastName" Type="String" />
                        <asp:Parameter Name="User_Email" Type="String" />
                        <asp:Parameter Name="User_AccountType" Type="String" />
                        <asp:Parameter Name="User_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <%--Games--%>
        <div id="Games" style="display: none;">
            <h1 class="page-header">Games</h1>
            <div class="table-responsive">
                <asp:GridView ID="GamesGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_ID" DataSourceID="GamesSqlDataSource" CssClass="table table-striped" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateGameButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="EditGameValidationGroup"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="CancelUpdateGameButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="EditGameButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="DeleteGameButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="Game_ID">
                            <EditItemTemplate>
                                <asp:Label ID="EditGameIDLabel" runat="server" Text='<%# Eval("Game_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="GameIDLabel" runat="server" Text='<%# Bind("Game_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="InsertGameButton" runat="server" ValidationGroup="InsertGameValidationGroup">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Game_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditGameName" runat="server" Text='<%# Bind("Game_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditGameNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Game's Name is required" ControlToValidate="EditGameName" ForeColor="Red" ValidationGroup="EditGameValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="GameNameLabel" runat="server" Text='<%# Bind("Game_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertGameName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertGameNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Game's Name is required" ControlToValidate="InsertGameName" ForeColor="Red" ValidationGroup="InsertGameValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="EditGameValidationGroup" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="InsertGameValidationGroup" ForeColor="Red" runat="server" />
                <asp:SqlDataSource ID="GamesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" DeleteCommand="DELETE FROM [Game] WHERE [Game_ID] = @Game_ID" InsertCommand="INSERT INTO [Game] ([Game_Name]) VALUES (@Game_Name)" SelectCommand="SELECT * FROM [Game]" UpdateCommand="UPDATE [Game] SET [Game_Name] = @Game_Name WHERE [Game_ID] = @Game_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Game_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Game_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Game_Name" Type="String" />
                        <asp:Parameter Name="Game_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <%--Categories--%>
        <div id="Categories" style="display: none;">
            <h1 class="page-header">Categories</h1>
            <div class="table-responsive">
                <asp:GridView ID="CategoriesGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Category_ID" DataSourceID="CategoriesSqlDataSource" CssClass="table table-striped" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateCategoryButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="EditCategoryValidationGroup"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="CancelUpdateCategoryButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="EditCategoryButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="DeleteCategoryButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category ID" InsertVisible="False" SortExpression="Category_ID">
                            <EditItemTemplate>
                                <asp:Label ID="EditCategoryID" runat="server" Text='<%# Eval("Category_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("Category_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="InsertCategoryButton" runat="server" ValidationGroup="InsertCategoryValidationGroup">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Game ID" SortExpression="Game_ID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="InsertGameID" runat="server" DataSourceID="GameIDSqlDataSource" DataTextField="Game_Name" DataValueField="Game_ID" SelectedValue='<%# Bind("Game_ID") %>'></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="GameID" runat="server" Text='<%# Bind("Game_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="InsertGameID" runat="server" DataSourceID="GameIDSqlDataSource" DataTextField="Game_Name" DataValueField="Game_ID"></asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Category_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditCategoryName" runat="server" Text='<%# Bind("Category_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertCategoryNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Category's Name is required" ControlToValidate="EditCategoryName" ForeColor="Red" ValidationGroup="EditCategoryValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="CategoryName" runat="server" Text='<%# Bind("Category_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertCategoryName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertCategoryNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Category's Name is required" ControlToValidate="InsertCategoryName" ForeColor="Red" ValidationGroup="InsertCategoryValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="EditCategoryValidationGroup" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ID="ValidationSummary4" ValidationGroup="InsertCategoryValidationGroup" ForeColor="Red" runat="server" />
                <asp:SqlDataSource ID="CategoriesSqlDataSource" runat="server" 
                    DeleteCommand="DELETE FROM [Category] WHERE [Category_ID] = @Category_ID" 
                    InsertCommand="INSERT INTO [Category] ([Game_ID], [Category_Name]) VALUES (@Game_ID, @Category_Name)" 
                    SelectCommand="SELECT [Category].[Category_ID], [Category].[Category_Name], [Game].[Game_Name], [Game].[Game_ID] FROM [Category] INNER JOIN [Game] ON [Category].[Game_ID] = [Game].[Game_ID]" 
                    UpdateCommand="UPDATE [Category] SET [Game_ID] = @Game_ID, [Category_Name] = @Category_Name WHERE [Category_ID] = @Category_ID" 
                    ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>">
                    <DeleteParameters>
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Game_ID" Type="Int32" />
                        <asp:Parameter Name="Category_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Game_ID" Type="Int32" />
                        <asp:Parameter Name="Category_Name" Type="String" />
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="GameIDSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" SelectCommand="SELECT * FROM [Game]"></asp:SqlDataSource>
            </div>
        </div>
        <%--Challenges--%>
        <div id="Challenges" style="display: none;">
            <h1 class="page-header">Challenges</h1>
            <div class="table-responsive">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Challenge_ID" DataSourceID="ChallengeSqlDataSource" CssClass="table table-striped" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateChallengeButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="UpdateChallengeValidationGroup"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="CancelUpdateChallengeButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="EditChallengeButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="DeleteChallengeButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Challenge ID" InsertVisible="False" SortExpression="Challenge_ID">
                            <EditItemTemplate>
                                <asp:Label ID="EditChallengeID" runat="server" Text='<%# Eval("Challenge_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ChallengeIDLabel" runat="server" Text='<%# Bind("Challenge_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="InsertChallenge" runat="server" ValidationGroup="InsertChallengeValidationGroup">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category ID" SortExpression="Category_ID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="EditCategoryID" runat="server" DataSourceID="SelectCategorySqlDataSource" DataTextField="Category_Name" DataValueField="Category_ID" SelectedValue='<%# Bind("Category_ID") %>'></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("Category_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="InsertCategoryID" runat="server" DataSourceID="SelectCategorySqlDataSource" DataTextField="Category_Name" DataValueField="Category_ID"></asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Challenge_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditChallengeName" runat="server" Text='<%# Bind("Challenge_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditChallengeNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenge's Name is required" ControlToValidate="EditChallengeName" ForeColor="Red" ValidationGroup="EditChallengValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ChallengeNameLabel" runat="server" Text='<%# Bind("Challenge_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertChallengeName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertChallengeNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenge's Name is required" ControlToValidate="InsertChallengeName" ForeColor="Red" ValidationGroup="InsertChallengeValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Points" SortExpression="Challenge_Points">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditChallengePoints" runat="server" Text='<%# Bind("Challenge_Points") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditChallengePointsRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges points is required" ControlToValidate="EditChallengePoints" ForeColor="Red" ValidationGroup="EditChallengValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ChallengePointsLabel" runat="server" Text='<%# Bind("Challenge_Points") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertChallengePoints" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertCategoryNameRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges points is required" ControlToValidate="InsertChallengePoints" ForeColor="Red" ValidationGroup="InsertChallengeValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Answer" SortExpression="Challenge_Answer">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditChallengeAnswer" runat="server" Text='<%# Bind("Challenge_Answer") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditChallengeAnswerRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges Answer is required" ControlToValidate="EditChallengeAnswer" ForeColor="Red" ValidationGroup="EditChallengValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ChallengeAnswerLabel" runat="server" Text='<%# Bind("Challenge_Answer") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertChallengeAnswer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertChallengeAnswerRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges Answer is required" ControlToValidate="InsertChallengeAnswer" ForeColor="Red" ValidationGroup="InsertChallengeValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Solution" SortExpression="Challenge_Solution">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditChallengeSolution" runat="server" Text='<%# Bind("Challenge_Solution") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditChallengeSolutionRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges Solution is required" ControlToValidate="EditChallengeSolution" ForeColor="Red" ValidationGroup="EditChallengValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ChallengeSolutionLabel" runat="server" Text='<%# Bind("Challenge_Solution") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertChallengeSolution" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertChallengeSolutionRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges Solution is required" ControlToValidate="InsertChallengeSolution" ForeColor="Red" ValidationGroup="InsertChallengeValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Question" SortExpression="Challenge_Question">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditChallengeQuestion" runat="server" Text='<%# Bind("Challenge_Question") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EditChallengeQuestionRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges Question is required" ControlToValidate="EditChallengeQuestion" ForeColor="Red" ValidationGroup="EditChallengValidationGroup"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="ChallengeQuestionLabel" runat="server" Text='<%# Bind("Challenge_Question") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InsertChallengeQuestion" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="InsertChallengeQuestionRequiredFieldValidator" runat="server" Text="*" ErrorMessage="Challenges Question is required" ControlToValidate="InsertChallengeQuestion" ForeColor="Red" ValidationGroup="InsertChallengeValidationGroup"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary5" ValidationGroup="EditChallengValidationGroup" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ID="ValidationSummary6" ValidationGroup="InsertChallengeValidationGroup" ForeColor="Red" runat="server" />
                <asp:SqlDataSource ID="ChallengeSqlDataSource" runat="server"
                    ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" 
                    DeleteCommand="DELETE FROM [Challenge] WHERE [Challenge_ID] = @Challenge_ID" 
                    InsertCommand="INSERT INTO [Challenge] ([Category_ID], [Challenge_Name], [Challenge_Points], [Challenge_Answer], [Challenge_Solution], [Challenge_Question]) VALUES (@Category_ID, @Challenge_Name, @Challenge_Points, @Challenge_Answer, @Challenge_Solution, @Challenge_Question)" 
                    SelectCommand="SELECT [Challenge].[Challenge_ID], [Challenge].[Challenge_Name], [Challenge].[Challenge_Points], [Challenge].[Challenge_Answer], [Challenge].[Challenge_Solution], [Challenge].[Challenge_Question], [Category].[Category_Name], [Category].[Category_ID] FROM [Challenge] INNER JOIN [Category] ON [Challenge].[Category_ID] = [Category].[Category_ID]" 
                    UpdateCommand="UPDATE [Challenge] SET [Category_ID] = @Category_ID, [Challenge_Name] = @Challenge_Name, [Challenge_Points] = @Challenge_Points, [Challenge_Answer] = @Challenge_Answer, [Challenge_Solution] = @Challenge_Solution, [Challenge_Question] = @Challenge_Question WHERE [Challenge_ID] = @Challenge_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Challenge_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                        <asp:Parameter Name="Challenge_Name" Type="String" />
                        <asp:Parameter Name="Challenge_Points" Type="Int32" />
                        <asp:Parameter Name="Challenge_Answer" Type="String" />
                        <asp:Parameter Name="Challenge_Solution" Type="String" />
                        <asp:Parameter Name="Challenge_Question" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Category_ID" Type="Int32" />
                        <asp:Parameter Name="Challenge_Name" Type="String" />
                        <asp:Parameter Name="Challenge_Points" Type="Int32" />
                        <asp:Parameter Name="Challenge_Answer" Type="String" />
                        <asp:Parameter Name="Challenge_Solution" Type="String" />
                        <asp:Parameter Name="Challenge_Question" Type="String" />
                        <asp:Parameter Name="Challenge_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SelectCategorySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
            </div>
        </div>
        <%--Profile--%>
        <div id="Profile" style="display: none;">
            <h1 class="page-header">Profile</h1>
            <asp:FormView ID="ProfileFormView" runat="server" DataKeyNames="User_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    <div class="form-group">
                        <label for="User_IDLabel1">User ID</label>
                        <asp:Label ID="User_IDLabel1" CssClass="form-control" runat="server" Text='<%# Eval("User_ID") %>' />
                    </div>
                    <div class="form-group">
                        <label for="User_UserNameTextBox">Username</label>
                        <asp:TextBox ID="User_UserNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("User_UserName") %>' />
                        <asp:RequiredFieldValidator ID="User_UserNameTextBoxRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Username is required" ControlToValidate="User_UserNameTextBox" ForeColor="Red" ValidationGroup="InsertSingleUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="User_PasswordTextBox">Password</label>
                        <asp:TextBox ID="User_PasswordTextBox" CssClass="form-control" runat="server" Text='<%# Bind("User_Password") %>' />
                        <asp:RequiredFieldValidator ID="User_PasswordTextBoxRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Password is required" ControlToValidate="User_PasswordTextBox" ForeColor="Red" ValidationGroup="InsertSingleUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="User_FirstNameTextBox">First Name</label>
                        <asp:TextBox ID="User_FirstNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("User_FirstName") %>' />
                        <asp:RequiredFieldValidator ID="User_FirstNameTextBoxRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's First name is required" ControlToValidate="User_FirstNameTextBox" ForeColor="Red" ValidationGroup="InsertSingleUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="User_LastNameTextBox">Last Name</label>
                        <asp:TextBox ID="User_LastNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("User_LastName") %>' />
                        <asp:RequiredFieldValidator ID="User_LastNameTextBoxRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Last name is required" ControlToValidate="User_LastNameTextBox" ForeColor="Red" ValidationGroup="InsertSingleUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="User_EmailTextBox">Email</label>
                        <asp:TextBox ID="User_EmailTextBox" CssClass="form-control" runat="server" Text='<%# Bind("User_Email") %>' />
                        <asp:RequiredFieldValidator ID="User_EmailTextBoxRequiredFieldValidator" runat="server" Text="*" ErrorMessage="User's Email is required" ControlToValidate="User_EmailTextBox" ForeColor="Red" ValidationGroup="InsertSingleUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                    <asp:LinkButton ID="UpdateButton" CssClass="btn btn-primary" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="InsertSingleUserValidationGroup"/>
                </EditItemTemplate>
            </asp:FormView>
            <asp:ValidationSummary ID="ValidationSummary7" ValidationGroup="InsertSingleUserValidationGroup" ForeColor="Red" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" 
                SelectCommand="SELECT * FROM [User] WHERE ([User_ID] = @User_ID)" 
                UpdateCommand="UPDATE [User] SET [User_UserName] = @User_UserName, [User_Password] = @User_Password, [User_FirstName] = @User_FirstName, [User_LastName] = @User_LastName, [User_Email] = @User_Email WHERE [User_ID] = @User_ID">
                <SelectParameters>
                    <asp:SessionParameter Name="User_ID" SessionField="UID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="User_UserName" Type="String" />
                    <asp:Parameter Name="User_Password" Type="String" />
                    <asp:Parameter Name="User_FirstName" Type="String" />
                    <asp:Parameter Name="User_LastName" Type="String" />
                    <asp:Parameter Name="User_Email" Type="String" />
                    <asp:Parameter Name="User_AccountType" Type="String" />
                    <asp:Parameter Name="User_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <%--Help--%>
        <div id="Help" style="display: none;">
            <h1 class="page-header">Help</h1>
            <p>Not sure why you need help if you're an admin!!!</p>
        </div>
    </div>
</asp:Content>
