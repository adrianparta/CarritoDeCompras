using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using Domain;
using static System.Net.WebRequestMethods;

namespace carrito_de_compras
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Item> ListItem { get; set; }
        public string ImageUrl { get; set; }
        public string noImageUrl = "this.onerror=null; this.src='Content/NoImagePlaceHolder.svg';";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                ListItem = ItemBusiness.List();
                repeaterDefault.DataSource = ListItem;
                repeaterDefault.DataBind();
            }
        }

        protected void buttonDetails_Click(object sender, EventArgs e)
        {
            string aux = ((Button)sender).CommandArgument;
            Response.Redirect("Detail.aspx?Id=" + aux);
        }

        protected void repeaterDefault_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ImageUrl = ListItem[e.Item.ItemIndex].GetFirstImage();
        }
 
    }
}