using ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace controladores
{
    public class Autenticacion
    {
        //linea de conecsion para vase de datos //
        string ConnectionString = "Data Source = (local); Initial Catalog = trabajo_nacional; Integrated Security = True";
        
        public bool AutentificasionDeUsuario(string Usuario,string Contrasena)
        {
            string query = "SELECT COUNT(*) FROM UsuarioSet WHERE CorreoElectronico = @Usuario AND Contraseña = @Contrasena";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    //hacemos un parse de los datos
                    command.Parameters.AddWithValue("@Usuario", Usuario);
                    command.Parameters.AddWithValue("@Contrasena", Contrasena);

                    //abrimos conexion a la base de datos
                    connection.Open();

                    int count = (int)command.ExecuteScalar();

                    //devolvemos un dato boolean para validar si es un usuario legitimo
                    return count > 0;
                }
            }
        }

    }
}
