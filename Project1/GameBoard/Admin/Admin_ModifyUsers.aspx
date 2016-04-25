<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin_ModifyUsers.aspx.cs" Inherits="Project1.GameBoard.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li class="active"><asp:LinkButton ID="Users" runat="server" OnClick="Users_Click">Users</asp:LinkButton></li>
    <li><asp:LinkButton ID="Games" runat="server" OnClick="Games_Click">Games</asp:LinkButton></li>
    <li><asp:LinkButton ID="Categories" runat="server" OnClick="Categories_Click">Categories</asp:LinkButton></li>
    <li><asp:LinkButton ID="Challenges" runat="server" OnClick="Challenges_Click">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Users</h1>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped">
            <Columns>
                <%--<asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" InsertVisible="False" ReadOnly="True" />--%>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="User_UserName" HeaderText="Username" SortExpression="User_UserName" />
               <%-- <asp:BoundField DataField="User_Password" HeaderText="User_Password" SortExpression="User_Password" />--%>
                <asp:BoundField DataField="User_FirstName" HeaderText="First Name" SortExpression="User_FirstName" />
                <asp:BoundField DataField="User_LastName" HeaderText="Last Name" SortExpression="User_LastName" />
                <asp:BoundField DataField="User_Email" HeaderText="Email Address" SortExpression="User_Email" />
        <%--        <asp:BoundField DataField="User_AccountType" HeaderText="User_AccountType" SortExpression="User_AccountType" />--%>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" 
            SelectCommand="SELECT [User_UserName], [User_FirstName], [User_LastName], [User_Email], [User_AccountType] FROM [User]">
        </asp:SqlDataSource>
    </div>
</asp:Content>
