import pyodbc

def get_connection():
    conn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=test;'
        'Trusted_Connection=yes;'
    )
    return conn

def add_event(title, description, start_date, end_date):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO Events (Title, Description, StartDate, EndDate)
        VALUES (?, ?, ?, ?)
    ''', (title, description, start_date, end_date))
    conn.commit()
    conn.close()

def get_events():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT Id, Title, Description, StartDate, EndDate FROM Events')
    events = cursor.fetchall()
    conn.close()
    return events
