<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearObra.aspx.cs" Inherits="GaleriaDeArte.CrearObra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Ingresar Nueva Obra"></asp:Label>
    <div class="card">
    <div class="card-header">
        <h2>Crear Nueva Obra</h2>
    </div>
    <div class="card-body">
        <div class="form-group">
            <asp:Label ID="lblTitulo" runat="server" Text="Título de la Obra:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtTitulo" runat="server" placeholder="Ej: Obra de Arte BARROCO " CssClass="form-control"></asp:TextBox>
            
        </div>
        <div class="form-group">
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion Obra:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" runat="server" placeholder="Ej: Esta obra fue desarrollada en la epoca de la colonia y es una obra muy valorada en el mundo...." CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPrecio" runat="server" Text="Precio:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPrecio" runat="server" placeholder="Ingrese el precio" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>        
        <div class="form-group">
            <asp:Label ID="lblFechaCreacion" runat="server" Text="Fecha de Creación:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFechaCreacion" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>            
        </div>
        <div class="form-group">
            <asp:Label ID="lblFoto" runat="server" Text="Foto de la Obra:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFoto" runat="server" placeholder="Ingrese la URL de la foto de la obra" CssClass="form-control"></asp:TextBox>
        </div>         
        <div class="form-group">
            <asp:Label ID="lblAutor" runat="server" Text="Seleccione el autor de la obra:" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlAutor" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:ListItem Text="Seleccione un autor" Value="" />
        </div>                      
        <asp:Button ID="btnCrear" runat="server" Text="Crear" CssClass="btn btn-primary" OnClick="btnCrear_Click" />
    </div>
</div>
</asp:Content>
