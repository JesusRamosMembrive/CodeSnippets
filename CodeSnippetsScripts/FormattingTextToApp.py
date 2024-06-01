from ProcessText import TextProcessor
from QMLFileCreator import QMLFileCreator
import FolderAndPathsUtils as fpu


def main():
    path_of_files_to_process = r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\TextToProcess"
    files = fpu.list_all_files(path_of_files_to_process)
    path_base = r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\Code"
    path_qml_files = fr"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\QMLFiles"

    # Generate the files and save them in the correct path
    for file in files:
        path_to_file = rf"{path_of_files_to_process}\{file}"
        file_strip = file.split(".txt")[0]
        path_of_text_processed = rf"{path_base}\{file_strip}"
        fpu.ensure_folder_exists(path_of_text_processed)
        TextProcessor().generate_file(fpu.open_txt_file(path_to_file), path_of_text_processed)

    # Read the files created before and generate the QML files
    folders = fpu.listar_carpetas(path_base)
    dict_of_topics = fpu.listar_archivos_en_carpetas(path_base, folders)
    QMLFileCreator.create_qml_file(dict_of_topics, path_qml_files)


if __name__ == "__main__":
    main()
