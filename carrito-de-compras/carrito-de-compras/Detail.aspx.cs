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
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"].ToString() != null ? Request.QueryString["Id"] : "";
            if (id != "")
            {
                Item selected = (ItemBusiness.List(id))[0];
                TextBoxTitle.Text = selected.Name;
                TextBoxDescription.Text = selected.Description;
                TextBoxPrice.Text = selected.Price.ToString();
                TextBoxBrand.Text = selected.Brand.ToString();
                TextBoxCategory.Text = selected.Category.ToString();

                List<Item> itemList = (List<Item>)Session["ListItem"];
                var indexItem = itemList.FindIndex(x => x.Id == int.Parse(Request.QueryString["Id"]));
                lblTotalItem.Text = itemList[indexItem].Amount.ToString();

                list = selected.Images;
            }

        }

        protected void AlterTotalItem(object sender, EventArgs e)
        {
            Button btnSender = (Button)sender;
            List<Item> itemList = (List<Item>)Session["ListItem"];
            var indexItem = itemList.FindIndex(x => x.Id == int.Parse(Request.QueryString["Id"]));
            List<Item> currentCart = (List<Item>)Session["CartItems"];
            Item item = itemList.Single(x => x.Id == int.Parse(Request.QueryString["Id"]));
            int indexItemCart = currentCart.FindIndex(x => x.Id == item.Id);
            if (btnSender.ID == "btnAdd")
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
                    itemList[indexItem].Amount--;
                    lblTotalItem.Text = itemList[indexItem].Amount.ToString();
                    currentCart.RemoveAt(indexItemCart);
                    Session.Contents["CartItems"] = currentCart;
                    Label spanAmountCart = (Label)Master.FindControl("spanAmountCart");
                    spanAmountCart.Text = ((List<Item>)Session["CartItems"]).Count.ToString();

                    UpdatePanel updPanelShoppingCartIcon = (UpdatePanel)Master.FindControl("updPanelShoppingCartIcon");
                    updPanelShoppingCartIcon.Update();
                }
            }

        }
    }
}