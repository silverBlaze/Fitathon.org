<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Invite.aspx.cs" Inherits="Fitathon.org.Invite" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    Emails to invite:
    <asp:TextBox ID="txtInvite" runat="server" TextMode="MultiLine" Rows="8" Columns="50" />
    <br />
    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />

</asp:Content>
