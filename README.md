# Configurar Neovim en Windows 11

## Guía completa

### Instalación de Winget

Instalar en Microsoft Store buscando como "Instalador de aplicaciones"

### Instalador de Python 3

La instalación de python es requerida para el funcionamiento de el plugin *UtilSnips*
es completamente opcional, pero de no quererlo solo se debe de remover la línea
`Plug 'SirVer/ultisnips'`, sin embargo es probable que sea requerido para otros plugin

Consultar la última versión de Python:

```powershell
winget search python
```

La respuesta a la busqueda dependerá sobre lo que se va instalar, se recomienda
la última versión disponible que no esté en Beta, por ejemplo, supongamos que
entre las respuesta se encuentre la siguiente versión:

> Python 3.12 Python.Python.3.12 3.12.4 Command: python winget

```powershell
winget install Python.Python.3.12
```

Winget instalará Python y agregará el directorio de la aplicación al Path de las
variables de entorno del sistema de windows 11, para corroborar que se ha Instalado
ejecuta lo siguiente:

```powershell
python --version
```

Una vez comprobado que sí está instalado se requiere instalar el proveedor de Neovim

```powershell
pip install pynvim
```

### Instalación de Neovim

Instalar con Winget

```powershell
winget install Neovim.Neovim
```
