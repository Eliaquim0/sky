from flask import render_template, request, redirect, url_for, flash
from flask_login import login_user, logout_user
from app import app, db, LoginManager
from app.models import Usuario, Endereco, Estado, Cidade, Bairro, EndImovel, Imovel
from app.forms import LoginForm



@app.route('/')
@app.route('/index', methods=['GET', 'POST'])
def index():
    return render_template('index.html')


@app.route('/cadastro', methods=['GET', 'POST'])
def cadastro():
    if request.method =='POST':
        nome = request.form['Fullname']
        cpf = request.form['cpf']
        tel = request.form['number']
        email = request.form['email']
        senha = request.form['password']
        cep = request.form['cep']
        estado = request.form['uf']
        cidade = request.form['cidade']
        bairro = request.form['bairro']
        logradouro = request.form['endereco']
        numero = request.form['numero']
        complemento = request.form['complemento']

        usuario = Usuario(nome, cpf, tel, email, senha)
        endereco = Endereco(logradouro, numero, cep, complemento)
        estado = Estado(estado)
        cidade = Cidade(cidade)
        bairro = Bairro(bairro)
        db.session.add(usuario)
        db.session.add(endereco)
        db.session.add(estado)
        db.session.add(cidade)
        db.session.add(bairro)
        db.session.commit()
        if db.session.commit:True
        flash("Cadastro realizado com sucesso.")
        return redirect(url_for('login'))
    
    return render_template('cadastro.html')


@app.route('/Imovel', methods=['GET'])
def imovel():
    return render_template('Imovel.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        usuario = Usuario.query.filter_by(email=form.email.data).first()
        if usuario and usuario.senha == form.password.data:         
            login_user(usuario)
            return redirect(url_for('index'))
        else:
            flash("Login invalido.")
    return render_template('login.html', form=form)


@app.route('/pesquisa', methods=['GET'])
def pesquisa():
    return render_template('pesquisa.html')

@app.route('/logout')
def logout():
    logout_user()
    flash("Desconectado.")
    return redirect(url_for('login'))


@app.route('/cadastroimoveis', methods=['GET', 'POST'])
def cadastroimoveis():
    if request.method =='POST':
        logradouro = request.form['endereco']
        numero = request.form['numero']
        cep = request.form['cep']
        uf = request.form['uf']
        cidade = request.form['cidade']
        bairro = request.form['bairro']
        complemento = request.form['complemento']
        tipoimovel = request.form['tipoimovel']
        valorimovel = request.form['valorimovel']
        quantquarto = request.form['quantidadequartos']
        quantgaragem = request.form['quantidadegaragem']
        quantisuite = request.form['quantidadesuites']
        quantobanheiro = request.form['quantidadebanheiros']
        garagemcoberta = request.form['descgaragem']
        areaservico = request.form['areadeserv']
        piscina = request.form['piscina']
        internet = request.form['internet']
        mobiliado = request.form['mobiliado']
        pet = request.form['pet']
        descricao = request.form['description']

        enderecoimoveis = EndImovel(logradouro, numero, cep, uf, cidade, bairro, complemento)

        imovel = Imovel(tipoimovel, valorimovel, quantquarto, quantgaragem, quantisuite, quantobanheiro, garagemcoberta, areaservico, piscina, internet, mobiliado, pet, descricao)
        db.session.add(enderecoimoveis)
        db.session.add(imovel)
        db.session.commit()
        if db.session.commit:True
        flash("Cadastro realizado com sucesso.")

    return render_template('cadastroimoveis.html')
