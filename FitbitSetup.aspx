<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="FitbitSetup.aspx.cs" Inherits="Fitathon.org.FitbitSetup" %>

<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <p>You have not yet linked your Fitbit device.</p>
    <asp:PlaceHolder ID="phNotLinked" runat="server">
        <p>Clicking the link below will redirect you to Fitbit.com so you may give Fitathon.org permission to your activity data:</p>
        <asp:LinkButton ID="lnkLinkFitbit" Text="Link your Fitbit" runat="server" OnClick="lnkLinkFitbit_Click" />
    </asp:PlaceHolder>
</asp:Content>
