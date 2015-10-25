<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="PayMethod.aspx.cs" Inherits="Fitathon.org.PayMethod" %>

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
        <div class="form-register-proc">
            <div class="jumbotron">
                <div id="bt-container"></div>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Style="display: none;" OnClick="btnSubmit_Click" />
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnSubmit').click();">Continue</button>
        </div>
    </div>

    <script src="https://js.braintreegateway.com/v2/braintree.js"></script>
    <asp:Literal ID="litBTClientToken" runat="server" />
    <script type="text/javascript">
        braintree.setup(clientToken, "dropin", {
            container: "bt-container"
        });
    </script>
</asp:Content>
