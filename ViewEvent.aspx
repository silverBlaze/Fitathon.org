<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="True" CodeBehind="ViewEvent.aspx.cs" Inherits="Fitathon.org.ViewEvent" %>

<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <h2>
        <asp:Literal ID="litEventName" runat="server" /><small>(<asp:Literal ID="litBegins" runat="server" />
            -
            <asp:Literal ID="litEnds" runat="server" />)</small></h2>
    <asp:PlaceHolder ID="phBeforeTop" runat="server" Visible="false">Estimated Steps:
        <asp:Literal ID="litEstSteps" runat="server" />
        <asp:PlaceHolder ID="phStepsToMax" runat="server" Visible="false">(<asp:Literal ID="litStepsToMax" runat="server" />
            to max)</asp:PlaceHolder>
        <br />
        Estimated Donations:
        <asp:Literal ID="litEstDonations" runat="server" />
        <asp:PlaceHolder ID="phMaxDonations" runat="server" Visible="false">(<asp:Literal ID="litMaxDonations" runat="server" />
            max)</asp:PlaceHolder>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="phDuringTop" runat="server" Visible="false">$0 - <b>
        <asp:Literal ID="litRaisedDuring" runat="server" />
        raised</b> -
        <asp:Literal ID="litEstDonationsDuring" runat="server" />
        <br />
        0 - <b>
            <asp:Literal ID="litStepsDuring" runat="server" />
            steps</b> -
        <asp:Literal ID="litEstStepsDuring" runat="server" />
        <br />
        <asp:Literal ID="litPercentToGoalDuring" runat="server" />%
        <br />
        Time remaining:
        <asp:Literal ID="litTimeRemaining" runat="server" />

        <asp:Button ID="btnForceSync" Text="Force Sync" runat="server" />
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="phAfterTop" runat="server" Visible="false">
        <asp:Literal ID="litRaisedAfter" runat="server" />
        raised!
        <br />
        <asp:Literal ID="litStepsAfter" runat="server" />
        steps!
        <br />
        <asp:Literal ID="litPercentToGoalAfter" runat="server" />%
        <br />
        <asp:Literal ID="litSuccessMessage" runat="server" />
        <br />
        <asp:Literal ID="litSettlementStatus" runat="server" />
        <asp:Button ID="btnSettleEvent" Text="Settle Event" runat="server" />
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
</asp:Content>
