using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Business;
using Domain;

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
            if (!IsPostBack)
            {
                if (Session["CartItems"] is null)
                {
                    Session.Add("CartItems", new List<Item>());
                }
                if (Session["ListItem"] is null)
                {
                    Session.Add("ListItem", ItemBusiness.List());
                }
                if (Session["statusAmountItems"] is null)
                {
                    Session["statusAmountItems"] = true;
                }
                Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
                spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();
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
            //ImageUrl = ListItem[e.Item.ItemIndex].GetFirstImage();
            Label lblAmount = (Label)e.Item.FindControl("lblTotalItem");
            if (lblAmount.Text == "0")
            {
                e.Item.FindControl("itemAmount").Visible = false;
                e.Item.FindControl("btnAddCart").Visible = true;
            }
            else
            {
                e.Item.FindControl("itemAmount").Visible = true;
                e.Item.FindControl("btnAddCart").Visible = false;
            }
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

            if (!string.IsNullOrEmpty(txtName.Text))
            {
                filteredList = filteredList.Where(x => x.Name.ToLower().Contains(txtName.Text.ToLower())).ToList();
            }
            repeaterDefault.DataSource = filteredList;
            repeaterDefault.DataBind();
        }

        protected void AlterTotalItems(object sender, EventArgs e)
        {
            Button btnSender = (Button)sender;
            List<Item> itemList = (List<Item>)Session["ListItem"];
            var idItem = int.Parse(btnSender.CommandArgument);
            var indexItem = itemList.FindIndex(x => x.Id == idItem);
            List<Item> currentCart = (List<Item>)Session["CartItems"];
            Item item = itemList.Single(x => x.Id == idItem);
            int indexItemCart = currentCart.FindIndex(x => x.Id == idItem);
            string btnSenderID = btnSender.ID;
            if (btnSenderID == "btnAddCart")
            {
                currentCart.Add(item);
                itemList[indexItem].Amount++;
            }
            else if (btnSenderID == "btnAdd")
            {
                itemList[indexItem].Amount++;
            }
            else if (btnSender.ID == "btnRemove")
            {
                itemList[indexItem].Amount--;
                if (itemList[indexItem].Amount == 0)
                {
                    currentCart.RemoveAt(indexItemCart);
                }
            }
            Label lblTotalItem = (Label)btnSender.FindControl("lblTotalItem");
            lblTotalItem.Text = itemList[indexItem].Amount.ToString();

            Session.Contents["ListItem"] = itemList;
            Session.Contents["CartItems"] = currentCart;

            Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
            spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();

            UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
            updPanelShoppingCartIcon.Update();
            FilterEvent(sender, e);
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            Button btnSender = (Button)sender;
            List<Item> itemList = (List<Item>)Session["ListItem"];
            var idItem = int.Parse(btnSender.CommandArgument);
            List<Item> currentCart = (List<Item>)Session["CartItems"];
            Item item = itemList.Single(x => x.Id == idItem);
            int indexItemCart = currentCart.FindIndex(x => x.Id == idItem);

            currentCart.Add(item);
            Session.Contents["CartItems"] = currentCart;
            if (indexItemCart == -1)
            {
                if (item.Amount > 0)
                {
                    currentCart.Add(item);
                }
            }
            else
            {
                if (item.Amount == 0)
                {
                    currentCart.RemoveAt(indexItemCart);
                }
                else
                {
                    currentCart[indexItemCart].Amount = item.Amount;
                }
            }

            Session.Contents["CartItems"] = currentCart;

            Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
            spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();

            UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
            updPanelShoppingCartIcon.Update();
        }
    }
}