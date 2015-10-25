<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="FitbitSetup.aspx.cs" Inherits="Fitathon.org.FitbitSetup" %>

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
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="Register.aspx">Register</a></li>
                        <li><a href="Login.aspx">Log In</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="form-register-fitbit">
            <h2 class="form-register-heading">Fitbit setup</h2>
            <asp:PlaceHolder ID="phNotLinked" runat="server">
                <p>You have not yet linked your Fitbit device to Fitathon.org</p>
                <p>Clicking the link below will redirect you to Fitbit.com so you may give Fitathon.org permission to your activity data:</p>
                <asp:LinkButton ID="lnkLinkFitbit" CssClass="btn btn-lg btn-primary btn-block" Text="Link your Fitbit" runat="server" OnClick="lnkLinkFitbit_Click" />
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
