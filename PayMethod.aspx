<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeBehind="PayMethod.aspx.cs" Inherits="Fitathon.org.PayMethod" %>

<asp:Content ID="chead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cbody" ContentPlaceHolderID="body" runat="server">
    <br />

    

    <div id="bt-container"></div>

    <asp:Button ID="btnSubmit" Text="btnSubmit" runat="server" OnClick="btnSubmit_Click" />

    <script src="https://js.braintreegateway.com/v2/braintree.js"></script>
    <asp:Literal ID="litBTClientToken" runat="server" />
    <script type="text/javascript">
        braintree.setup(clientToken, "dropin", {
            container: "bt-container"
        });
    </script>
</asp:Content>
