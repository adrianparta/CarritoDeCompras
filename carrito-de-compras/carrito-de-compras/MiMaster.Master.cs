using Business;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace carrito_de_compras
{
    public partial class MiMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["CartItems"] is null))
            {
                spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();
            }
            if (Session["ListItem"] is null)
            {
                Session.Add("ListItem", ItemBusiness.List());
            }
            List<Item> listItem = (List<Item>)Session["ListItem"];
            repeaterDetailsItems.DataSource = listItem;
            repeaterDetailsItems.DataBind();
        }
    }
}