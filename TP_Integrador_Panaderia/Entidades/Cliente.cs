using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Cliente
    {
        private string Dni_Cliente;
        private string NombreyApellido_Cliente;
        private string Direccion_Cliente;
        private string Telefono_Cliente;
        private string Email_Cliente;
        private string Contraseña_Cliente;

        public Cliente()
        {
        }

        public string Dni_Cliente_ { get => Dni_Cliente; set => Dni_Cliente = value; }
        public string Direccion_Cliente_ { get => Direccion_Cliente; set => Direccion_Cliente = value; }
        public string Telefono_Cliente_ { get => Telefono_Cliente; set => Telefono_Cliente = value; }
        public string Email_Cliente_ { get => Email_Cliente; set => Email_Cliente = value; }
        public string NombreyApellido_Cliente_ { get => NombreyApellido_Cliente; set => NombreyApellido_Cliente = value; }
        public string Contraseña_Cliente_ { get => Contraseña_Cliente; set => Contraseña_Cliente = value; }
    }
}
