using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioClientes
    {
        DatosCliente dc = new DatosCliente();

        public bool AgregarCliente(String dni, string nombreYApellido, string direccion, string telefono, string email, string contraseña)
        {
            int filasAfectadas = 0;

            Cliente cli = new Cliente();
            cli.Dni_Cliente_ = dni;
            cli.NombreyApellido_Cliente_ = nombreYApellido;
            cli.Direccion_Cliente_ = direccion;
            cli.Telefono_Cliente_ = telefono;
            cli.Email_Cliente_ = email;
            cli.Contraseña_Cliente_ = contraseña;

            if (!dc.existeClienteDNI(dni) && !dc.existeClienteEmail(email))
            {
                filasAfectadas = dc.agregarCliente(cli);
            }
            
            if(filasAfectadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public String TipoError(string DNI, string Email)
        {
            string MensajeError = "";
            Cliente cli = new Cliente();

            if (dc.existeClienteDNI(DNI))
            {
                MensajeError = "Error: ya existe un cliente con este DNI.";
            }

            if (dc.existeClienteEmail(Email))
            {
                MensajeError = "Error: ya existe un cliente con este Email.";
            }

            if (dc.existeClienteDNI(DNI) && dc.existeClienteEmail(Email))
            {
                MensajeError = "Error: ya existe un cliente con este DNI y este email.";
            }

            return MensajeError;
        }

        public Cliente loginCliente(String email, String contraseña)
        {
            Cliente cli = dc.loginCliente(email, contraseña);
            return cli;
        }
    }
}
