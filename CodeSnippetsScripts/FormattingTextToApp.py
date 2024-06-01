import os
import re
import unicodedata


def create_explanation_section(text: str) -> str:
    """Create the explanation section of the final text."""
    explanation_header: str = "<---EXPLANATION--->" + "\n"
    return explanation_header + text + "\n"


def create_file_dict(text: str) -> dict:
    """
    Create a dictionary of examples and code blocks from the text.
    """
    examples_and_code_dict: dict = {}
    line_stripped: str = ""
    is_code_block: bool = False
    for line in text.split("\n"):
        if line.startswith("```"):
            is_code_block = False
        if line.startswith("```cpp") or line.startswith("```h"):
            is_code_block = True
        if line.startswith("#####"):
            line_stripped = line.strip("#####")[1:]
            line_stripped_result = line_stripped + " Result"
            examples_and_code_dict[line_stripped] = []
            examples_and_code_dict[line_stripped_result] = []
        if is_code_block:
            if line_stripped and line_stripped != "```cpp":
                examples_and_code_dict[line_stripped].append(line + "\n")
    return examples_and_code_dict


def create_files_section(file_map: dict) -> str:
    """Create the files section of the final text."""
    files_header: str = "<---FILES--->" + "\n"
    for key, value in file_map.items():
        files_header += key + "\n"

    if not files_header:
        files_header = "<---FILES--->" + "\n" + "NA" + "\n"

    return files_header


def create_examples_section(file_map: dict) -> str:
    """Create the examples section of the final text."""
    text_of_example_section: str = ""
    for key, value in file_map.items():
        text_of_example_section += "<---" + key + "--->" + "\n"
        for code in value:
            text_of_example_section += code
    return text_of_example_section


def form_final_text(explanation: str, files: str, examples: str) -> str:
    """Combine the explanation, files, and examples into one final text."""
    return explanation + files + examples


def save_final_text(final_text: str, title: str) -> None:
    """Save the final text to a file with the title provided."""
    # title = title.replace(" ", "_")
    with open(fr"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\Code/{title}.txt", "w",
              encoding='utf-8') as f:
        f.write(final_text)


def open_txt_file(file_path: str) -> str:
    """Open a text file and return the text."""
    with open(file_path, "r", encoding='utf-8') as f:
        return f.read()


def limpiar_nombre_archivo(nombre):
    # Reemplaza caracteres no permitidos con un guion bajo
    nombre_limpio = re.sub(r'[\\/*?:"<>|]', '_', nombre)
    # Aplica los reemplazos adicionales y asigna el resultado a nombre_limpio
    nombre_limpio = nombre_limpio.replace("en C++", "")
    nombre_limpio = nombre_limpio.replace("Algoritmos de la Biblioteca Estándar", "")
    nombre_limpio = nombre_limpio.replace("Algoritmo de la Biblioteca Estándar", "")
    nombre_limpio = nombre_limpio.replace("`", "")
    nombre_limpio = nombre_limpio.replace("_", "")
    # Elimina espacios en blanco redundantes
    nombre_limpio = re.sub(r'\s+', ' ', nombre_limpio).strip()
    return nombre_limpio


def get_file_title(file_text: str) -> str:
    """Get the title of the file."""
    try:
        for line in file_text.split("\n"):
            title: str = line.split("###")[1].strip()
            title_clean = limpiar_nombre_archivo(title)
            title_clean = eliminar_acentos(title_clean)
            return title_clean
    except Exception as e:
        print(e)
        return "Untitled"


def create_a_file(text_to_analyze: str) -> None:
    """Create a file with the explanation, files, and examples."""
    file_title: str = get_file_title(text_to_analyze)
    explanation_section: str = create_explanation_section(text_to_analyze)
    dict_of_examples: dict = create_file_dict(text_to_analyze)
    files_section: str = create_files_section(dict_of_examples)
    example_section: str = create_examples_section(dict_of_examples)
    final_text: str = form_final_text(explanation_section, files_section, example_section)
    save_final_text(final_text, file_title)


def extraer_texto_entre_users(contenido: str) -> list[str]:
    bloques = contenido.split("User")
    textos_extraidos = []

    for bloque in bloques:
        if "ChatGPT" in bloque:
            partes = bloque.split("ChatGPT")
            if len(partes) > 1:
                texto_interesante = partes[1].strip()
                textos_extraidos.append(texto_interesante)
    return textos_extraidos


def eliminar_acentos(texto):
    # Normaliza la cadena para separar los caracteres base de los diacríticos
    texto_normalizado = unicodedata.normalize('NFD', texto)
    # Filtra los caracteres no diacríticos y vuelve a formar la cadena
    texto_sin_acentos = ''.join(c for c in texto_normalizado if unicodedata.category(c) != 'Mn')
    return texto_sin_acentos


def create_QML_file(topics: dict) -> None:
    for key in topics:
        listElement_lines = ""
        palabras = re.split(r'[\s_-]+', key)
        key_camelCase = ''.join(p.capitalize() for p in palabras)
        # key_camelCase = key_camelCase.replace(" ", "_")
        camel_case = key_camelCase[0].lower() + key_camelCase[1:]
        property_line = f"property ListModel {camel_case}Type: ListModel" + "{" + "\n"
        for element in topics[key]:
            name_filter = element.replace(".txt", "")
            # name_filter = name_filter.replace(" ", "_")
            listElement_lines += 'ListElement{ name: "' + f"{name_filter}" + '"}' + "\n"
            print(f"Element: {element}")
        final_text = "import QtQuick" + "\n"
        final_text = final_text + "Item{" + "\n" + property_line + "\n" + listElement_lines + "}" + "\n" + "}"
        with open(fr"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\QMLFiles/{key_camelCase}.qml", "w",
                  encoding='utf-8') as f:
            f.write(final_text)


def listar_carpetas(ruta):
    carpetas: list = []
    for entrada in os.listdir(ruta):
        ruta_completa = os.path.join(ruta, entrada)
        if os.path.isdir(ruta_completa):
            carpetas.append(entrada)
    print(f"Carpetas: {carpetas}")
    return carpetas


def listar_archivos_en_carpetas(ruta_base, carpetas):
    archivos_por_carpeta: dict = {}
    for carpeta in carpetas:
        ruta_carpeta = os.path.join(ruta_base, carpeta)
        archivos = [archivo for archivo in os.listdir(ruta_carpeta) if
                    os.path.isfile(os.path.join(ruta_carpeta, archivo))]
        archivos_por_carpeta[carpeta] = archivos
    print(f"Archivos por carpeta: {archivos_por_carpeta}")
    return archivos_por_carpeta


def main():
    text_to_analyze: str = open_txt_file("textToTransform.txt")

    extraer_texto_entre_users(text_to_analyze)
    counter: int = 0
    for index, text in enumerate(extraer_texto_entre_users(text_to_analyze)):
        print(f"Text {index}")
        create_a_file(text)
        counter += index
    folders = listar_carpetas(r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\Code")
    dict_of_topics = listar_archivos_en_carpetas(
        r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\Code", folders)
    create_QML_file(dict_of_topics)


if __name__ == "__main__":
    main()
