<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin_Categories.aspx.cs" Inherits="Project1.GameBoard.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li><asp:LinkButton ID="Users" runat="server" OnClick="Users_Click">Users</asp:LinkButton></li>
    <li><asp:LinkButton ID="Games" runat="server" OnClick="Games_Click">Games</asp:LinkButton></li>
    <li class="active"><asp:LinkButton ID="Categories" runat="server" OnClick="Categories_Click">Categories</asp:LinkButton></li>
    <li><asp:LinkButton ID="Challenges" runat="server" OnClick="Challenges_Click">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Categories</h1>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Category_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="Category_ID" HeaderText="Category_ID" InsertVisible="False" ReadOnly="True" SortExpression="Category_ID" />
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" SortExpression="Game_ID" />
                <asp:BoundField DataField="Category_Name" HeaderText="Category_Name" SortExpression="Category_Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            DeleteCommand="DELETE FROM [Category] WHERE [Category_ID] = @Category_ID" 
            InsertCommand="INSERT INTO [Category] ([Game_ID], [Category_Name]) VALUES (@Game_ID, @Category_Name)" 
            SelectCommand="SELECT * FROM [Category]" 
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
    </div>
</asp:Content>
