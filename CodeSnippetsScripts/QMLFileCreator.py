from dataclasses import dataclass
import re

@dataclass
class QMLFileCreator:
    def create_QML_file(self, topics: dict) -> None:
        for key in topics:
            listElement_lines = ""
            palabras = re.split(r'[\s_-]+', key)
            key_camelCase = ''.join(p.capitalize() for p in palabras)
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