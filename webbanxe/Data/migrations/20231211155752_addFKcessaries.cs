using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace webbanxe.Data.migrations
{
    /// <inheritdoc />
    public partial class addFKcessaries : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "IdAccessary",
                table: "Carts",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Carts_IdAccessary",
                table: "Carts",
                column: "IdAccessary");

            migrationBuilder.AddForeignKey(
                name: "FK_Carts_Accessaries_IdAccessary",
                table: "Carts",
                column: "IdAccessary",
                principalTable: "Accessaries",
                principalColumn: "IdAccessary",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Carts_Accessaries_IdAccessary",
                table: "Carts");

            migrationBuilder.DropIndex(
                name: "IX_Carts_IdAccessary",
                table: "Carts");

            migrationBuilder.DropColumn(
                name: "IdAccessary",
                table: "Carts");
        }
    }
}
