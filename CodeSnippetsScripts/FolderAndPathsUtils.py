import os


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


def list_all_files(folder_path: str) -> list:
    """List all files in the given folder."""
    files_list = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            files_list.append(os.path.join(file))
    return files_list


def ensure_folder_exists(folder_path: str) -> None:
    """Check if a folder exists, and create it if it does not."""
    try:
        print(f"Folder path: {folder_path}")
        if not os.path.exists(folder_path):
            os.makedirs(folder_path)
            print(f"Folder '{folder_path}' created.")
    except OSError as e:
        print(f"Error: {e}")
    finally:
        pass


def open_txt_file(file_path: str) -> str:
    """Open a text file and return the text."""
    with open(file_path, "r", encoding='utf-8') as f:
        return f.read()
