<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="carrito_de_compras.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Carrito de compras</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <h4>Confección de tu carrito de compra</h4>
        <br />
    </div>
    <div class="row">
        <div class="col-8">
            <asp:Repeater ID="repeaterCart" runat="server">
                <ItemTemplate>
                    <div class="card mb-4">
                        <div class="card-header"><%#Eval("Name") %></div>
                        <div class="row g-0">
                            <div class="col-md-2" style="z-index:200">
                                <a href="Detail.aspx?Id= <%#Eval("Id") %>" style="box-sizing:content-box">
                                    <img src="<%#((Domain.Item)Container.DataItem).GetFirstImage()%>" onerror="<%#noImageUrl%>" class="img-fluid rounded-start" style="max-height: 200px; max-width: 200px;">
                                </a>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Category") %> - <%#Eval("Brand") %></h5>
                                    <p class="card-text"><%#Eval("Description") %></p>
                                    <p class="card-text">Por unidad: <%#Eval("Price") %></p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div style="position: absolute; top: 0; bottom: 0; display: flex; align-items: center; justify-content: center; width: 15%;">
                                    <div class="d-flex justify-content-center">
                                        <div class="hstack">
                                            <asp:Button ID="btnRemove" Text="-" CssClass="btn btn-danger" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />
                                            <asp:Label ID="lblTotalItem" Text='<%#Eval("Amount") %>' CssClass="form-control" runat="server" />
                                            <asp:Button ID="btnAdd" Text="+" CssClass="btn btn-success" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <%if (AnyItem)
            {%>
        <div class="col-4">
            <div class="card">
                <div class="card-header">
                    <h5>Detalle de lo comprado</h5>
                </div>
                <div class="card-body">
                    <asp:Repeater ID="repeaterPrices" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-7">
                                    <p><%#Eval("Name") %></p>
                                </div>
                                <div class="col-2">
                                    <p>x <%#Eval("Amount") %></p>
                                </div>
                                <div class="col-3">
                                    <p><%#Eval("TotalPrice")%></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="card-footer text-body-secondary">
                    <div class="row">
                        <div class="align-self-xl-center col-9">
                            <asp:Label Text="El total de su compra es: " runat="server" />
                            <asp:Label ID="LabelTotal" Text="<%#Total.ToString() %>" runat="server" />
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalBuyDone">
                                Comprar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}
        else
        { %>
        <div class="alert alert-warning" role="alert">
            <h4>Usted no posee ningún Item en su carrito.</h4>
            <h4>Por favor vuelva a ingresar a esta sección luego de agregar al menos 1 Item.</h4>
        </div>
        <% } %>
    </div>
    <div class="modal fade" id="modalBuyDone" tabindex="-1" aria-labelledby="lblModalBuyDone" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="lblModalBuyDone">Compra realizada con exito!</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label Text="Gracias por realizar su compra con nosotros!" runat="server" />
                    <br />
                    <asp:Label Text="Esperamos que vuelva pronto" runat="server" />
                    <br />
                    <asp:Label Text="Procederemos a vaciar su carrito para que pueda añadir nuevos Items" runat="server" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnBuy" CssClass="btn btn-primary" Text="Cerrar" runat="server" OnClick="btnBuy_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
