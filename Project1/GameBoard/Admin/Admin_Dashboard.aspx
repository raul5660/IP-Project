<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Project1.GameBoard.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li><asp:LinkButton ID="Users" runat="server" OnClick="Users_Click">Users</asp:LinkButton></li>
    <li><asp:LinkButton ID="Games" runat="server" OnClick="Games_Click">Games</asp:LinkButton></li>
    <li><asp:LinkButton ID="Categories" runat="server" OnClick="Categories_Click">Categories</asp:LinkButton></li>
    <li><asp:LinkButton ID="Challenges" runat="server" OnClick="Challenges_Click">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Dashboard</h1>
</asp:Content>
