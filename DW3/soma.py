from flask import Flask, request, jsonify

app = Flask(__name__)

historico = []
contador_id = 0  # ID único para cada operação

@app.route("/historico", methods=["GET"])
def mostrar_historico():
    return jsonify({"historico": historico})

@app.route("/historico/<int:operacao_id>", methods=["DELETE"])
def deletar_item_historico(operacao_id):
    global historico
    novo_historico = [item for item in historico if item["id"] != operacao_id]

    if len(novo_historico) == len(historico):
        return jsonify({"erro": "ID inválido."}), 400

    historico = novo_historico
    return jsonify({"mensagem": f"Item com ID {operacao_id} removido com sucesso."})

@app.route("/soma", methods=["POST"])
def somar():
    global contador_id

    dados_recebidos = request.get_json()
    numero1 = dados_recebidos["Numero 1:"]
    numero2 = dados_recebidos["Numero 2:"]
    
    resultado = numero1 + numero2
    operacao = {
        "id": contador_id,
        "operacao": f"{numero1} + {numero2} = {resultado}"
    }
    
    historico.append(operacao)
    contador_id += 1
    
    return jsonify({"resultado": resultado, "id": operacao["id"]})

if __name__ == "__main__":
    app.run(debug=True)
