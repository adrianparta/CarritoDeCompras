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

        public Money Total = 0;
        public bool AnyItem = false;
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
                    Total = 0;
                    foreach (var item in currentCart)
                    {
                        Total = Total.Price + (Money)item.TotalPrice;
                    }
                    LabelTotal.Text = Total.ToString();
                }
            }
            if (!(Session["CartItems"] is null))
            {
                if(((List<Item>)Session["CartItems"]).Any())
                {
                    AnyItem = true;
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

                    Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
                    spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();

                    UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
                    updPanelShoppingCartIcon.Update();

                    if (currentCart.Count == 0)
                    {
                        AnyItem = false;
                    }
                }
            }
            Session.Contents["CartItems"] = currentCart;
            repeaterCart.DataSource = currentCart;
            repeaterCart.DataBind();
            repeaterPrices.DataSource = currentCart;
            repeaterPrices.DataBind();

            Total = 0;
            foreach (var item in currentCart)
            {
                Total = Total.Price + (Money)item.TotalPrice;
            }
            LabelTotal.Text = Total.ToString();
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Session["CartItems"] = null;
            Session["ListItem"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}