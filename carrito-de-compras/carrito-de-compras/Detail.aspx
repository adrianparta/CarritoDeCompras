<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="carrito_de_compras.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox runat="server" ID="TextBoxTitle" />
    <asp:TextBox runat="server" ID="TextBoxImage" />
    <asp:TextBox runat="server" ID="TextBoxDescription" />
    <asp:Image ID="ImageUrl" runat="server" />
    <div id="carouselExampleFade" style="max-width:fit-content" class="carousel slide">
        <div class="carousel-inner">
            <%
                foreach (Domain.Image item in list)
                {
            %>      <div class="carousel-item<%: (item == list[0]) ? " active" : "" %>">
                    <img src="<%: item.Url %>" style="max-width: 200px" class="d-block w-100 img-fluid" alt="...">
                    </div>
            <%  }
            %>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

</asp:Content>
