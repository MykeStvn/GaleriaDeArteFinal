<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarObra.aspx.cs" Inherits="GaleriaDeArte.EditarObra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="card-header">
            <h2>Editar Obra</h2>
        </div>
        <div class="card-body">
            <div class="form-group">
                <asp:Label ID="lblTitulo" runat="server" Text="Título de la Obra:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción de la Obra:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPrecio" runat="server" Text="Precio:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblFechaCreacion" runat="server" Text="Fecha de Creación:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtFechaCreacion" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblFoto" runat="server" Text="Foto de la Obra:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtFoto" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Image ID="imgObra" runat="server" CssClass="img-thumbnail mt-2" Width="200px" Height="200px" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblAutor" runat="server" Text="Autor de la Obra:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlAutor" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" OnClick="btnActualizar_Click" />
        </div>
    </div>
</asp:Content>


