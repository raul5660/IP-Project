<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="User_Dashboard.aspx.cs" Inherits="Project1.GameBoard.WebForm2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
        <li>
            <asp:LinkButton ID="LinkButton1" runat="server">MITRE 2012</asp:LinkButton></li>
        <li>
            <asp:LinkButton ID="LinkButton2" runat="server">MITRE 2013</asp:LinkButton></li>
        <li>
            <asp:LinkButton ID="LinkButton3" runat="server">MITRE 2014</asp:LinkButton></li>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-xs-12">
        <h1 class="page-header">Dashboard</h1>

        <%--Diplays available challenges with select option--%>
        <div class="col-xs-6">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>"
                SelectCommand="SELECT Challenge.Challenge_ID ,Category.Category_Name, Challenge.Challenge_Name, Challenge.Challenge_Points FROM Game INNER JOIN Category ON Game.Game_ID = Category.Game_ID INNER JOIN Challenge ON Category.Category_ID = Challenge.Category_ID WHERE (Category.Game_ID = 1)"></asp:SqlDataSource>
            <asp:GridView ID="Game1Challenges" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Challenge_ID" BorderStyle="None" CssClass="table-responsive" PageSize="6">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Category_Name" HeaderText="Category" SortExpression="Category_Name" />
                    <asp:BoundField DataField="Challenge_Name" HeaderText="Challenge" SortExpression="Challenge_Name" />
                    <asp:BoundField DataField="Challenge_Points" HeaderText="Points" SortExpression="Challenge_Points" />
                </Columns>
                <PagerSettings Mode="NextPreviousFirstLast" />
            </asp:GridView>
        </div>

        <%--Shows challenge details--%>
        <div class="col-xs-6">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>"
                SelectCommand="SELECT [Challenge_ID], [Challenge_Name], [Challenge_Points], [Challenge_Question] FROM [Challenge] WHERE ([Challenge_ID] = @Challenge_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Game1Challenges" Name="Challenge_ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" AutoGenerateRows="False" DataKeyNames="Challenge_ID" DataSourceID="SqlDataSource2" CssClass="table-responsive">
                <Fields>
                    <asp:BoundField DataField="Challenge_Name" HeaderText="Challenge" SortExpression="Challenge_Name" />
                    <asp:BoundField DataField="Challenge_Points" HeaderText="Point Value" SortExpression="Challenge_Points" />
                    <asp:BoundField DataField="Challenge_Question" HeaderText="Question" SortExpression="Challenge_Question" />
                </Fields>
            </asp:DetailsView>
        </div>
    </div>


</asp:Content>
