using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace carrito_de_compras
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        public string noImageUrl = "this.onerror=null; this.src='Content/NoImagePlaceHolder.svg';";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (!(Session["CartItems"] is null))
                {
                    List<Item> currentCart = (List<Item>)Session["CartItems"];
                    repeaterCart.DataSource = currentCart;
                    repeaterCart.DataBind();
                    repeaterPrices.DataSource = currentCart;
                    repeaterPrices.DataBind(); 
                }
            }

        }
        protected void AlterTotalItems(object sender, EventArgs e)
        {
            Button btnSender = (Button)sender;
            List<Item> currentCart = (List<Item>)Session["CartItems"];
            var idItem = int.Parse(btnSender.CommandArgument);
            var indexItem = currentCart.FindIndex(x => x.Id == idItem);
            if (btnSender.ID == "btnAdd")
            {
                currentCart[indexItem].Amount++;
            }
            else
            {
                if (currentCart[indexItem].Amount > 0)
                {
                    currentCart[indexItem].Amount--;
                }
                if (currentCart[indexItem].Amount == 0)
                {
                    currentCart.RemoveAt(indexItem);
                }
            }
            Session.Contents["ListItem"] = currentCart;
            repeaterCart.DataSource = currentCart;
            repeaterCart.DataBind();
            repeaterPrices.DataSource = currentCart;
            repeaterPrices.DataBind();
        }
    }
}