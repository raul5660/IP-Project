<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Game3.aspx.cs" Inherits="Project1.GameBoard.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li><a href="Game1.aspx">Game 1</a></li>
    <li><a href="Game2.aspx">Game 2</a></li>
    <li><a href="Game3.aspx">Game 3</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 class="page-header">Game 3</h1>
    <div class="col-xs-12">
        <div class="col-xs-6">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>"
                SelectCommand="SELECT Challenge.Challenge_ID ,Category.Category_Name, Challenge.Challenge_Name, Challenge.Challenge_Points FROM Game INNER JOIN Category ON Game.Game_ID = Category.Game_ID INNER JOIN Challenge ON Category.Category_ID = Challenge.Category_ID WHERE (Category.Game_ID = 3)"></asp:SqlDataSource>
            <asp:GridView ID="Game3Challenges" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                DataKeyNames="Challenge_ID" BorderStyle="None" CssClass="table table-striped" PageSize="8" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Category_Name" HeaderText="Category" SortExpression="Category_Name" />
                    <asp:BoundField DataField="Challenge_Name" HeaderText="Challenge" SortExpression="Challenge_Name" />
                    <asp:BoundField DataField="Challenge_Points" HeaderText="Points" SortExpression="Challenge_Points" />
                </Columns>
                <PagerSettings PageButtonCount="5" />
            </asp:GridView>
        </div>
        <div class="col-xs-6">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>"
                SelectCommand="SELECT [Challenge_ID], [Challenge_Name], [Challenge_Points], [Challenge_Question] FROM [Challenge] WHERE ([Challenge_ID] = @Challenge_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Game3Challenges" Name="Challenge_ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Challenge_ID"
                DataSourceID="SqlDataSource2" CssClass="table table-striped">
                <Fields>
                    <asp:BoundField DataField="Challenge_Name" HeaderText="Challenge" SortExpression="Challenge_Name" />
                    <asp:BoundField DataField="Challenge_Points" HeaderText="Point Value" SortExpression="Challenge_Points" />
                    <asp:BoundField DataField="Challenge_Question" HeaderText="Question" SortExpression="Challenge_Question" />
                    <asp:TemplateField HeaderText="Flag">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" OnClick="FlagSubmit_Click" Text="Submit" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
</asp:Content>
