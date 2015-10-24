<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Fitathon.org.Register" %>

<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    Name:
    <asp:TextBox ID="txtName" runat="server" />
    <br />
    Email:
    <asp:TextBox ID="txtEmail" runat="server" />
    <br />
    Password:
    <asp:TextBox ID="txtPassword" runat="server" />
    <br />

    <asp:PlaceHolder ID="phParticipant" runat="server"></asp:PlaceHolder>

    <asp:PlaceHolder ID="phSponsor" runat="server">
        <asp:Panel ID="divEventCode" runat="server">
            Event Code:
            <asp:TextBox runat="server" ID="txtParticipantCode" />
            <br />
        </asp:Panel>
    </asp:PlaceHolder>
    <asp:Button ID="btnSubmit" Text="Register" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
