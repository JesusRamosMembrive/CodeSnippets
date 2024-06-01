import re
import unicodedata
from dataclasses import dataclass, field


@dataclass
class TextProcessor:
    explanation: str = "<---EXPLANATION--->" + "\n"
    files: str = "<---FILES--->" + "\n"
    examples_and_code_dict: dict = field(default_factory=dict)
    extracted_text: list[str] = field(default_factory=list)
    file_map: dict = field(default_factory=dict)
    path_to_save_final_text: str = r""
    text_of_example_section: str = ""
    name_cleaned: str = ""
    title_clean: str = ""
    text_without_accents: str = ""
    text_processed: str = ""

    def __create_explanation_section(self, text: str) -> None:
        """Create the explanation section of the final text."""
        self.explanation = self.explanation + text + "\n"

    def __create_file_dict(self, text: str) -> None:
        """ Create a dictionary of examples and code blocks from the text."""
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
                self.examples_and_code_dict[line_stripped] = []
                self.examples_and_code_dict[line_stripped_result] = []
            if is_code_block:
                if line_stripped and line_stripped != "```cpp":
                    self.examples_and_code_dict[line_stripped].append(line + "\n")

    def __create_files_section(self) -> None:
        """Create the files section of the final text."""
        for key, value in self.examples_and_code_dict.items():
            self.files += key + "\n"
        if not self.files:
            self.files = "<---FILES--->" + "\n" + "No files found." + "\n"

    def __create_examples_section(self) -> None:
        """Create the examples section of the final text."""
        for key, value in self.examples_and_code_dict.items():
            self.text_of_example_section += "<---" + key + "--->" + "\n"
            for code in value:
                self.text_of_example_section += code

    def __form_final_text(self) -> None:
        """Combine the explanation, files, and examples into one final text."""
        self.text_processed = self.explanation + self.files + self.text_of_example_section

    def __save_final_text(self) -> None:
        """Save the final text to a file with the title provided."""
        with open(fr"{self.path_to_save_final_text}/{self.name_cleaned}.txt", "w", encoding='utf-8') as f:
            f.write(self.text_processed)

    def __clean_file_name(self, name: str) -> None:
        self.name_cleaned = re.sub(r'[\\/*?:"<>|]', '_', name)
        self.name_cleaned = self.name_cleaned.replace("en C++", "")
        self.name_cleaned = self.name_cleaned.replace("Algoritmos de la Biblioteca Estándar", "")
        self.name_cleaned = self.name_cleaned.replace("Algoritmo de la Biblioteca Estándar", "")
        self.name_cleaned = self.name_cleaned.replace("`", "")
        self.name_cleaned = self.name_cleaned.replace("_", "")
        self.name_cleaned = re.sub(r'\s+', ' ', self.name_cleaned).strip()
        # Remove accents
        normalized_text = unicodedata.normalize('NFD', self.name_cleaned)
        self.name_cleaned = ''.join(c for c in normalized_text if unicodedata.category(c) != 'Mn')

    def __get_file_title(self, file_text: str) -> None:
        """Get the title of the file."""
        try:
            for line in file_text.split("\n"):
                title: str = line.split("###")[1].strip()
                self.__clean_file_name(title)
                break
        except Exception as e:
            print(e)

    def __extract_text_between_users(self, content: str) -> list[str]:
        block = content.split("User")

        for internal_block in block:
            if "ChatGPT" in internal_block:
                parts = internal_block.split("ChatGPT")
                if len(parts) > 1:
                    goal_text = parts[1].strip()
                    self.extracted_text.append(goal_text)
        return self.extracted_text

    def set_path_to_save_final_text(self, path_to_save: str) -> None:
        self.path_to_save_final_text = path_to_save

    def create_a_file_algorithm(self, text_to_process: str) -> None:
        """Create a file with the explanation, files, and examples."""
        counter: int = 0

        for index, text_extracted in enumerate(self.__extract_text_between_users(text_to_process)):
            self.__get_file_title(text_extracted)
            self.__create_explanation_section(text_extracted)
            self.__create_file_dict(text_extracted)
            self.__create_files_section()
            self.__create_examples_section()
            self.__form_final_text()
            self.__save_final_text()
            counter += 1

    @staticmethod
    def generate_file(text_to_process: str, path_of_file: str) -> None:
        processor = TextProcessor()
        processor.set_path_to_save_final_text(path_of_file)
        processor.create_a_file_algorithm(text_to_process)


# Test zone
# if __name__ == "__main__":
# import FolderAndPathsUtils as fpu

# list_of_files = [r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\TextToProcess/Amigas.txt",
# r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\TextToProcess/Concepts.txt"]
#
#     for file in list_of_files:
#         text_to_analyze: str = fpu.open_txt_file(file)
#         path = r"D:\Personal\Qt\CodeSnippetApp\CodeSnippetsScripts\TestZone"
#         TextProcessor().generate_file(text_to_analyze, path)
