import os
import urllib.request
import csv
import json
import pandas as pd
import sys, getopt, pprint
from pymongo import MongoClient
from flask import Flask, flash, request, redirect, render_template
from werkzeug.utils import secure_filename
app = Flask(__name__)


UPLOAD_FOLDER = 'documentos/'
app.secret_key = "secret key"
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


ALLOWED_EXTENSIONS = set(['txt','csv'])

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
    
@app.route('/')
def upload_form():
    return render_template('upload.html')

@app.route('/', methods=['POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            flash('No file selected for uploading')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            print("file uploaded")
            path_csv = app.config['UPLOAD_FOLDER'] + filename
            flash('File successfully uploaded')
            csvfile = open(path_csv, 'r')
            reader = csv.DictReader( csvfile )
            header= ['id', 'age']
            for each in reader:
                row={}
                row['class'] = '1' 
                for field in header:
                    row[field]=each[field]
                print(row)
            os.remove(path_csv)
            print("file removed")
            return redirect('/')
        else:
            flash('Allowed file types are txt, csv')
            return redirect(request.url)

if __name__ == '__main__':
    app.run(debug=True)