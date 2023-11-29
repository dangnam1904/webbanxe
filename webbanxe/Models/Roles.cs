using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace webbanxe.Models
{
    public class Roles
    {
        public Roles()
        {
        }

        public Roles(int idRoles)
        {
            this.IdRole  = idRoles;
        }

        public Roles(int idRoles, string rolename)
        {
            this.IdRole = idRoles;
            this.RoleName = rolename;
        }

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
      
        public int IdRole { get; set; }
        public string RoleName { get; set; }
        public virtual  List<User> Users { get; set; }

    }
}
