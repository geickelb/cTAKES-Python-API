from datetime import datetime


def get_timestamp():
    return datetime.now().strftime(("%Y-%m-%d %H:%M:%S"))

FILES = {
    "1": {
        "id": "1",
        "title": "clinical_ax.txt",
        "author": "Dr. John Doe",
        "client_name": "Foo Bar",
        "timestamp": get_timestamp()
    },
    "2": {
        "id": "2",
        "title": "clinical_review.txt",
        "author": "Dr. Scooby Doo",
        "client_name": "Foo Bar",
        "timestamp": get_timestamp()
    },
    "3": {
        "id": "3",
        "title": "clinical_note.txt",
        "author": "Dr. Donald Duck",
        "client_name": "Foo Bar",
        "timestamp": get_timestamp()
    }
}

def read():

    # Create the list of people from our data
    return [FILES[key] for key in sorted(FILES.keys())]
