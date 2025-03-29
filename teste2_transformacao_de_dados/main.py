import pdfplumber
import csv
import zipfile
import os

# Obtém a tabela do pdf e retorna em uma matriz
def extract_pdf_table(pdf_path):
    with pdfplumber.open(pdf_path) as pdf:
        tables = []
        for page in pdf.pages:
            table = page.extract_table()
            if table:
                tables.append(table)
        return tables


# Salva os dados da matriz (tabela) em um arquivo .csv
def save_to_csv(tables, csv_path):
    with open(csv_path, mode="w", newline="", encoding="utf-8") as csvfile:
        writer = csv.writer(csvfile)
        for table in tables:
            writer.writerows(table)


# Função para compactar o arquivo em .zip
def create_zip_file(file, zip_filename):
    with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(file, os.path.basename(file))


def main():
    PDF_PATH = "anexo/Anexo_I.pdf"
    CSV_PATH = "tabela_estruturada.csv"
    ZIP_PATH = "Teste_Lukas_Kardeck.zip"

    tables = extract_pdf_table(PDF_PATH)
    DESCRIPTION = {
        "OD": "Seg. Odontológica",
        "AMB": "Seg. Ambulatorial"
    }
    for table in tables:
        if table:
            table[0] = [DESCRIPTION[col] if col in DESCRIPTION else col for col in table[0]]

    save_to_csv(tables, CSV_PATH)
    create_zip_file(CSV_PATH, ZIP_PATH)


if __name__ == "__main__":
    main()