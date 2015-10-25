<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="ProcessorSetup.aspx.cs" Inherits="Fitathon.org.ProcessorSetup" %>
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
        <div class="form-register-processor">
            <h2 class="form-register-heading">Braintree setup</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis volutpat, sapien ac efficitur molestie, felis dolor accumsan tellus, nec dictum dolor diam ac purus. Nulla facilisi.</p>
            <p>Need a Braintree account? <a href="https://apply.braintreegateway.com/signup/us?partner_source=http://fitathon.org" target="_blank" class="undr">Apply here</a>!</p>
            <label for="txtClientId" class="sr-only">Braintree Merchant ID</label>
            <asp:TextBox runat="server" ID="txtClientId" TextMode="SingleLine" CssClass="form-control reg-merch" placeholder="Braintree Merchant ID" required autofocus />
            <label for="txtPublicKey" class="sr-only">Email address</label>
            <asp:TextBox runat="server" ID="txtPublicKey" TextMode="SingleLine" CssClass="form-control reg-public" placeholder="Braintree Public Key" required autofocus />
            <label for="txtPrivateKey" class="sr-only">Re-enter password</label>
            <asp:TextBox runat="server" ID="txtPrivateKey" TextMode="SingleLine" CssClass="form-control reg-private" placeholder="Braintree Private Key" required autofocus />
            <asp:Button ID="btnSubmit" runat="server" Style="display: none;" OnClick="btnSubmit_Click" />
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnSubmit').click();">Continue</button>
        </div>
    </div>
</asp:Content>
