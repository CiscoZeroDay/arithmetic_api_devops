from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to the Arithmetic API!"})

@app.route('/add')
def add():
    a = float(request.args.get('a', 0))
    b = float(request.args.get('b', 0))
    return jsonify({"operation": "add", "result": a + b})

@app.route('/sub')
def sub():
    a = float(request.args.get('a', 0))
    b = float(request.args.get('b', 0))
    return jsonify({"operation": "subtract", "result": a - b})

@app.route('/mul')
def mul():
    a = float(request.args.get('a', 0))
    b = float(request.args.get('b', 0))
    return jsonify({"operation": "multiply", "result": a * b})

@app.route('/div')
def div():
    a = float(request.args.get('a', 0))
    b = float(request.args.get('b', 1))  # Default to 1 to avoid division by zero
    if b == 0:
        return jsonify({"error": "Division by zero is not allowed."}), 400
    return jsonify({"operation": "divide", "result": a / b})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)