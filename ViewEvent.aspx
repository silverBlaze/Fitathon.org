<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="True" CodeBehind="ViewEvent.aspx.cs" Inherits="Fitathon.org.ViewEvent" %>

<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
    <link href="css/cover.css" rel="stylesheet" />
    <style type="text/css">
        .undr {
            text-decoration: underline;
        }

        .sm {
            font-size: .8em;
        }

        h3 img {
            height: 90px;
            width: 90px;
        }

        fieldset {
            margin-top: 10px;
        }

        legend {
            font-size: 12pt;
            margin-bottom: 4px;
        }

        .form-view-event {
            max-width: 450px;
            padding: 15px;
            margin: 0 auto;
        }

        .jumbotron {
            padding: 10px;
            margin: 0 auto;
            background-color: #fff;
            color: #222;
        }

        .container .jumbotron {
            padding-left: 35px;
            padding-right: 35px;
        }

        .jumbotron a {
            color: #337ab7;
            text-decoration: underline;
            text-shadow: none;
        }

            .jumbotron a:hover {
                color: #337ab7;
                text-decoration: none;
            }

        .sm-logo {
            width: 45px;
            height: 45px;
        }

        ul {
            padding-left: 0;
        }

        .progress {
            margin-bottom: 0;
        }
    </style>
    <script type="text/javascript">
        setTimeout('document.location = document.location;', 1000 * 60);
    </script>
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <div class="cover-container">
        <div class="masthead clearfix">
            <div class="inner">
                <h3 class="masthead-brand">
                    <img src="logo.png" />Fitathon.org</h3>
                <nav>
                    <ul class="nav masthead-nav">
                        <li>
                            <div>
                                Logged in as
                                <asp:Literal ID="litUser" runat="server" />
                                (<a href="Default.aspx" class="undr sm">Log out</a>)
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="form-view-event">
            <div class="jumbotron">
                <h2>
                    <img class="sm-logo" src="logo-sm.png" />
                    <asp:Literal ID="litEventName" runat="server" />
                    <br />
                    <small>(<asp:Literal ID="litBegins" runat="server" />
                        -
            <asp:Literal ID="litEnds" runat="server" />)</small></h2>
                <asp:PlaceHolder ID="phBeforeTop" runat="server" Visible="false"><b>Estimated Steps:</b>
                    <asp:Literal ID="litEstSteps" runat="server" />
                    <asp:PlaceHolder ID="phStepsToMax" runat="server" Visible="false">(<asp:Literal ID="litStepsToMax" runat="server" />
                        to max)</asp:PlaceHolder>
                    <br />
                    <b>Estimated Donations:</b>
                    <asp:Literal ID="litEstDonations" runat="server" />
                    <asp:PlaceHolder ID="phMaxDonations" runat="server" Visible="false">(<asp:Literal ID="litMaxDonations" runat="server" />
                        max)</asp:PlaceHolder>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="phDuringTop" runat="server" Visible="false">
                    <b><asp:Literal ID="litRaisedDuring" runat="server" />
                    raised</b> (out of <asp:Literal ID="litEstDonationsDuring" runat="server" />)
                    <br />

                    <div class="progress">
                        <asp:Panel ID="pnlProgressBarDuringTop" CssClass="progress-bar during-progress-bar" runat="server">
                            <asp:Literal ID="litPercentToGoalDuring" runat="server" />%
                        </asp:Panel>

                    </div>
                         <b><asp:Literal ID="litStepsDuring" runat="server" />
                        steps</b> (out of <asp:Literal ID="litEstStepsDuring" runat="server" />)
                    <br />
                    <br />
                    <b>Time remaining:</b>
        <asp:Literal ID="litTimeRemaining" runat="server" />

                    <asp:Button ID="btnForceSync" Text="Force Sync" runat="server" style="display:none;"/>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="phAfterTop" runat="server" Visible="false">
                    <asp:Literal ID="litRaisedAfter" runat="server" />
                    raised!
                    <div class="progress">
                        <asp:Panel ID="pnlProgressBarAfterTop" CssClass="progress-bar" runat="server">
                            <asp:Literal ID="litPercentToGoalAfter" runat="server" />% of estimated steps
                        </asp:Panel>

                    </div>
                    <asp:Literal ID="litStepsAfter" runat="server" />
                    steps!
        <br />
                    <asp:Literal ID="litSuccessMessage" runat="server" />
                    <br />
                    <div style="display: none;">
                        <asp:Literal ID="litSettlementStatus" runat="server" />
                        <asp:Button ID="btnSettleEvent" Text="Settle Event" runat="server" />
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="phSponsors" runat="server" Visible="false">
                    <fieldset>
                        <legend>Sponsors</legend>
                        <asp:PlaceHolder ID="phSponsorList" runat="server"></asp:PlaceHolder>
                    </fieldset>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="phPledge" runat="server" Visible="false">
                    <fieldset>
                        <legend>My Pledge</legend>
                        <ul>
                            <li>
                                <asp:Literal ID="litPledgeAmount" runat="server" />
                                /
                    <asp:Literal ID="litPledgeUnit" runat="server" />
                                steps
                    (<asp:Literal ID="litDonationMax" runat="server" />
                                max)
                            </li>
                            <li>Paid with my
                    <asp:Literal ID="litPayMethodType" runat="server" /></li>
                        </ul>
                        <a href="Pledge.aspx">Update my pledge</a> | <a href="PayMethod.aspx">Update my payment method</a> |
            <asp:LinkButton ID="btnCancelPledge" Text="Cancel Pledge" runat="server" />
                    </fieldset>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="phDonation" runat="server" Visible="false">
                    <fieldset>
                        <legend>My Donation</legend>
                        <ul>
                            <li>Receipt #<asp:Literal ID="litDonationReceipt" runat="server" /></li>
                            <li>Paid
                    <asp:Literal ID="litDonationAmount" runat="server" />
                                with my
                    <asp:Literal ID="litDonationPayMethodType" runat="server" /></li>
                        </ul>
                    </fieldset>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
