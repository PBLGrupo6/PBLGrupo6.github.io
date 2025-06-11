<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Definición del CSS -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Resultados de Diagnóstico de Malaria</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #23272f;
                    }
                    h1 {
                        color: #a259d9;
                        text-align: center;
                        margin-top: 100px;
                        margin-bottom: 40px;
                    }
                    h2 {
                        color: #a259d9;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                    }
                    th, td {
                        border: 1px solid #444;
                        padding: 8px;
                        text-align: center;
                        color: #fff;
                    }
                    th {
                        background-color: #4CAF50;
                        color: #fff;
                    }
                    tr:nth-child(even) {
                        background-color: #2d3140;
                    }
                    tr:nth-child(odd) {
                        background-color: #23272f;
                    }
                    td:first-child {
                        width: 50%;
                        text-align: right;
                        font-weight: bold;
                        border-right: 2px solid #a259d9;
                    }
                    td:last-child {
                        width: 50%;
                        text-align: left;
                        padding-left: 20px;
                    }
                    img {
                        max-width: 200px;
                        height: auto;
                        display: block;
                        margin: 10px auto;
                        border: 1px solid #ccc;
                    }
                    .section {
                        margin-bottom: 30px;
                    }
                    .patient-id {
                        font-weight: bold;
                        color: #4CAF50;
                    }
                </style>
            </head>
            <body>
                <h1>Resultados de Diagnóstico de Malaria</h1>
                <xsl:apply-templates select="Resultados_de_los_pacientes/Paciente"/>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para cada paciente -->
    <xsl:template match="Paciente">
        <div class="section">
            <h2>Paciente <span class="patient-id"><xsl:value-of select="@id"/></span></h2>
            <table>
                <tr>
                    <th colspan="2">Datos de Identificación</th>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><xsl:value-of select="Identificacion/Nombre"/></td>
                </tr>
                <tr>
                    <td>Apellidos</td>
                    <td>
                        <xsl:value-of select="Identificacion/Apellido1"/>&#160;
                        <xsl:value-of select="Identificacion/Apellido2"/>
                    </td>
                </tr>
                <tr>
                    <td>Edad</td>
                    <td><xsl:value-of select="Identificacion/Edad"/></td>
                </tr>
                <tr>
                    <td>Género</td>
                    <td><xsl:value-of select="Identificacion/Genero"/></td>
                </tr>
                <tr>
                    <td>Tipo de sangre</td>
                    <td><xsl:value-of select="Identificacion/Bloodtype"/></td>
                </tr>
                <tr>
                    <td>Centro Sanitario</td>
                    <td><xsl:value-of select="Centro_sanitario"/></td>
                </tr>
            </table>

            <table>
                <tr>
                    <th colspan="2">Resultados del Diagnóstico</th>
                </tr>
                <tr>
                    <td>Diagnóstico</td>
                    <td><xsl:value-of select="Resultados/Diagnostico"/></td>
                </tr>
                <tr>
                    <td>Especie de Plasmodium</td>
                    <td><xsl:value-of select="Resultados/Especie_plasmodium"/></td>
                </tr>
                <tr>
                    <td>Número de Parásitos</td>
                    <td><xsl:value-of select="Resultados/numero_parasito"/></td>
                </tr>
                <tr>
                    <td>Severidad</td>
                    <td><xsl:value-of select="Resultados/Severidad"/></td>
                </tr>
            </table>

            <table>
                <tr>
                    <th colspan="2">Detalles del Procesamiento</th>
                </tr>
                <tr>
                    <td>Imagen</td>
                    <td><img src="{Procesamiento/Imagen}" alt="Muestra del paciente"/></td>
                </tr>
                <tr>
                    <td>Tipo de Muestra</td>
                    <td><xsl:value-of select="Procesamiento/Muestra"/></td>
                </tr>
                <tr>
                    <td>Tinción</td>
                    <td><xsl:value-of select="Procesamiento/Tinción"/></td>
                </tr>
                <tr>
                    <td>Fecha de Diagnóstico</td>
                    <td><xsl:value-of select="Procesamiento/Fecha_de_diagnostico"/></td>
                </tr>
                <tr>
                    <td>Modelo Utilizado</td>
                    <td><xsl:value-of select="Procesamiento/Modelo"/></td>
                </tr>
                <tr>
                    <td>Confianza</td>
                    <td><xsl:value-of select="Procesamiento/Nivel_de_Confianza"/></td>
                </tr>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>