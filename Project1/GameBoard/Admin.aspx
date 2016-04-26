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
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table table-striped">
                    <Columns>
                        <%--<asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" InsertVisible="False" ReadOnly="True" />--%>
                        <asp:BoundField DataField="User_UserName" HeaderText="User_UserName" SortExpression="User_UserName" />
                       <%-- <asp:BoundField DataField="User_Password" HeaderText="User_Password" SortExpression="User_Password" />--%>
                        <asp:BoundField DataField="User_FirstName" HeaderText="User_FirstName" SortExpression="User_FirstName" />
                        <asp:BoundField DataField="User_LastName" HeaderText="User_LastName" SortExpression="User_LastName" />
                        <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                        <asp:BoundField DataField="User_AccountType" HeaderText="User_AccountType" SortExpression="User_AccountType" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>" 
                    SelectCommand="SELECT [User_UserName], [User_FirstName], [User_LastName], [User_Email], [User_AccountType] FROM [User]">
                </asp:SqlDataSource>
            </div>
        </div>
        <%--Games--%>
        <div id="Games" style="display: none;">
            <h1 class="page-header">Games</h1>
            <div class="table-responsive">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_ID" DataSourceID="SqlDataSource3" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" InsertVisible="False" ReadOnly="True" SortExpression="Game_ID" />
                        <asp:BoundField DataField="Game_Name" HeaderText="Game_Name" SortExpression="Game_Name" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
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
        </div>
        <%--Categories--%>
        <div id="Categories" style="display: none;">
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
        </div>
        <%--Challenges--%>
        <div id="Challenges" style="display: none;">
            <h1 class="page-header">Challenges</h1>
            <div class="table-responsive">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Challenge_ID" DataSourceID="SqlDataSource2" CssClass="table table-striped">
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
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
        </div>
        <%--Profile--%>
        <div id="Profile" style="display: none;">
            <h1 class="page-header">Profile</h1>
        </div>
        <%--Help--%>
        <div id="Help" style="display: none;">
            <h1 class="page-header">Help</h1>
        </div>
    </div>
</asp:Content>
