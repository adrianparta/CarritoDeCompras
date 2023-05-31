using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using Domain;

namespace carrito_de_compras
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Item> ListItem { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem = ItemBusiness.List();

            if (!IsPostBack)
            {
                repeaterDefault.DataSource = ListItem;
                repeaterDefault.DataBind();
            }
        }

        protected void buttonDetails_Click(object sender, EventArgs e)
        {
            string aux = ((Button)sender).CommandArgument;
            Response.Redirect("Detail.aspx?Id=" + aux);
        }
    }
}