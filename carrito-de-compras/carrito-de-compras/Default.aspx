<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="carrito_de_compras.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Catálogo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <br />
                <section class="gallery">
                    <div class="container">
                        <div class="row gy-2">
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
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                            <asp:Repeater runat="server" ID="repeaterDefault" OnItemDataBound="repeaterDefault_ItemDataBound">
                                <ItemTemplate>
                                    <div class="product-box d-inline position-relative custom-card">
                                        <div class="image-container">
                                            <img class="card-img-top img-fluid image-card-custom" src="<%#((Domain.Item)Container.DataItem).GetFirstImage()%>" alt="..." onerror="<%#noImageUrl%>">
                                        </div>
                                        <div class="card-body card-body-custom">
                                            <h5 class="card-title"><%#Eval("Name")%></h5>
                                            <p class="card-text"><%#Eval("Description") %></p>
                                            <div class="vstack">

                                                <div class="row justify-content-center">
                                                     <asp:Button ID="buttonDetails" Text="Ver detalles" CssClass="btn btn-primary my-1 col-10 " runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Id" OnClick="buttonDetails_Click"/>
                                                </div>

                                                <div class="row p-0 mx-0 my-1 justify-content-center" role="group">

                                                    <div class="hstack col-5 p-0 m-0" visible="false" ID="itemAmount" runat="server" CommandArgument='<%#Eval("Amount") %>' CommandName="itemAmount">
                                                        <asp:Button ID="btnRemove" Text="-" CssClass="btn btn-danger" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id"/>
                                                        <asp:Label ID="lblTotalItem" Text='<%#Eval("Amount") %>' CssClass="form-control" runat="server"/>
                                                        <asp:Button ID="btnAdd" Text="+" CssClass="btn btn-success" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />
                                                    </div>

                                                    <asp:Button ID="btnAddCart" Text="Añadir" CssClass="btn btn-primary col-5" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </section>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
