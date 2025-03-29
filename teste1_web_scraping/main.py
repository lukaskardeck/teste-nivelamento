import os
import requests
import zipfile
from bs4 import BeautifulSoup

# Faz a requisição e retorna o conteúdo em HTML da página
def get_page_content(url, headers):
    response = requests.get(url, headers)
    if not response.ok:
        print(f"Erro ao acessar a página. Código: {response.status_code}")
        return
    soup = BeautifulSoup(response.text, "html.parser")
    return soup


# Realiza a busca pelos links de download dos PDFs na página
def extract_pdf_links(page, keywords):
    links = page.find_all("a", href=True)
    pdf_links = [
        link["href"]
        for link in links
        if any(text in link.get_text() for text in keywords) and link["href"].endswith(".pdf")
    ]
    return pdf_links


# Faz o download dos PDFs e salva em um diretório
def download_pdfs(pdf_links, download_dir):
    if not os.path.exists(download_dir):
        os.makedirs(download_dir)

    downloaded_files = []

    for i, pdf_url in enumerate(pdf_links, start=1):        
        # Nome do arquivo para salvar
        pdf_filename = os.path.join(download_dir, f"Anexo_{i}.pdf")

        # Faz o download do PDF
        response = requests.get(pdf_url)
        if not response.ok:
            print(f"Erro ao baixar o arquivo {pdf_url}. Status: {response.status_code}")
            return
        
        with open(pdf_filename, "wb") as file:
            file.write(response.content)

        downloaded_files.append(pdf_filename)
        print(f"{pdf_filename} baixado com sucesso!")
    
    return downloaded_files


# Função para compactar os arquivos em um arquivo .zip
def create_zip_file(files, zip_filename):
    with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for file in files:
            zipf.write(file, os.path.basename(file))  # Mantém os arquivos dentro da pasta compactada com o mesmo nome original
    print(f"{zip_filename} gerado com sucesso!")


def main():
    URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
    HEADERS = {'User-agent': 'Mozilla/5.0'}
    DOWNLOAD_DIR = "anexos"

    page = get_page_content(URL, HEADERS)

    KEYWORDS = ["Anexo I", "Anexo II"]

    pdf_links = extract_pdf_links(page, KEYWORDS)

    downloaded_files = download_pdfs(pdf_links, DOWNLOAD_DIR)
    
    if downloaded_files:
        create_zip_file(downloaded_files, "anexos.zip")


if __name__ == "__main__":
    main()