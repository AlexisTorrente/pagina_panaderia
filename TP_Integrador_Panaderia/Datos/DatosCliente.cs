using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DatosCliente
    {
        AccesoDatos ad = new AccesoDatos();

        public int agregarCliente(Cliente cli)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosClienteAgregar(ref comando, cli);
            return ad.EjecutarProcedimientoAlmacenado(comando, "spAgregarCliente");
        }

        public bool existeClienteDNI(String dni)
        {
            String consulta = "SELECT * from tblClientes WHERE dni='" + dni + "'";
            return ad.existe(consulta);
        }

        public bool existeClienteEmail(string email)
        {
            String consulta = "SELECT * from tblClientes WHERE email='" + email + "'";
            return ad.existe(consulta);
        }
        
        public Cliente loginCliente(string email, string contraseña)
        {
            String consulta = "SELECT * FROM tblClientes WHERE email='" + email + "' and contraseña = '" + contraseña + "'";
            SqlDataReader dr = ad.ObtenerReader(consulta);
            Cliente cli = null;

            while (dr.Read())
            {
                cli = new Cliente();
                cli.Dni_Cliente_ = dr["dni"].ToString();
                cli.NombreyApellido_Cliente_ = dr["nombreYApellido"].ToString();
                cli.Direccion_Cliente_ = dr["direccion"].ToString();
                cli.Telefono_Cliente_ = dr["telefono"].ToString();
                cli.Email_Cliente_ = dr["email"].ToString();
                cli.Contraseña_Cliente_ = dr["contraseña"].ToString();
            }

            return cli;

        }

        private void ArmarParametrosClienteAgregar(ref SqlCommand Comando, Cliente cli)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@dni", SqlDbType.VarChar);
            SqlParametros.Value = cli.Dni_Cliente_;
            SqlParametros = Comando.Parameters.Add("@nombreYApellido", SqlDbType.VarChar);
            SqlParametros.Value = cli.NombreyApellido_Cliente_;
            SqlParametros = Comando.Parameters.Add("@direccion", SqlDbType.VarChar);
            SqlParametros.Value = cli.Direccion_Cliente_;
            SqlParametros = Comando.Parameters.Add("@telefono", SqlDbType.VarChar);
            SqlParametros.Value = cli.Telefono_Cliente_;
            SqlParametros = Comando.Parameters.Add("@email", SqlDbType.VarChar);
            SqlParametros.Value = cli.Email_Cliente_;
            SqlParametros = Comando.Parameters.Add("@contraseña", SqlDbType.VarChar);
            SqlParametros.Value = cli.Contraseña_Cliente_;
        }


    }
}
