<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="RegisterEvent.aspx.cs" Inherits="Fitathon.org.RegisterEvent" %>

<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    Begins:
    <asp:TextBox runat="server" ID="txtBegins" />
    <br />
    Ends:
    <asp:TextBox runat="server" ID="txtEnds" />
    <br />
    Est Steps:
    <asp:TextBox runat="server" ID="txtEstimatedSteps" />
    <br />
    Donation Goal:
    <asp:TextBox runat="server" ID="txtDonationGoal" />
    <br />
    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />

</asp:Content>
