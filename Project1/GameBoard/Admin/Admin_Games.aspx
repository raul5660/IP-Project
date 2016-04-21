<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin_Games.aspx.cs" Inherits="Project1.GameBoard.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li><asp:LinkButton ID="Users" runat="server" OnClick="Users_Click">Users</asp:LinkButton></li>
    <li class="active"><asp:LinkButton ID="Games" runat="server" OnClick="Games_Click">Games</asp:LinkButton></li>
    <li><asp:LinkButton ID="Categories" runat="server" OnClick="Categories_Click">Categories</asp:LinkButton></li>
    <li><asp:LinkButton ID="Challenges" runat="server" OnClick="Challenges_Click">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Games</h1>
    <div class="table-responsive">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" InsertVisible="False" ReadOnly="True" SortExpression="Game_ID" />
                <asp:BoundField DataField="Game_Name" HeaderText="Game_Name" SortExpression="Game_Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>"
            DeleteCommand="DELETE FROM [Game] WHERE [Game_ID] = @Game_ID" 
            InsertCommand="INSERT INTO [Game] ([Game_Name]) VALUES (@Game_Name)" SelectCommand="SELECT * FROM [Game]" 
            UpdateCommand="UPDATE [Game] SET [Game_Name] = @Game_Name WHERE [Game_ID] = @Game_ID">
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
</asp:Content>
