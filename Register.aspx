<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Fitathon.org.Register" %>

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
        <div class="form-register-user">
            <h2 class="form-register-heading">Tell us about yourself</h2>
            <label for="txtName" class="sr-only">Your name</label>
            <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control reg-name" placeholder="Your name" required autofocus />
            <label for="txtEmail" class="sr-only">Email address</label>
            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control reg-email" placeholder="Email address" required autofocus />
            <label for="txtPassword" class="sr-only">Re-enter password</label>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control reg-pwd2" placeholder="Create a password" required autofocus />
            <asp:Button ID="btnSubmit" runat="server" Style="display: none;" OnClick="btnSubmit_Click" />
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnSubmit').click();">Continue</button>
            <asp:PlaceHolder ID="phSponsor" runat="server">
                <asp:Panel ID="divEventCode" runat="server">
                    Event Code:
                    <asp:TextBox runat="server" ID="txtParticipantCode" />
                    <br />
                </asp:Panel>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phParticipant" runat="server"></asp:PlaceHolder>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            document.phase = 0;
            $('#wand').click(function () {
                if (document.phase == 0) {
                    $('#txtName').val('John Doe');
                    $('#txtEmail').val('jdoe436641@gmail.com');
                    $('#txtPassword').val('asdf');
                    document.phase = 1;
                } else {
                    $('#txtName').val('Jane Doe');
                    $('#txtEmail').val('asdf@asdf.com');
                    $('#txtPassword').val('asdf');
                    document.phase = 0;
                }
            });
        });
    </script>
</asp:Content>
