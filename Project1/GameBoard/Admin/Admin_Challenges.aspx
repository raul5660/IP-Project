<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin_Challenges.aspx.cs" Inherits="Project1.GameBoard.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li><asp:LinkButton ID="Users" runat="server" OnClick="Users_Click">Users</asp:LinkButton></li>
    <li><asp:LinkButton ID="Games" runat="server" OnClick="Games_Click">Games</asp:LinkButton></li>
    <li><asp:LinkButton ID="Categories" runat="server" OnClick="Categories_Click">Categories</asp:LinkButton></li>
    <li class="active"><asp:LinkButton ID="Challenges" runat="server" OnClick="Challenges_Click">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Challenges</h1>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Challenge_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="Challenge_ID" HeaderText="Challenge_ID" InsertVisible="False" ReadOnly="True" SortExpression="Challenge_ID" />
                <asp:BoundField DataField="Category_ID" HeaderText="Category_ID" SortExpression="Category_ID" />
                <asp:BoundField DataField="Challenge_Name" HeaderText="Challenge_Name" SortExpression="Challenge_Name" />
                <asp:BoundField DataField="Challenge_Points" HeaderText="Challenge_Points" SortExpression="Challenge_Points" />
                <asp:BoundField DataField="Challenge_Answer" HeaderText="Challenge_Answer" SortExpression="Challenge_Answer" />
                <asp:BoundField DataField="Challenge_Solution" HeaderText="Challenge_Solution" SortExpression="Challenge_Solution" />
                <asp:BoundField DataField="Challenge_Question" HeaderText="Challenge_Question" SortExpression="Challenge_Question" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" 
            DeleteCommand="DELETE FROM [Challenge] WHERE [Challenge_ID] = @Challenge_ID" 
            InsertCommand="INSERT INTO [Challenge] ([Category_ID], [Challenge_Name], [Challenge_Points], [Challenge_Answer], [Challenge_Solution], [Challenge_Question]) VALUES (@Category_ID, @Challenge_Name, @Challenge_Points, @Challenge_Answer, @Challenge_Solution, @Challenge_Question)" 
            SelectCommand="SELECT * FROM [Challenge]" 
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
    </div>
</asp:Content>
