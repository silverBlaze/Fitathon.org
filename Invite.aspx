<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Invite.aspx.cs" Inherits="Fitathon.org.Invite" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
    <link href="css/cover.css" rel="stylesheet" />
    <link href="css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <div class="cover-container">
        <div class="masthead clearfix">
            <div class="inner">
                <h3 class="masthead-brand">Fitathon.org</h3>
                <nav>
                    <ul class="nav masthead-nav">
                        <li><a href="Default.aspx">Home</a></li>
                        <li class="active"><a href="#">Register</a></li>
                        <li><a href="Login.aspx">Log In</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="form-register-invite">
            <h2 class="form-register-heading">Invite friends and family</h2>
            <p>Enter the email addresses of people to invite them to sponsor you. These people will register and pledge an amount based on the number of steps you walk during your event!</p>
            <p>(Separate multiple emails by commas or on different lines.)</p>
            <label for="txtInvite" class="sr-only">Emails to invite</label>
            <asp:TextBox runat="server" ID="txtInvite" TextMode="MultiLine" Rows="8" CssClass="form-control reg-emails" placeholder="Emails to invite" required autofocus />
            <asp:Button ID="btnSubmit" runat="server" Style="display: none;" OnClick="btnSubmit_Click" />
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnSubmit').click();">Continue</button>
        </div>
    </div>
</asp:Content>
