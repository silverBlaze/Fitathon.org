<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Fitathon.org.Default" %>
<asp:Content ID="cbody" ContentPlaceHolderID="head" runat="server">
    
    <link href="css/cover.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="chead" ContentPlaceHolderID="body" runat="server">
    <div class="cover-container">
        <div class="masthead clearfix">
            <div class="inner">
                <h3 class="masthead-brand">
                    <img src="logo.png" />Fitathon.org</h3>
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
        <h1 class="cover-heading">Fitathon.org<br /><small>The Digital Walkathon Platform</small></h1>
        
        <p class="lead">Fitathon.org is a platform where non-for-profit organizations can raise funds 
            by planning a digital walkathon. By integrating Fitbit devices and Braintree's
            innovative payment platform, participants from any location can walk to raise 
            funds from sponsors' saved credit cards or PayPal accounts.</p>
        <p class="lead">
            <asp:LinkButton ID="btnLearnMore" CssClass="btn btn-lg btn-primary" Text="Learn More" runat="server" OnClick="btnLearnMore_Click" />
        </p>
    </div>
</asp:Content>
