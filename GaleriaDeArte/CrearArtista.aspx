<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearArtista.aspx.cs" Inherits="GaleriaDeArte.CrearArtista" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crear Nuevo Artista</title>
    <!-- Incluir Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-color:cornflowerblue">
    <form id="form1" runat="server" class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>Crear Nuevo Artista</h2>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <asp:Label ID="lblDni" runat="server" Text="DNI:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDni" runat="server" placeholder="Ej: 1750928127" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="cvDniUnico" runat="server" ControlToValidate="txtDni" OnServerValidate="cvDniUnico_ServerValidate" ErrorMessage="El DNI ya existe." CssClass="text-danger"></asp:CustomValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblNombres" runat="server" Text="Nombres:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNombres" runat="server" placeholder="Ej: Michael Llumiugsi" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblBiografia" runat="server" Text="Biografía:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtBiografia" TextMode="MultiLine" runat="server" placeholder="Ingrese la biografía del artista" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNacionalidad" runat="server" placeholder="Ej: Ecuatoriana" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:CustomValidator ID="cvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="La fecha de nacimiento no es válida." CssClass="text-danger"></asp:CustomValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblFoto" runat="server" Text="Foto:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtFoto" runat="server" placeholder="Ingrese la URL de la foto del artista" CssClass="form-control"></asp:TextBox>
                </div>    
                <hr/>
                <h3 style="text-align:center">Datos de Acceso al Sistema</h3>
                <div class="form-group">
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtUsuario" runat="server" placeholder="Ingrese el nombre de usuario" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Ingrese el email" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtContrasena" runat="server" placeholder="Ingrese su contraseña" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>                
                <asp:Button ID="btnCrear" runat="server" Text="Crear" OnClick="btnCrear_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CssClass="btn btn-danger" />
            </div>
        </div>
            
    </form>
    <!-- Incluir Bootstrap JS y dependencias -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

