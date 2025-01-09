<%@ Page Title="" Language="C#" MasterPageFile="~/Usuarios.Master" AutoEventWireup="true" CodeBehind="MostrarExposiciones.aspx.cs" Inherits="GaleriaDeArte.MostrarExposiciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">EXPOSICIONES DISPONIBLES</h1>
    <asp:GridView ID="GridViewExposiciones" runat="server" AutoGenerateColumns="false">
        <Columns>            
            <asp:BoundField DataField="DescripcionExposicion" HeaderText="Exposición" />
            <asp:BoundField DataField="FechaInicio" HeaderText="Fecha de Inicio" />
            <asp:BoundField DataField="FechaFin" HeaderText="Fecha de Fin" />
            <asp:TemplateField HeaderText="Obras Expuestas">
                <ItemTemplate>
                    <asp:Repeater ID="RepeaterObras" runat="server" DataSource='<%# Eval("Obras") %>'>
                        <ItemTemplate>
                            <div>
                                <strong>ID Obra:</strong> <%# Eval("Id") %><br />
                                <strong>Título Obra:</strong> <%# Eval("Titulo") %><br />
                                <strong>Descripción Obra:</strong> <%# Eval("Descripcion") %><br />
                                <strong>Precio Obra:</strong> <%# Eval("Precio") %><br />
                                <strong>Nombre Artista:</strong> <%# Eval("NombreArtista") %><br />
                                <hr />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
