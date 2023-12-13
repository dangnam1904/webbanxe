using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace webbanxe.Data.migrations
{
    /// <inheritdoc />
    public partial class addaccessaries : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Accessaries",
                columns: table => new
                {
                    IdAccessary = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NameAccessary = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    DescriptionAccessary = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImageAccessary = table.Column<string>(type: "nvarchar(700)", maxLength: 700, nullable: false),
                    Price = table.Column<double>(type: "float", nullable: false),
                    PricePromotion = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Accessaries", x => x.IdAccessary);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Accessaries");
        }
    }
}
