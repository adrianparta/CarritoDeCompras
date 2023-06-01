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
    public partial class WebForm2 : System.Web.UI.Page
    {
        public List<Domain.Image> list { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"].ToString() != null ? Request.QueryString["Id"] : "";
            if (id != "")
            {
                Item selected = (ItemBusiness.List(id))[0];
                TextBoxTitle.Text = selected.Name;
                TextBoxDescription.Text = selected.Description;
                TextBoxImage.Text = selected.Images[0].Url;
                ImageUrl.ImageUrl = selected.Images[0].Url;

                list = selected.Images;
            }

        }
    }
}