from flask import Flask, request, jsonify
from database import add_event, get_events
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/add_event', methods=['POST'])
def add_event_route():
    data = request.json
    add_event(data['title'], data['description'], data['start_date'], data['end_date'])
    return jsonify({'success': True})

@app.route('/get_events', methods=['GET'])
def get_events_route():
    events = get_events()
    events_list = [
        {
            'Id': event[0],
            'Title': event[1],
            'Description': event[2],
            'StartDate': event[3],
            'EndDate': event[4]
        } for event in events
    ]
    return jsonify(events_list)

if __name__ == '__main__':
    app.run(debug=True)
