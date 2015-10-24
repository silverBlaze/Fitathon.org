<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="Fitathon.org.Role" %>
<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    
    <asp:DropDownList ID="ddlRole" runat="server">
        <asp:ListItem Text="Coordinator" Value="coordinator" />
        <asp:ListItem Text="SoloWalker" Value="solowalker" />
        <asp:ListItem Text="Sponsor" Value="sponsor" />
    </asp:DropDownList>
    
    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
