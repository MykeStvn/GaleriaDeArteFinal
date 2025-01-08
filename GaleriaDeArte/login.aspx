<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GaleriaDeArte.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }

        .login-box {
            background: #fff;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        .login-title {
            font-weight: bold;
            color: #2575fc;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }

        .btn-primary {
            background-color: #2575fc;
            border: none;
        }

        .btn-primary:hover {
            background-color: #1d63d6;
        }

        .form-label {
            font-weight: 600;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #2575fc;
            box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
        }

        .error-message {
            font-size: 0.9rem;
            color: red;
            margin-top: 0.5rem;
            text-align: center;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">        
        <div class="login-box">
            <div class="login-title">Inicia Sesión</div>
            <div class="mb-3">
                <asp:Label ID="LabelEmail" runat="server" Text="Correo Electrónico:" CssClass="form-label" />
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" Placeholder="Ingresa tu correo electrónico" />
            </div>
            <div class="mb-3">
                <asp:Label ID="LabelPassword" runat="server" Text="Contraseña:" CssClass="form-label" />
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Ingresa tu contraseña" />
            </div>
            <div class="d-grid">
                <asp:Button ID="ButtonLogin" runat="server" Text="Iniciar sesión" CssClass="btn btn-primary" OnClick="ButtonLogin_Click" />
            </div>
            <asp:Label ID="LabelError" runat="server" CssClass="error-message" Visible="false" Text="Credenciales inválidas" />
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
