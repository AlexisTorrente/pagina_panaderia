using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Empleado
    {
        private string Dni_Empleado;
        private string NombreyApellido_Empleado;
        private string Direccion_Empleado;
        private string Telefono_Empleado;
        private string Email_Empleado;
        private string Contraseña_Empleado;
        private string Cuit_Empleado;

        public Empleado()
        {
        }

        public string Dni_Empleado_ { get => Dni_Empleado; set => Dni_Empleado = value; }
        public string Direccion_Empleado_ { get => Direccion_Empleado; set => Direccion_Empleado = value; }
        public string Telefono_Empleado_ { get => Telefono_Empleado; set => Telefono_Empleado = value; }
        public string Email_Empleado_ { get => Email_Empleado; set => Email_Empleado = value; }
        public string Cuit_Empleado_ { get => Cuit_Empleado; set => Cuit_Empleado = value; }
        public string NombreyApellido_Empleado_ { get => NombreyApellido_Empleado; set => NombreyApellido_Empleado = value; }
        public string Contraseña_Empleado_ { get => Contraseña_Empleado; set => Contraseña_Empleado = value; }
    }
}
