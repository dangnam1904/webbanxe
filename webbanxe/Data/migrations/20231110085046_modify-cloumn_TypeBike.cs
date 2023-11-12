using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace webbanxe.Data.migrations
{
    /// <inheritdoc />
    public partial class modifycloumn_TypeBike : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "NameBike",
                table: "TypeBike",
                newName: "NameType");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "NameType",
                table: "TypeBike",
                newName: "NameBike");
        }
    }
}
