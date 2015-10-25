<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="RegisterEvent.aspx.cs" Inherits="Fitathon.org.RegisterEvent" %>

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
        <div class="form-register-event">
            <h2 class="form-register-heading">Tell us about the event</h2>
            <label for="txtName" class="sr-only">Event name</label>
            <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control reg-name" placeholder="Event name" required autofocus />
            <label for="txtBegins" class="sr-only">Event begins</label>
            <asp:TextBox runat="server" ID="txtBegins" TextMode="Date" CssClass="form-control reg-begins" placeholder="Event begins on" required autofocus />
            <label for="txtEnds" class="sr-only">Event begins</label>
            <asp:TextBox runat="server" ID="txtEnds" TextMode="Date" CssClass="form-control reg-ends" placeholder="Event ends on" required autofocus />
            <label for="txtEstimatedSteps" class="sr-only">Estimated # of steps</label>
            <asp:TextBox runat="server" ID="txtEstimatedSteps" TextMode="Number" CssClass="form-control reg-steps" placeholder="Estimated # of steps" required autofocus />
            <label for="txtDonationGoal" class="sr-only">Donation goal</label>
            <asp:TextBox runat="server" ID="txtDonationGoal" TextMode="Number" CssClass="form-control reg-goal" placeholder="Donation goal" required autofocus />
            <asp:Button ID="btnSubmit" runat="server" Style="display: none;" OnClick="btnSubmit_Click" />
            <button type="button" class="btn btn-lg btn-primary btn-block" onclick="$('#btnSubmit').click();">Continue</button>
        </div>
    </div>
</asp:Content>
