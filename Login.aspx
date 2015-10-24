<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Fitathon.org.Login" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    Email: <asp:TextBox ID="txtEmail" runat="server" />
    <br />
    Password: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

    <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" />
</asp:Content>
