<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="carrito_de_compras.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Detalles del producto</title>
    <link href="https://api.fontshare.com/v2/css?f[]=anton@400&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div>
            <br />
            <h4>Detalle de Items</h4>
            <br />
        </div>
        <div class="row">
            <div id="carouselExample" class="carousel slide col-7">
                <div class="carousel-inner">
                    <%
                        foreach (Domain.Image item in list)
                        {
                    %>
                    <div class="carousel-item<%: (item == list[0]) ? " active" : "" %>">
                        <img src="<%: item.Url %>" class="img-fluid rounded border" style="object-fit: cover; height: 400px" alt="...">
                    </div>
                    <%  }
                    %>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <div class="card col-5">
                <div class="card-header fs-2" style="font-family: 'Anton'"><%: NameItem%> </div>
                <div class="card-body">
                    <div class="row">
                        <h4 class="card-title"><%: CategoryItem%> - <%: BrandItem%></h4>
                    </div>
                    <div class="row">
                        <h4 class="accordion-button"><%: DescriptionItem%></h4>
                    </div>
                    <div class="row">
                        <h4 class="accordion-button"><%: PriceItem%></h4>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row p-0 mx-0 my-1 justify-content-center" role="group">
                        <div class="hstack col-5 p-0 m-0" visible="false" id="itemAmount" runat="server" >
                            <asp:Button ID="btnRemove" Text="-" CssClass="btn btn-danger" runat="server" OnClick="AlterTotalItem"  />
                            <asp:Label ID="lblTotalItem"  CssClass="form-control" runat="server" />
                            <asp:Button ID="btnAdd" Text="+" CssClass="btn btn-success" runat="server" OnClick="AlterTotalItem" />
                        </div>
                        <asp:Button ID="btnAddCart" Text="Añadir" CssClass="btn btn-primary col-5" runat="server" OnClick="AlterTotalItem"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
