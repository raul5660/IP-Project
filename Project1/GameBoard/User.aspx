<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Project1.GameBoard.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <asp:ListView ID="Games" runat="server" DataKeyNames="Game_ID" DataSourceID="GamesSelect">
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <ItemSeparatorTemplate>
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li class="tab">
                <a href='#<%# Eval("Game_ID") %>' ><asp:Label ID="Game_NameLabel" runat="server" Text='<%# Eval("Game_Name") %>'/></a>
            </li>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="GamesSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" SelectCommand="SELECT * FROM [Game]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="MainContentHolder" class="tab-content">
        <%--Dashboard--%>
        <div id="Dashboard">
            <h1 class="page-header">Dashboard</h1>
            <div class="col-md-3" id="UsersbyPoints" style="height: 300px; width: 100%;"></div>
           <%-- <div class="col-md-3" id="UserStanding" style="height: 300px;"> test</div>--%>
            <h3 class="page-header">Your Progress</h3>
            <div class="col-md-10">
                <div class="progress">
                    <div class="progress-bar progress-bar-striped active" id="TotalSolved" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                        0%
                    </div>
                </div>
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
        </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/loadGameData.js"></script>
    <script src="../js/login.js"></script>
    <script src="../js/canvasjs.min.js"></script>
    <script src="../js/drawUserGraphs.js"></script>
</asp:Content>
