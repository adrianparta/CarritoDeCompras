<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="carrito_de_compras.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://api.fontshare.com/v2/css?f[]=anton@400&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="row">
            <div id="carouselExample" class="carousel slide col-7">
                <div class="carousel-inner">
                    <%
                        foreach (Domain.Image item in list)
                        {
                    %>
                    <div class="carousel-item<%: (item == list[0]) ? " active" : "" %>">
                        <img src="<%: item.Url %>" class="d-block w-100 rounded border" style="object-fit: cover; height: 400px" alt="...">
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

            <div class="col-3">
                <asp:TextBox runat="server" CssClass="fs-1" ID="TextBoxTitle" Style="font-family: 'Anton" />
                <asp:TextBox runat="server" ID="TextBoxPrice" />
                <asp:TextBox runat="server" ID="TextBoxDescription" />
                <asp:TextBox runat="server" ID="TextBoxBrand" />
                <asp:TextBox runat="server" ID="TextBoxCategory" />
                <asp:Button ID="btnRemove" Text="-" CssClass="btn btn-danger" runat="server" OnClick="AlterTotalItem"/>
                <asp:Label ID="lblTotalItem" CssClass="form-control" runat="server" />
                <asp:Button ID="btnAdd" Text="+" CssClass="btn btn-success" runat="server" OnClick="AlterTotalItem"/>
            </div>
            <div class="col-1"></div>

        </div>
    </div>



</asp:Content>
