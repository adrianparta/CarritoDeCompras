<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="carrito_de_compras.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row gy-3 my-3">
            <asp:Repeater runat="server" ID="repeaterDefault">
            <ItemTemplate>
            <div class="col-md-3 col-lg-3">
                <div class="card item-card">
                    <div class="image-container">
                        <img class="card-img-top img-fluid image-card-custom" src="<%#((Domain.Item)Container.DataItem).GetFirstImage()%>" alt="..." onerror="<%#noImageUrl%>">
                    </div>
                    <div class="card-body card-body-custom">
                        <h5 class="card-title"><%#Eval("Name")%></h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <asp:Button ID="buttonDetails" Text="Ver detalles" cssclass="btn btn-primary" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Id" OnClick="buttonDetails_Click" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
        </div>
    </div>
    
</asp:Content>
