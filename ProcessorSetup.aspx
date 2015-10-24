<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="ProcessorSetup.aspx.cs" Inherits="Fitathon.org.ProcessorSetup" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    Braintree ClientID:
    <asp:TextBox runat="server" ID="txtClientId" />
    <br />
    Braintree Public Key:
    <asp:TextBox runat="server" ID="txtPublicKey" />
    <br />
    Braintree Private Key:
    <asp:TextBox runat="server" ID="txtPrivateKey" />
    <br />
    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
