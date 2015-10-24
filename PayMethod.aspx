<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="PayMethod.aspx.cs" Inherits="Fitathon.org.PayMethod" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <p>//TODO: braintree dropin here</p>
    <br />
    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
