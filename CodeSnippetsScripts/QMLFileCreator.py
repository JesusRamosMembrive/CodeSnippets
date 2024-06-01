from dataclasses import dataclass
import re


@dataclass
class QMLFileCreator:
    @staticmethod
    def create_qml_file(topics: dict, path: str) -> None:
        for key in topics:
            list_element_lines = ""
            palabras = re.split(r'[\s_-]+', key)
            key_camel_case = ''.join(p.capitalize() for p in palabras)
            camel_case = key_camel_case[0].lower() + key_camel_case[1:]
            property_line = f"property ListModel {camel_case}Type: ListModel" + "{" + "\n"
            for element in topics[key]:
                name_filter = element.replace(".txt", "")
                list_element_lines += 'ListElement{ name: "' + f"{name_filter}" + '"}' + "\n"
                print(f"Element: {element}")
            final_text = "import QtQuick" + "\n"
            final_text = final_text + "Item{" + "\n" + property_line + "\n" + list_element_lines + "}" + "\n" + "}"
            with open(fr"{path}/{key_camel_case}.qml", "w", encoding='utf-8') as f:
                f.write(final_text)
