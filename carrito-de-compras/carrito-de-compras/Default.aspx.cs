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
        public List<Brand> BrandList { get; set; }
        public List<Category> CategoryList { get; set; }
        public string ImageUrl { get; set; }
        public string noImageUrl = "this.onerror=null; this.src='Content/NoImagePlaceHolder.svg';";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Session.Add("ListItem", ItemBusiness.List());
                ListItem = (List<Item>)Session["ListItem"];
                repeaterDefault.DataSource = ListItem;
                repeaterDefault.DataBind();
                BrandList = new List<Brand>
                {
                    new Brand { Id = -1, Description = "Todos" }
                };
                CategoryList = new List<Category>
                {
                    new Category { Id = -1, Description = "Todos" }
                };
                BrandList.AddRange(BrandBusiness.List());
                CategoryList.AddRange(CategoryBusiness.List());
                ddlBrand.DataSource = BrandList;
                ddlBrand.DataTextField = "Description";
                ddlBrand.DataValueField = "Id";
                ddlBrand.DataBind();
                ddlCategory.DataSource = CategoryList;
                ddlCategory.DataTextField = "Description";
                ddlCategory.DataValueField = "Id";
                ddlCategory.DataBind();
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

        protected void FilterEvent(object sender, EventArgs e)
        {
            List<Item> filteredList = (List<Item>)Session["ListItem"];

            var categoryFilter = int.Parse(ddlCategory.SelectedItem.Value);
            var brandFilter = int.Parse(ddlBrand.SelectedItem.Value);

            if (categoryFilter > 0)
            {
                filteredList = filteredList.Where(x => categoryFilter == x.Category.Id).ToList();
            }
            
            if (brandFilter > 0)
            {
                filteredList = filteredList.Where(x => brandFilter == x.Brand.Id).ToList();
            }
            
            if (string.IsNullOrEmpty(txtName.Text))
            {
                filteredList = filteredList.Where(x => x.Name.ToLower().Contains(txtName.Text.ToLower())).ToList();
            }

            repeaterDefault.DataSource = filteredList;
            repeaterDefault.DataBind();
        }
    }
}