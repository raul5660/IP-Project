<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Project1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="form">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
            <h1>Contact Us</h1>
            <%--<p class="contact">--%>

            <div class="field-wrap">
                <asp:TextBox ID="YourName" runat="server" Width="345px" Placeholder="your name" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* your name is required"
                    ControlToValidate="YourName" ForeColor="Red" ValidationGroup="save" />
            </div>


            <%-- Your name:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="* name is required"
            ControlToValidate="YourName" ForeColor="Red" ValidationGroup="save" /><br />
                <asp:TextBox ID="YourName" runat="server" Width="345px" /><br />--%>

                Your email address:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
            ControlToValidate="YourEmail" ForeColor="Red" ValidationGroup="save" /><br />
            <asp:TextBox ID="YourEmail" runat="server" Width="345px" />
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
                SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                ValidationGroup="save" /><br />



            Subject:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
            ControlToValidate="YourSubject" ForeColor="Red" ValidationGroup="save" /><br />
            <asp:TextBox ID="YourSubject" runat="server" Width="345px" /><br />
            Your Question:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate="Comments" ForeColor="Red" ValidationGroup="save" /><br />
            <asp:TextBox ID="Comments" runat="server"
                TextMode="MultiLine" Rows="10" Width="345px" />
            <%-- </p>--%>
            <p>
                <asp:Button ID="btnSubmit" runat="server" Text="Send"
                    OnClick="Button1_Click" ValidationGroup="save" Width="345px" />
            </p>
        </asp:Panel>
        <p>
            <asp:Label ID="DisplayMessage" runat="server" Visible="false" ForeColor="Red" />
        </p>
    </div>
</asp:Content>
