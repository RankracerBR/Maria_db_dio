from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
import time

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///comments.db'
db = SQLAlchemy(app)

class Comment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    text = db.Column(db.String(200), nullable=False)

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/secao_comentario', methods=['GET', 'POST'])
def comentarios():
    if request.method == 'POST':
        name = request.form['name']
        comment_text = request.form['comment']
        
        new_comment = Comment(name=name, text=comment_text)  # Correção aqui
        
        db.session.add(new_comment)
        db.session.commit()
        
        return redirect('/secao_comentario')
    else:
        comments = Comment.query.all()
        return render_template('secao_comentario.html', comments=comments)




@app.errorhandler(404)
def page_not_found(error):
    return redirect(url_for('index'))


if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)

