<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Project1.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CTFConnectionString %>"
        SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>

    <%-- Login and Registration Modal Popup--%>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="form">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <div class="modal-header">
                    <ul class="tab-group">
                        <li class="tab active"><a href="#signup">Sign Up</a></li>
                        <li class="tab"><a href="#login">Log In</a></li>
                    </ul>
                </div>
                <div class="modal-body">
                    <div class="tab-content">
                        <div id="signup">
                            <h1>Sign Up. It's Free</h1>
                            <div class="top-row">
                                <div class="field-wrap">
                                    <asp:TextBox ID="FirstNameSignup" runat="server" Placeholder="first name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVfirst" runat="server" ErrorMessage="* first name required"
                                        ControlToValidate="FirstNameSignup" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="field-wrap">
                                    <asp:TextBox ID="LastNameSignUp" runat="server" Placeholder="last name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVlast" runat="server" ErrorMessage="* last name required"
                                        ControlToValidate="LastNameSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="field-wrap">
                                <asp:TextBox ID="EmailSignUp" runat="server" Placeholder="email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVemail" runat="server" ErrorMessage="* email required"
                                    ControlToValidate="EmailSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="field-wrap">
                                <asp:TextBox ID="UserNameSignUp" runat="server" Placeholder="username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVuname" runat="server" ErrorMessage="* username required"
                                    ControlToValidate="UserNameSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="field-wrap">
                                <asp:TextBox ID="PasswordSignUp" runat="server" Placeholder="password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVpass" runat="server" ErrorMessage="* password required"
                                    ControlToValidate="PasswordSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="field-wrap">
                                <asp:TextBox ID="ConfirmPasswordSignUp" runat="server" Placeholder="confirm password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVconfirm" runat="server" ErrorMessage="* password required"
                                    ControlToValidate="ConfirmPasswordSignUp" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Button ID="ButtonSignUp" runat="server" Text="Get Started" CssClass="btn btn-success" OnClick="ButtonSignUp_Click" />
                        </div>
                        <%--Login form--%>
                        <div id="login">
                            <h1>Welcome Back</h1>
                            <div class="field-wrap">
                                <asp:TextBox ID="UsernameSignIn" runat="server" Placeholder="username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* username required"
                                    ControlToValidate="UsernameSignIn" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                            <div class="field-wrap">
                                <asp:TextBox ID="PasswordSignIn" runat="server" TextMode="Password" Placeholder="password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* password required"
                                    ControlToValidate="PasswordSignIn" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Sign in" OnClick="SignIn_Click" ValidationGroup="1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
