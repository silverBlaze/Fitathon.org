<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Fitathon.org.Login" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
    <link href="css/cover.css" rel="stylesheet" />
    <link href="css/signin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <div class="cover-container">
        <div class="masthead clearfix">
            <div class="inner">
                <h3 class="masthead-brand">Fitathon.org</h3>
                <nav>
                    <ul class="nav masthead-nav">
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="Register.aspx">Register</a></li>
                        <li class="active"><a href="#">Log In</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="form-signin">
            <h2 class="form-signin-heading">Please log in</h2>
            <label for="txtEmail" class="sr-only">Email address</label>
            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" placeholder="Email address" required autofocus />
            <label for="txtPassword" class="sr-only">Password</label>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password" required autofocus />
            <asp:Button ID="btnLogin" Text="hidden" runat="server" Style="display: none;" OnClick="btnLogin_Click"/>
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnLogin').click();">Log in</button>
        </div>
    </div>
</asp:Content>
