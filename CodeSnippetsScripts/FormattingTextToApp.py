import os
import re
import unicodedata
from ProcessText import TextProcessor
import FolderAndPathsUtils as fpu


def main():
    text_to_analyze: str = fpu.open_txt_file(r"C:\Users\jesus\Documents\Git\CodeSnippets\CodeSnippetsScripts\TextToProcess/Amigas.txt")
    path = r"C:\Users\jesus\Documents\Git\CodeSnippets\CodeSnippetsScripts\TestZone"
    TextProcessor().generate_file(text_to_analyze, path)

    # files = list_all_files(r"C:\Users\jesus\Documents\Git\CodeSnippets\CodeSnippetsScripts\TextToProcess")
    #
    # for file in files:
    #     file = file.split(".txt")[0]
    #
    #     print(f"File: {file}")
    #     ensure_folder_exists(rf"C:\Users\jesus\Documents\Git\CodeSnippets\CodeSnippetsScripts\Code\{file}")

    #
    # extraer_texto_entre_users(text_to_analyze)
    # counter: int = 0
    # for index, text in enumerate(extraer_texto_entre_users(text_to_analyze)):
    #     print(f"Text {index}")
    #     create_a_file(text)
    #     counter += index
    # folders = listar_carpetas(r"C:\Users\jesus\Documents\Git\CodeSnippets\CodeSnippetsScripts\Code")
    # dict_of_topics = listar_archivos_en_carpetas(
    #     r"C:\Users\jesus\Documents\Git\CodeSnippets\CodeSnippetsScripts\Code", folders)
    # create_QML_file(dict_of_topics)


if __name__ == "__main__":
    main()
