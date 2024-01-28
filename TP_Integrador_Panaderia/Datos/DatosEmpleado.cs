using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;


namespace Datos
{
    public class DatosEmpleado
    {
        AccesoDatos ad = new AccesoDatos();

        public Boolean existeEmpleadoDNI(Empleado emp) //Consulto si ya existe un empleado con este DNI
        {
            String consulta = "Select * from tblEmpleados where DNI=" + emp.Dni_Empleado_;
            return ad.existe(consulta);
        }

        public Boolean existeEmpleadoEmail(string Email) //Consulto si ya existe un empleado con este Email
        {
            String consulta = "Select * from tblEmpleados where Email= '" + Email +"'";
            return ad.existe(consulta);
        }
        
        public Empleado EmpleadoLogin(string Email, string Contraseña)
        {
            //Consulto si existe un empleado con el Email y contraseña que recibo
            String consulta = "Select * from tblEmpleados where Email= '" + Email + "' and Contraseña= '"+ Contraseña +"'"; 
            SqlDataReader dr= ad.ObtenerReader(consulta);
            Empleado emp=null;

            while (dr.Read()) //Leo el reader con la consulta cargada, le asigno todo lo que leyó a una variable de tipo empleado y la devuelvo
            {
                emp = new Empleado();
                emp.Contraseña_Empleado_ = dr["Contraseña"].ToString();
                emp.Email_Empleado_= dr["Email"].ToString();
                emp.Dni_Empleado_ = dr["DNI"].ToString();
                emp.NombreyApellido_Empleado_ = dr["nombreYapellido"].ToString();
                emp.Direccion_Empleado_ = dr["Direccion"].ToString();
                emp.Telefono_Empleado_= dr["Telefono"].ToString();
                emp.Cuit_Empleado_= dr["Cuit"].ToString();

            }

            return emp;

        }

        private void ArmarParametrosEmpleadoAgregar(ref SqlCommand Comando, Empleado emp) //Armo todos los parámetros para el procedimiento AgregarEmpleado
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.VarChar);
            SqlParametros.Value = emp.Dni_Empleado_;
            SqlParametros = Comando.Parameters.Add("@CUIT", SqlDbType.VarChar);
            SqlParametros.Value = emp.Cuit_Empleado_;
            SqlParametros = Comando.Parameters.Add("@NOMBREYAPELLIDO", SqlDbType.VarChar);
            SqlParametros.Value = emp.NombreyApellido_Empleado_;
            SqlParametros = Comando.Parameters.Add("@TELEFONO", SqlDbType.VarChar);
            SqlParametros.Value = emp.Telefono_Empleado_;
            SqlParametros = Comando.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            SqlParametros.Value = emp.Direccion_Empleado_;
            SqlParametros = Comando.Parameters.Add("@EMAIL", SqlDbType.VarChar);
            SqlParametros.Value = emp.Email_Empleado_;
            SqlParametros = Comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar);
            SqlParametros.Value = emp.Contraseña_Empleado_;
            SqlParametros = Comando.Parameters.Add("@FECHAINGRESO", SqlDbType.DateTime);
            SqlParametros.Value = DateTime.Now;

        }

        public int agregarEmpleado(Empleado emp) //Ejecuto el procedimiento almacenado AgregarEmpleado
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosEmpleadoAgregar(ref comando, emp);
            return ad.EjecutarProcedimientoAlmacenado(comando, "spAgregarEmpleado");
        }

    }
}
