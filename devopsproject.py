from flask import Flask
from test_staging_devopsproject import test_alea_bool
app = Flask(__name__)

@app.route("/")
def hello():
	return "<h1 style='color:blue'>Hello There!rdsqfdgyhujikosffgbfvcdfryt</h1>"

@app.route("/test")
def test():
	if test_alea_bool() == 0:
		return "<h1 style='color:blue'>TEST REUSSI !</h1>"
	else:
		return "<h1 style='color:blue'>TEST NUL !</h1>"

if __name__ == "__main__":
	app.run(host='0.0.0.0')
