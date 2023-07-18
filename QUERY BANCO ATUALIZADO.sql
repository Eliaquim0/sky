CREATE TABLE cidade(
	id SERIAL PRIMARY KEY NOT NULL,
	descricao VARCHAR(100)
);


CREATE TABLE bairro(
	id SERIAL PRIMARY KEY NOT NULL,
	descricao VARCHAR(100)
);


CREATE TABLE estado(
	id SERIAL PRIMARY KEY NOT NULL,
	descricao VARCHAR(100)
);

CREATE TABLE endereco(
	id SERIAL PRIMARY KEY NOT NULL,
	logradouro VARCHAR(45),
	numero INTEGER,
	cep VARCHAR(9),
	complemento VARCHAR(100),
	cidade_id INTEGER,
	bairro_id INTEGER,
	estado_id INTEGER,
	FOREIGN KEY (cidade_id) REFERENCES cidade (id),
	FOREIGN KEY (bairro_id) REFERENCES bairro (id),
	FOREIGN KEY (estado_id) REFERENCES estado (id)
);


CREATE TABLE usuario(
	id SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR(45),
	cpf CHAR(11),
	tel CHAR(11),
	email VARCHAR(45),
	senha TEXT,
	endereco_id INTEGER,
	FOREIGN KEY (endereco_id) REFERENCES endereco (id)
);


CREATE TABLE enderecoimoveis(
	id SERIAL PRIMARY KEY NOT NULL,
	logradouro VARCHAR(45),
	numero INTEGER,
	cep VARCHAR(9),
	uf VARCHAR(45),
	cidade VARCHAR(45),
	bairro VARCHAR(45),
	complemento VARCHAR(100)
);


	CREATE TABLE imovel(
			id SERIAL PRIMARY KEY NOT NULL,
			tipoimovel VARCHAR(45),
			valorimovel VARCHAR(45),
			quantquarto VARCHAR(45),
			quantgaragem VARCHAR(45),
			garagemcoberta VARCHAR(45),
			quantisuite VARCHAR(45),
			quantobanheiro VARCHAR(45),
			areaservico VARCHAR(45),
			piscina VARCHAR(45),
			internet VARCHAR(45),
			mobiliado VARCHAR(45),
			pet VARCHAR(45),
			descricao VARCHAR(45),
			usuario_id INTEGER,
			enderecoim_id INTEGER,
			imagem_id INTEGER,
			FOREIGN KEY (usuario_id) REFERENCES usuario (id),
			FOREIGN KEY (enderecoim_id) REFERENCES enderecoimoveis (id),
			FOREIGN KEY (imagem_id) REFERENCES imagem (id)
			
);


CREATE TABLE anuncio(
	id SERIAL PRIMARY KEY NOT NULL,
	tipoanuncio VARCHAR(100),
	descricao CHAR(100),
	imovel_id INTEGER,
	FOREIGN KEY (imovel_id) REFERENCES imovel (id)
	
);


CREATE TABLE imagem (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    imgimovel BYTEA
);
	