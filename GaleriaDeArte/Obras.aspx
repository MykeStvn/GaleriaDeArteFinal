<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Obras.aspx.cs" MasterPageFile="~/Site.Master" Inherits="GaleriaDeArte.Obras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="text-align:center">Listado de Obras</h1>
    <div class="mb-3">
        <asp:Button ID="btnCrearObra" runat="server" Text="Crear Nueva Obra" CssClass="btn btn-primary" OnClick="btnCrearObra_Click" />
    </div>
    <div class="table-responsive">
        <asp:GridView ID="gvObras" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover table-bordered" OnRowCommand="gvObras_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="Titulo" HeaderText="Título" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" />
                <asp:BoundField DataField="Precio" HeaderText="Precio ($)" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-right" />
                <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha de Creación" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                <asp:ImageField DataImageUrlField="Foto" HeaderText="Foto">
                    <ItemStyle Width="80px" Height="80px" CssClass="text-center" />
                    <ControlStyle CssClass="img-thumbnail" />
                    <HeaderStyle CssClass="text-center" />
                </asp:ImageField>
                <asp:BoundField DataField="NombreArtista" HeaderText="Nombre del Artista" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm" />
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('¿Está seguro de que desea eliminar esta obra?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

