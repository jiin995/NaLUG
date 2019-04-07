from flask import Flask, render_template
import tablib
import os

app = Flask (__name__)
dataset = tablib.Dataset()
with open(os.path.join(os.path.dirname(__file__),'email.csv')) as f:
    dataset.csv = f.read()

@app.route("/table")
def index():
    return dataset.html

if __name__ == "__main__":
    app.run()
