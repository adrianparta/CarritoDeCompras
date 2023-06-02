<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="carrito_de_compras.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <br />
                <div class="row">
                    <div class="col-3">
                        <asp:Label Text="Nombre" ID="lblName" runat="server" class="form-label" />
                    </div>
                    <div class="col-3">
                        <asp:Label Text="Marca" ID="lblBrand" runat="server" class="form-label" />
                    </div>
                    <div class="col-3">
                        <asp:Label Text="Categoria" ID="lblCategory" runat="server" class="form-label" />
                    </div>
                    <div class="col-3">
                        <asp:Label Text="Precio" ID="lblPrice" runat="server" class="form-label" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <asp:TextBox runat="server" ID="txtName" OnTextChanged="FilterEvent" CssClass="form-control" AutoPostBack="true" />
                    </div>
                    <div class="col-3">
                        <asp:DropDownList runat="server" ID="ddlBrand" OnSelectedIndexChanged="FilterEvent" CssClass="btn btn-outline-dark dropdown-toggle" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col-3">
                        <asp:DropDownList runat="server" ID="ddlCategory" OnSelectedIndexChanged="FilterEvent" CssClass="btn btn-outline-dark dropdown-toggle" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col-3">
                    </div>
                </div>
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
                                        <p class="card-text"><%#Eval("Description") %></p>
                                        <asp:Button ID="buttonDetails" Text="Ver detalles" CssClass="btn btn-primary" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Id" OnClick="buttonDetails_Click" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
</asp:Content>
