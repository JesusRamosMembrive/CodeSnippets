import os
import unicodedata

def eliminar_acentos(texto):
    texto_normalizado = unicodedata.normalize('NFD', texto)
    texto_sin_acentos = ''.join(c for c in texto_normalizado if unicodedata.category(c) != 'Mn')
    return texto_sin_acentos

def renombrar_archivos_en_carpetas(ruta_base):
    for carpeta_raiz, carpetas, archivos in os.walk(ruta_base):
        for archivo in archivos:
            nombre_nuevo = eliminar_acentos(archivo)
            if nombre_nuevo != archivo:
                ruta_vieja = os.path.join(carpeta_raiz, archivo)
                ruta_nueva = os.path.join(carpeta_raiz, nombre_nuevo)
                os.rename(ruta_vieja, ruta_nueva)
                print(f'Renombrado: {ruta_vieja} -> {ruta_nueva}')

# Ejemplo de uso
ruta_base = r'C:\Users\jesus\Documents\Git\CodeSnippets\Assets\Code\CPlusPlus'  # Reemplaza esto con la ruta de tu carpeta principal
renombrar_archivos_en_carpetas(ruta_base)
