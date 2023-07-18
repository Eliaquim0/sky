from app import db, login_manager
from werkzeug.security import check_password_hash
from flask_login import UserMixin
from werkzeug.utils import secure_filename
import os
import urllib.request



class Usuario(db.Model, UserMixin):
    __tablename__ = 'usuario'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(45))
    cpf = db.Column(db.String(11))
    tel = db.Column(db.String(11))
    email = db.Column(db.String(45))
    senha = db.Column(db.String(45))
    endereco_id = db.Column(db.Integer, db.ForeignKey('endereco.id'))
    endereco = db.relationship('Endereco', backref=db.backref('usuario', lazy=True))
    imoveis = db.relationship('Imovel', backref='usuario', lazy=True)
    

    def __init__(self, nome, cpf, tel, email, senha,):
        self.nome = nome
        self.cpf = cpf
        self.tel = tel
        self.email = email
        self.senha = senha
        
class Endereco(db.Model, UserMixin):
    __tablename__ = 'endereco'
    id = db.Column(db.Integer, primary_key=True)
    logradouro = db.Column(db.String(45))
    numero = db.Column(db.Integer)
    cep = db.Column(db.String(9))
    complemento = db.Column(db.Text)
    cidade_id = db.Column(db.Integer, db.ForeignKey('cidade.id'))
    cidade = db.relationship('Cidade', backref=db.backref('endereco', lazy=True))
    bairro_id = db.Column(db.Integer, db.ForeignKey('bairro.id'))
    bairro = db.relationship('Bairro', backref=db.backref('endereco', lazy=True))
    estado_id = db.Column(db.Integer, db.ForeignKey('estado.id'))
    estado = db.relationship('Estado', backref=db.backref('endereco', lazy=True))
    
    
    

    def __init__(self, logradouro, numero, cep, complemento):
        self.logradouro = logradouro
        self.numero = numero
        self.cep = cep
        self.complemento = complemento

class Estado(db.Model, UserMixin):
    __tablename__ = 'estado'
    id = db.Column(db.Integer, primary_key=True)
    estado = db.Column(db.String(100))
   

    def __init__(self, estado):
        self.estado = estado


class Cidade(db.Model, UserMixin):
    __tablename__ = 'cidade'
    id = db.Column(db.Integer, primary_key=True)
    cidade = db.Column(db.String(100))

    def __init__(self, cidade):
        self.cidade = cidade


class Bairro(db.Model, UserMixin):
    __tablename__ = 'bairro'
    id = db.Column(db.Integer, primary_key=True)
    bairro = db.Column(db.String(100))

    def __init__(self, bairro):
        self.bairro = bairro


class EndImovel(db.Model, UserMixin):
    __tablename__ = 'enderecoimoveis'
    id = db.Column(db.Integer, primary_key=True) 
    logradouro = db.Column(db.String(45))
    numero = db.Column(db.Integer)
    cep = db.Column(db.String(9))
    uf = db.Column(db.String(2))
    cidade = db.Column(db.String(45))
    bairro = db.Column(db.String(45))
    complemento = db.Column(db.String(100))


    def __init__(self, logradouro, numero, cep, uf, cidade, bairro, complemento):
        self.logradouro = logradouro
        self.numero = numero
        self.cep = cep
        self.uf = uf
        self.cidade = cidade
        self.bairro = bairro
        self.complemento = complemento

class Imovel(db.Model, UserMixin):
    __tablename__ = 'imovel'
    id = db.Column(db.Integer, primary_key=True)
    tipoimovel = db.Column(db.String(45))
    valorimovel = db.Column(db.String(45))
    quantquarto = db.Column(db.String(45))
    quantgaragem = db.Column(db.String(45))
    quantisuite = db.Column(db.String(45))
    quantobanheiro = db.Column(db.String(45))
    garagemcoberta = db.Column(db.String(45))
    areaservico = db.Column(db.String(45))
    piscina = db.Column(db.String(45))
    internet = db.Column(db.String(45))
    mobiliado = db.Column(db.String(45))
    pet = db.Column(db.String(45))
    descricao = db.Column(db.String(100))
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuario.id'))
    enderecoim_id = db.Column(db.Integer, db.ForeignKey('enderecoimoveis.id'))
    enderecoim = db.relationship('EndImovel', backref=db.backref('imovel', lazy=True))
    imagem_id = db.Column(db.Integer, db.ForeignKey('imagem.id'))
    imagem = db.relationship('Imagem', backref=db.backref('imovel', lazy=True))
    
  

    def __init__(self, tipoimovel, valorimovel, quantquarto, quantgaragem, quantisuite, quantobanheiro, garagemcoberta, areaservico, piscina, internet, mobiliado, pet, descricao,usuario_id):
        
        self.tipoimovel = tipoimovel
        self.valorimovel = valorimovel
        self.quantquarto = quantquarto
        self.quantgaragem = quantgaragem
        self.quantisuite = quantisuite
        self.quantobanheiro = quantobanheiro
        self.garagemcoberta = garagemcoberta
        self.areaservico = areaservico
        self.piscina = piscina
        self.internet = internet
        self.mobiliado = mobiliado
        self.pet = pet
        self.descricao = descricao
        self.usuario_id = usuario_id


class Imagem(db.Model, UserMixin):
    __tablename__ = 'imagem'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(255))
    imgimovel = db.Column(db.LargeBinary)

    def __init__(self, nome, imgimovel):
        self.nome = nome
        self.imgimovel = imgimovel

