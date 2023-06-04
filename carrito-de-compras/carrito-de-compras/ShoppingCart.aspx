<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="carrito_de_compras.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-8">
            <asp:Repeater ID="repeaterCart" runat="server">
                <ItemTemplate>
                    <div class="card mb-4">
                        <div class="card-header"><%#Eval("Name") %></div>
                        <div class="row g-0">
                            <div class="col-md-2">
                                <img src="<%#((Domain.Item)Container.DataItem).GetFirstImage()%>" onerror="<%#noImageUrl%>" class="img-fluid rounded-start" style="max-height: 200px; max-width: 200px;">
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
                                            <asp:Button ID="btnRemove" Text="-1" CssClass="btn btn-danger" runat="server" OnClick="AlterTotalItems" CommandArgument='<%#Eval("Id") %>' CommandName="Id" />
                                            <asp:Label ID="lblTotalItem" Text='<%#Eval("Amount") %>' CssClass="form-control" runat="server" />
                                            <asp:Button ID="btnAdd" Text="+1" CssClass="btn btn-success" runat="server" OnClick="AlterTotalItems"  CommandArgument='<%#Eval("Id") %>' CommandName="Id" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <asp:Repeater ID="repeaterPrices" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-7">
                                    <p ><%#Eval("Name") %></p>
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
                    <asp:Label ID="LabelTotal" Text="<%#Total.ToString() %>" runat="server" />
                    <asp:Button Text="Comprar" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
