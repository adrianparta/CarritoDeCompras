using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Domain
{
    public class Item
    {
        private string code;
        private string name;
        private string description;
        private Money price;

        [DisplayName("Id")]
        public int Id { get; set; }
        
        [DisplayName("Código")]
        public string Code { get; set; }
        [DisplayName("Nombre")]
        public string Name { get; set; }
        [DisplayName("Descripción")]
        public string Description { get; set; }
        [DisplayName("Marca")]
        public Brand Brand { get; set; }
        [DisplayName("Categoría")]
        public Category Category { get; set; }
        [DisplayName("Precio")]
        public Money Price { get; set; }
        public List<Image> Images { get; set; }
        [DisplayName("Cantidad")]
        public int Amount { get; set; }

        public string GetFirstImage()
        {
            string url;
            if (Images.Count() > 0)
            {
                url = Images[0].ToString();
                return url;
            }
            else
            {
                url = "Content/NoImagePlaceHolder.svg";
            }
            return url;

        }
        public Money TotalPrice { 
            get
            {
                return Price * Amount;
            }
        }
    }
}

