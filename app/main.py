from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/datetime', methods=['GET'])
def get_datetime():
    return {
        'date': datetime.now().strftime('%Y-%m-%d'),
        'time': datetime.now().strftime('%H:%M:%S'),
        'datetime': datetime.now().isoformat()
    }

if __name__ == '__main__':
    app.run(debug=True, port=5000, host='0.0.0.0')