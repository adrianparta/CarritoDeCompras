<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="carrito_de_compras.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <br />
                <div class="row">
                    <div class="col-4">
                        <div class="form-floating">
                        <asp:TextBox runat="server" ID="txtName" OnTextChanged="FilterEvent" CssClass="form-control" AutoPostBack="true" />
                          <label for="txtName">Nombre del Producto</label>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-floating">
                            <asp:DropDownList runat="server" ID="ddlBrand" OnSelectedIndexChanged="FilterEvent" CssClass="form-select" AutoPostBack="true"></asp:DropDownList>
                            <label for="ddlBrand" class="form-label">Marca</label>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-floating">
                        <asp:DropDownList runat="server" ID="ddlCategory" OnSelectedIndexChanged="FilterEvent" CssClass="form-select" AutoPostBack="true"></asp:DropDownList>
                            <label for="ddlCategory" class="form-label">Categoria</label>
                        </div>
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
                                        <div class="vstack gap-3">
                                            <asp:Button ID="buttonDetails" Text="Ver detalles" CssClass="btn btn-primary form-control" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Id" OnClick="buttonDetails_Click" />
                                            <div class="btn-group gap-5" role="group">
                                                <div class="hstack">
                                                    <asp:Button ID="btnRemove" Text="-1" CssClass="btn btn-danger" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />                                        
                                                    <asp:Label ID="lblTotalItem" Text=<%#Eval("Amount") %> CssClass="form-control" runat="server" />
                                                    <asp:Button ID="btnAdd" Text="+1" CssClass="btn btn-success" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />                                        
                                                </div>
                                                <asp:Button ID="btnAddCart" Text="Añadir" CssClass="btn btn-primary" runat="server" OnClick="btnAddCart_Click" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
