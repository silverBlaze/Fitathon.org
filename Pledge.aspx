<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Pledge.aspx.cs" Inherits="Fitathon.org.Pledge" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    Pledge:
    <asp:TextBox runat="server" ID="txtDonationGoal" /> per 
    <asp:DropDownList ID="ddlPerSteps" runat="server">
        <asp:ListItem Text="500" Value="500" />
        <asp:ListItem Text="1000" Value="1000" />
        <asp:ListItem Text="5000" Value="5000" />
        <asp:ListItem Text="10000" Value="10000" />
    </asp:DropDownList>
    steps
    <br />
    Max Donation:
    <asp:TextBox runat="server" ID="txtMaxDonation" />
    <br />
    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
