<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="carrito_de_compras.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater runat="server" ID="repeaterDefault">
        <ItemTemplate>
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <asp:Image ImageUrl="https://static.wikia.nocookie.net/espokemon/images/4/43/Bulbasaur.png/revision/latest/scale-to-width-down/350?cb=20170120032346" runat="server" />
                    <img src="<%#((string)((List<Domain.Image>)Eval("Images"))[0].Url)%>" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("Name")%></h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
