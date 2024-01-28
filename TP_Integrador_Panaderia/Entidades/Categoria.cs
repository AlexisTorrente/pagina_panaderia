using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int Id_Categoria;
        private string Nombre_Categoria;
        private string Descripcion_Categoria;
        private bool Estado_Categoria;

        public Categoria()
        {
        }

        public int Id_Categoria_ { get => Id_Categoria; set => Id_Categoria = value; }
        public string Nombre_Categoria_ { get => Nombre_Categoria; set => Nombre_Categoria = value; }
        public string Descripcion_Categoria_ { get => Descripcion_Categoria; set => Descripcion_Categoria = value; }
        public bool Estado_Categoria_ { get => Estado_Categoria; set => Estado_Categoria = value; }
    }

}
