create table leitores(
	id serial primary key,
	nome varchar(100)not null,
	email varchar (200) unique not null,
	cpf varchar (11) unique not null,
	telefone varchar (100) not null,
	data_cadastro timestamp DEFAULT current_timestamp
);
create table categorias(
	id serial primary key,
	nome varchar (100) CHECK (nome in ('Ficção','História','Tecnologia'))
);
create table livros (
	id serial primary key,
	categoria_id int references categorias(id),
	titulo varchar (100) not null,
	isdn varchar (100) unique not null,
	taxa_diaria decimal (10,2) not null check (taxa_diaria>0),
	disponivel boolean default true
);
create table emprestimos(
	id serial primary key,
	leitores_id int references leitores(id),
	data_emprestimo timestamp default current_timestamp,
	status varchar (100) default 'Ativo' CHECK (status in ('Ativo','Devolvido','Atrasado'))
);
create table itens_emprestimo(
	id serial primary key,
	emprestimos_id int references emprestimos(id),
	livros_id int references livros(id),
	quantidade int not null check (quantidade>0),
	valor_diario decimal (10,2) not null check (valor_diario>0)
);
INSERT INTO categorias (nome) VALUES 
('Ficção'),
('História'),
('Tecnologia');

INSERT INTO leitores (nome, email, cpf, telefone) VALUES 
('Ana Silva', 'ana.silva@email.com', '12345678901', '11987654321'),
('Carlos Eduardo', 'carlos.eduardo@email.com', '98765432100', '21976543210'),
('Mariana Santos', 'mariana.santos@email.com', '45678912345', '31965432109');

INSERT INTO livros (categoria_id, titulo, isdn, taxa_diaria, disponivel) VALUES 
(1, 'O Senhor dos Anéis', '9788533613379', 5.50, true),
(1, '1984', '9788535914849', 4.00, true),
(2, 'Sapiens: Uma Breve História da Humanidade', '9788535925807', 6.00, true),
(3, 'Código Limpo', '9788576082675', 7.50, false);

INSERT INTO emprestimos (leitores_id, status) VALUES 
(1, 'Ativo'),
(2, 'Devolvido'),
(3, 'Atrasado'),
(3, 'Atrasado');

INSERT INTO itens_emprestimo (emprestimos_id, livros_id, quantidade, valor_diario) VALUES 
(1, 1, 1, 5.50),
(1, 2, 1, 4.00),
(2, 3, 1, 6.00),
(3, 4, 1, 7.50);

