<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Pledge.aspx.cs" Inherits="Fitathon.org.Pledge" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
    <link href="css/cover.css" rel="stylesheet" />
    <link href="css/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <div class="cover-container">
        <div class="masthead clearfix">
            <div class="inner">
                <h3 class="masthead-brand">
                    <img src="logo.png" />Fitathon.org</h3>
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
        <div class="form-register-pledge">
            <h2 class="form-register-heading">How much will you pledge?</h2>
            <label for="txtPledge" class="sr-only">Pledge amount</label>
            <asp:TextBox runat="server" ID="txtPledge" TextMode="SingleLine" CssClass="form-control reg-pledge" placeholder="Pledge amount" required autofocus />
            <label for="txtPerSteps" class="sr-only">Per how many steps</label>
            <asp:TextBox runat="server" ID="txtPerSteps" TextMode="SingleLine" CssClass="form-control reg-steps" placeholder="Per how many steps" required autofocus />
            <label for="txtMaxDonation" class="sr-only">Max donation amount</label>
            <asp:TextBox runat="server" ID="txtMaxDonation" TextMode="SingleLine" CssClass="form-control reg-max" placeholder="Max donation amount" required autofocus />
            <asp:Button ID="btnSubmit" runat="server" Style="display: none;" OnClick="btnSubmit_Click" />
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnSubmit').click();">Continue</button>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#wand').click(function () {
                $('#txtPledge').val('1.00');
                $('#txtPerSteps').val('1000');
                $('#txtMaxDonation').val('20.00');
            });
        });
    </script>
</asp:Content>
