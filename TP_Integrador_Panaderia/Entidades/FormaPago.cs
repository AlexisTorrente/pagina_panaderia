using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class FormaPago
    {
        private int id_FormaPago;
        private string descripcion_FormaPago;

        public FormaPago() 
        {
        }

        public int Id_FormaPago { get => id_FormaPago; set => id_FormaPago = value; }
        public string Descripcion_FormaPago { get => descripcion_FormaPago; set => descripcion_FormaPago = value; }
    }
}
