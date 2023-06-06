using Business;
using Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace carrito_de_compras
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public List<Domain.Image> list { get; set; }
        public string IdItem;
        public string NameItem;
        public string DescriptionItem;
        public string PriceItem;
        public string BrandItem;
        public string CategoryItem;
        public string TotalPriceItem;

        protected void Page_Load(object sender, EventArgs e)
        {
            IdItem = Request.QueryString["Id"] ?? "";

            if (Session["CartItems"] is null)
            {
                Session.Add("CartItems", new List<Item>());
            }
            if (Session["ListItem"] is null)
            {
                Session.Add("ListItem", ItemBusiness.List());
            }
            if (!string.IsNullOrEmpty(IdItem))
            {
                List<Item> itemList = (List<Item>)Session["ListItem"];
                Item selected = (ItemBusiness.List(IdItem))[0];
                var indexItem = itemList.FindIndex(x => x.Id == int.Parse(IdItem));
                NameItem = selected.Name;
                DescriptionItem = selected.Description;
                PriceItem = "Precio Unitario: " + selected.Price.ToString();
                BrandItem = selected.Brand.ToString(); 
                CategoryItem = selected.Category.ToString();
                lblTotalItem.Text = itemList[indexItem].Amount.ToString();
               
                if (lblTotalItem.Text == "0")
                {
                    itemAmount.Visible = false;
                    btnAddCart.Visible = true;
                }
                else
                {
                    itemAmount.Visible = true;
                    btnAddCart.Visible = false;
                }             

                list = selected.Images;
            }
            else
            {
                Response.Redirect("Detail.aspx?Id=1");
            }         
        }

        protected void AlterTotalItem(object sender, EventArgs e)
        {
            Button btnSender = (Button)sender;
            List<Item> itemList = (List<Item>)Session["ListItem"];
            var indexItem = itemList.FindIndex(x => x.Id == int.Parse(IdItem));
            List<Item> currentCart = (List<Item>)Session["CartItems"];
            Item item = itemList.Single(x => x.Id == int.Parse(IdItem));
            if (btnSender.ID == "btnAddCart")
            {
                currentCart.Add(item);
                itemList[indexItem].Amount++;
                lblTotalItem.Text = itemList[indexItem].Amount.ToString();
                Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
                spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();

                UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
                updPanelShoppingCartIcon.Update();
            }
            else if (btnSender.ID == "btnAdd")
            {
                if (!currentCart.Contains(item))
                {
                    currentCart.Add(item);

                    Session.Contents["CartItems"] = currentCart;
                    Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
                    spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();

                    UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
                    updPanelShoppingCartIcon.Update();
                }

                itemList[indexItem].Amount++;
                lblTotalItem.Text = itemList[indexItem].Amount.ToString();
            }
            else
            {
                if (itemList[indexItem].Amount > 1)
                {
                    itemList[indexItem].Amount--;
                    lblTotalItem.Text = itemList[indexItem].Amount.ToString();
                }
                else
                {
                    int indexItemCart = currentCart.FindIndex(x => x.Id == item.Id);
                    itemList[indexItem].Amount = 0;
                    lblTotalItem.Text = itemList[indexItem].Amount.ToString();
                    if (currentCart.Contains(item))
                    {
                        currentCart.RemoveAt(indexItemCart);
                    }
                    Session.Contents["CartItems"] = currentCart;
                    Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
                    spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();
                    UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
                    updPanelShoppingCartIcon.Update();
                }
            }
            if (lblTotalItem.Text == "0")
            {
                itemAmount.Visible = false;
                btnAddCart.Visible = true;
            }
            else
            {
                itemAmount.Visible = true;
                btnAddCart.Visible = false;
            }
        }
    }
}