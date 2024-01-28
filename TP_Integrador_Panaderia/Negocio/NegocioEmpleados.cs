using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;

namespace Negocio
{
    public class NegocioEmpleados
    {
        DatosEmpleado de = new DatosEmpleado();
        public bool AgregarEmpleado(string DNI, string Cuit, string Nombre, string Apellido, string Telefono, string Direccion, string Email, string Contraseña)
        {
            int cantFilas = 0;

            Empleado emp = new Empleado(); //seteo todo lo que ingresó el usuario a una variable de tipo Empleado
            emp.Dni_Empleado_ = DNI;
            emp.Cuit_Empleado_ = Cuit;
            emp.NombreyApellido_Empleado_ = Nombre + ' ' + Apellido;
            emp.Telefono_Empleado_ = Telefono;
            emp.Direccion_Empleado_ = Direccion;
            emp.Email_Empleado_ = Email;
            emp.Contraseña_Empleado_ = Contraseña;

            if (de.existeEmpleadoDNI(emp) == false) //Primero consulto que no exista ningún empleado con este DNI ya registrado
            {
                if (de.existeEmpleadoEmail(emp.Email_Empleado_) == false) //Si no existe con este DNI, consulto que tampoco exista ninguno con este Email
                {
                    cantFilas = de.agregarEmpleado(emp); //Una vez se valido todo, agrego el empleado
                }
            }

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public String TipoError(string DNI, string Email) //Este método es para que el mensaje de error en el registro sea mas descriptivo
        {
            string MensajeError="";
            Empleado emp = new Empleado();
            emp.Dni_Empleado_ = DNI;
            emp.Email_Empleado_ = Email;

            if (de.existeEmpleadoDNI(emp))
            {
                MensajeError = "Error al registrar el empleado, ya existe un empleado con este DNI";
            }
            
            if (de.existeEmpleadoEmail(emp.Email_Empleado_))
            {
                MensajeError = "Error al registrar el empleado, ya existe uno con este Email";
            }

            if (de.existeEmpleadoDNI(emp) == true && de.existeEmpleadoEmail(emp.Email_Empleado_) == true)
            {
                MensajeError = "Error al registrar el empleado, ya existe un empleado con este DNI y este Email";
            }

            return MensajeError;
        }

        public Empleado LoginEmpleado(string Email, string Contraseña)
        {
           Empleado emp = de.EmpleadoLogin(Email, Contraseña); //Le asigno a un empleado lo devuelto por el método EmpleadoLogin

           return emp;
            
        }
    }
}
