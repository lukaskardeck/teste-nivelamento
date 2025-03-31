from flask import Flask, request, jsonify
import csv

app = Flask(__name__)

# Caminho do arquivo CSV
CSV_PATH = "dados/cadastros_operadoras.csv"

def load_csv():
    # Lê o CSV e retorna uma lista de dicionários
    with open(CSV_PATH, newline="", encoding="utf-8") as csvfile:
        reader = csv.DictReader(csvfile, delimiter=";")
        return list(reader)

# Carregar os dados na memória ao iniciar o servidor
operadoras = load_csv()

@app.route('/', methods=['GET'])
def index():
    return "Acesse http://localhost:5000/operadoras para ter acesso a todas as operadoras"

@app.route('/operadoras', methods=['GET'])
def get_all_operadoras():
    # Retorna todas as operadoras
    return jsonify(operadoras)

@app.route('/operadoras/busca', methods=['GET'])
def search_operadoras():
    # Busca operadoras por Razão Social ou Nome Fantasia
    query = request.args.get("nome", "").strip().lower()
    
    if len(query) < 3:
        return jsonify({"error": "A consulta deve ter pelo menos 3 caracteres."}), 400

    # Filtrar registros que contêm a string na Razão Social ou Nome Fantasia
    resultados = [
        operadora for operadora in operadoras
        if query in (operadora["Razao_Social"] or "").lower()
        or query in (operadora["Nome_Fantasia"] or "").lower()
    ]

    return jsonify(resultados)


if __name__ == '__main__':
    app.run(port=5000, host='localhost', debug=True)
    # print(operadoras)
