from flask import Flask, request, render_template_string

app = Flask(__name__)

@app.route("/")
def home():
    if request.args.get('c'):
        return render_template_string(request.args.get('c'))
    else:
        return "Hai sa facem si noi ceva, zic si eu..."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8005, debug=True, threaded=True, use_evalex=False)
