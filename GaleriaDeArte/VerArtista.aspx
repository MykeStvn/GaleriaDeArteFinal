<%@ Page Title="" Language="C#" MasterPageFile="~/Usuarios.Master" AutoEventWireup="true" CodeBehind="VerArtista.aspx.cs" Inherits="GaleriaDeArte.VerArtista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <div class="card">
    <div class="card-header">
        <h2>INFORMACIÓN DEL ARTISTA</h2>
    </div>
    <div class="card-body">
        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre del Artista:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblBiografía" runat="server" Text="Biografía del Artista:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtBiografía" TextMode="MultiLine" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad del Artista:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNacionalidad" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFechaNacimiento" runat="server" Enabled="false" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblFoto" runat="server" Text="Foto del Artista:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFoto" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Image ID="imgArtista" runat="server" CssClass="img-thumbnail mt-2" Width="200px" Height="200px" />
        </div>        
        <br />
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="btnRegresar" runat="server" Text="Regresar a las Obras" CssClass="btn btn-primary" OnClick="btnRegresar_Click" />
    </div>
</div>
</asp:Content>
