BEGIN;

CREATE TABLE IF NOT EXISTS public.pessoas
(
    pessoa_id bigserial NOT NULL,
    nome character varying(255),
    endereco character varying(255),
    profissao boolean,
    data_nascimento date,
    email character varying(255),
    CONSTRAINT pk_pessoas PRIMARY KEY (pessoa_id)
);

CREATE TABLE IF NOT EXISTS public.departamentos
(
    departamento_id bigserial,
    nome character varying NOT NULL,
    CONSTRAINT pk_depatamentos PRIMARY KEY (departamento_id)
);

CREATE TABLE IF NOT EXISTS public.cursos
(
    curso_id bigserial,
    nome character varying(255),
    duracao character varying(255),
    CONSTRAINT pk_cursos PRIMARY KEY (curso_id)
);

CREATE TABLE IF NOT EXISTS public.turmas
(
    turma_id bigserial,
    curso_id bigint,
    nome character varying(255),
    CONSTRAINT pk_turmas PRIMARY KEY (turma_id),
    CONSTRAINT fk_turmas_curso_id foreign key (curso_id) references cursos (curso_id)
);

CREATE TABLE IF NOT EXISTS public.modulos
(
    modulo_id bigserial,
    nome character varying,
    categoria character varying,
    CONSTRAINT pk_modulos PRIMARY KEY (modulo_id)
);

CREATE TABLE IF NOT EXISTS public.habilidades
(
    habilidade_id bigserial,
    nome character varying,
    descricao character varying,
    CONSTRAINT pk_habilidades PRIMARY KEY (habilidade_id)
);

CREATE TABLE IF NOT EXISTS public.facilitadores
(
    facilitador_id bigserial NOT NULL,
    pessoa_id bigint,
    departamento_id bigint,
    matricula character varying NOT NULL,
    CONSTRAINT pk_facilitadores PRIMARY KEY (facilitador_id),
    CONSTRAINT fk_facilitadores_pessoa_id FOREIGN KEY (pessoa_id) REFERENCES pessoas (pessoa_id),
    CONSTRAINT fk_facilitadores_departamento_id FOREIGN KEY (departamento_id) REFERENCES departamentos (departamento_id)
);

CREATE TABLE IF NOT EXISTS public.alunos
(
    aluno_id bigserial,
    pessoa_id bigint,
    turma_id bigint,
    matricula CHARACTER varying NOT NULL,
    CONSTRAINT pk_alunos PRIMARY KEY (aluno_id),
    CONSTRAINT fk_alunos_pessoa_id FOREIGN KEY (pessoa_id) REFERENCES pessoas (pessoa_id),
    CONSTRAINT fk_alunos_turma_id FOREIGN KEY (turma_id) REFERENCES turmas (turma_id)
);

CREATE TABLE IF NOT EXISTS public.modulos_turmas
(
    turma_id bigint,
    modulo_id bigint,
    facilitador_id bigint,
    inicio date,
    termino date,
    CONSTRAINT pk_modulos_turmas PRIMARY KEY (turma_id, modulo_id),
    CONSTRAINT fk_modulos_turmas_modulo_id foreign key (modulo_id) references modulos (modulo_id),
    CONSTRAINT fk_modulos_turmas_facilitador_id foreign key (facilitador_id) references facilitadores (facilitador_id),
    CONSTRAINT fk_modulos_turmas_turma_id foreign key (turma_id) references turmas (turma_id)
);

CREATE TABLE IF NOT EXISTS public.modulos_cursos
(
    curso_id bigint,
    modulo_id bigint,
    CONSTRAINT pk_modulos_cursos PRIMARY KEY (curso_id, modulo_id),
    CONSTRAINT fk_modulos_cursos_curso_id foreign key (curso_id) references cursos (curso_id),
    CONSTRAINT fk_modulos_cursos_modulo_id foreign key (modulo_id) references modulos (modulo_id)
);



CREATE TABLE IF NOT EXISTS public.modulos_habilidades
(
    modulo_id bigint,
    habilidade_id bigint,
    CONSTRAINT pk_modulos_habilidades PRIMARY KEY (modulo_id, habilidade_id),
    CONSTRAINT fk_facilitadores_pessoa_id foreign key (modulo_id) references modulos (modulo_id)
);

INSERT INTO pessoas (pessoa_id, nome, endereco, data_nascimento, email)
VALUES
(1, 'Benedito Isaac Lucca Assun????o', '2?? Travessa Jos?? Paulo da Silva. N?? 500. Calumbi. Feira de Santana - BA', '1982-01-16', 'beneditoisaacluccaassuncao_@consultorialk.com.br'),
(2, 'Beatriz Renata Freitas', 'Avenida Presidente Marechal Humberto de Alencar Castelo Branco. N??213. Comercial. Santana, AP.', '1986-01-09','beatrizrenatafreitas@formigueiromaquinas.com.br'),
(3, 'Manuela Heloisa Silva', 'Quadra 04. N??827. Jib??ia Branca. Ananindeua - PA', '1999-01-16', 'manuelaheloisasilva@nonesiglio.com.br'),
(4, 'Raul Jo??o Erick Fernandes', 'Quadra QNM 15 M??dulo D. N?? 561. Ceil??ndia Sul. Bras??lia - DF', '1992-05-01','rauljoaoerickfernandes@eletroaquila.net'),
(5, 'Gael Benjamin Alexandre Nascimento', 'Rua Princesa Izabel. N?? 300. Jot??o. JI - RO', '1994-01-14','gaelbenjaminalexandrenascimento@bplan.com.br'),
(6, 'S??nia Teresinha Sebastiana', 'Pra??a D. N?? 847. Conjunto Cachoeira Dourada. Goi??nia - GO', '1986-01-15','teresinhasebastianarezende_@spamgourmet.com'),
(7, 'Leandro Diego Pires', 'Rua 40. N??202. Parque Residencial Nova Fronteira. Gurupi - TO', '1982-01-05', 'leandrodiegopires_@raninho.com.br'),
(8, 'Marina Ros??ngela Francisca Ferreira', 'Rua GV 1. N??54. Residencial Goi??nia Viva. Goi??nia - GO', '1982-09-25', 'marinarosangelafranciscaferreira@eccofibra.com.br'),
(9, 'Luiz Gabriel da Rocha', 'Rua Motorista Severino Fernandes de Assis. N??74. Paratibe. Jo??o Pessoa - PB', '1989-04-23','luizgabrieldarocha-85@oi15.com.br'),
(10, 'Felipe Bryan Calebe Viana', 'Rua Arterial. N??18. Cidade Nova. Ananindeua - PA', '1988-01-26', 'felipebryancalebeviana-71@lukin4.com.br'),
(11, 'Leandro F??bio Dias', 'Rua Vitor Airosa. N?? 75. Luz. S??o Paulo - SP', '2000-11-20', 'leandrofabiodias_@efetivaseguros.com.br'),
(12, 'Leandro Levi Igor Melo', 'Rua Sete. N??7. Porto Dantas. Aracaju - SE', '1968-01-12', 'leandroleviigormelo-98@facilitycom.com.br'),
(13, 'Marli Luna Barros', 'Rua Expedicion??rio Manuel Chagas. N?? 8. Ita??na. S??o Gon??alo - RJ', '1982-12-12', 'lilunabarros@agenziamarketing.com.br'),
(14, 'Vinicius Eduardo Fernandes', 'Rua S??o Silvestre. N?? 1. Batista Campos. Bel??m - PA', '1985-11-13', 'iuseduardofernandes@sorocaba.com'),
(15, 'Anthony M??rcio Francisco Martins', 'Travessa Macap??. N?? 9. ??guas Belas. S??o Jos?? dos Pinhais - PR', '1977-09-01', 'anthonymarciofranciscomartins@vhbadvogados.com.br'),
(16, 'Sebastiana L??via Moura', 'Alameda C. N?? 9. Jardim Industri??rio I. Cuiab?? - MT', '1980-01-08', 'sebastianaliviamoura@dddrin.com.br'),
(17, 'Igor Jorge Almada', 'Rua Paralela 1. N??12. Loteamento Santa Helena. Rio Branco - AC', '1996-12-30', 'igorjorgealmada_@inbox.com'),
(18, 'Fl??via Raquel Maya Caldeira', 'Rua Regina Lopes. N??19. Ininga. Teresina - PI', '1997-06-27', 'flaviaraquelmayacaldeira@uol.com.bt'),
(19, 'Stella Ayla Tereza Assun????o', 'Vila Miracema. N?? 85. Jurunas. Bel??m - PA', '1992-02-13', 'stellaaylaterezaassuncao@jammer.com.br'),
(20, 'Caleb Yago Alves', 'Rua 6. N?? 85. Arian??polis. Caucaia - CE', '1979-05-05', 'calebyagoalves-87@aliancacadeiras.com.br');

INSERT INTO cursos (curso_id, nome, duracao)
VALUES
(1, 'Desenvolvimento Web', 6),
(2, 'Data Analytics', 6);

INSERT INTO departamentos (departamento_id, nome)
VALUES
(1, 'Facilita????o'),
(2, 'Comunidade'),
(3, 'Empregabilidade'),
(4, 'Sucesso do Estudante'),
(5, 'Monitoria');

INSERT INTO facilitadores (facilitador_id, pessoa_id, departamento_id, matricula)
VALUES
(1, 1, 1, 100),
(2, 5, 1, 104),
(3, 10, 1, 109),
(4, 15, 1, 115),
(5, 20, 1, 120);

INSERT INTO turmas (turma_id, curso_id, nome)
VALUES
(1, 1,'T1 - Fundadora'),
(2, 1,'T2 - Not Found'),
(3, 2,'T3 - Pit??o');

INSERT INTO alunos (aluno_id, pessoa_id, turma_id, matricula)
VALUES
(1, 1, 1, 100),
(2, 2, 1, 101), 
(3, 3, 1, 102), 
(4, 5, 1, 104), 
(5, 6, 1, 105), 
(6, 15, 1, 114),
(7, 4, 2, 103),
(8, 7, 2, 106),
(9, 8, 2, 107),
(10, 9, 2, 108),
(11, 16, 2, 115),
(12, 19, 2, 118),
(13, 11, 3, 109),
(14, 12, 3, 111),
(15, 13, 3, 112),
(16, 14, 3, 113),
(17, 17, 3, 116),
(18, 18, 3, 117);

INSERT INTO habilidades (habilidade_id, nome, descricao)
VALUES
(1, 'HTML5/CSS3', 'Deve ser capaz de fazer p??ginas est??ticas usando HTML5 e CSS3'),
(2, 'Algoritmos', 'Deve ser capaz de desenvolver algoritmos'),
(3, 'Introdu????o a Javascript', 'Solucionar problemas utilizando Javascript'),
(4, 'Ferramentas de Desenvolvimento', 'Saber utilizar ferramentas de desenvolvimento para escrever os c??digos'),
(5, 'Versionamento de c??digo', 'Saber versionar e compartilhar c??digo com Git e Github'),

(6, 'Mindset de crescimento', 'Desenvolver habitos de sucesso'),
(7, 'Aprender a aprender', 'Desenvolver compet??ncias comportamentais'),
(8, 'H??bitos', 'Saber criar novos h??bitos saud??veis para o seu desenvolvimento pessoal'),
(9, 'Gest??o de rotina', 'Organizar tempo e utilizar ferramentas de foco'),
(10, 'Resolu????o de problemas', 'Deve saber aplicar t??cnicas para resolver problemas cotidianos e em equipes'),   

(11, 'JavaScript - ES6', 'Deve compreender comandos b??sico da utiliza????o da linguagem JavaScript'),
(12, 'JavaScript Orientado a Objetos', 'Deve compreender Orienta????o a Objeto aplicado a linguagem de JavaScript'),
(13, 'Utiliza????o de API???s REST e Microsservi??os com HTTPs', 'Deve compreender a utiliza????o de APIs e REST e Microsservi??os com HTTPs'),
(14, 'Manipula????o de Arquivos', 'Organiza????o de arquivos para utiliza????o em sites'),
(15, 'Modularidade de c??digos e fun????es', 'Deve conseguir organizar o c??digo em m??dulos e fun????es'),
(16, 'Tipos de Dados', 'Organiza????o de entrada e sa??da de dados'),
(17, 'Bootstrap', 'Deve saber utilizar o framework web com c??digo-fonte aberto para desenvolvimento de componentes de interface e front-end para sites e aplica????es web usando HTML, CSS e JavaScript'),
(18, 'Padr??o MVC', 'Deve conhecer padr??o de arquitetura de software respons??vel por contribuir na otimiza????o da velocidade entre as requisi????es feitas pelo comando dos usu??rios.'),
(19, 'JSON', 'Deve compreender a utiliza????o do sistema de trocas de informa????o JavaScript Object Notation'),     

(20, 'Introdu????o a programa????o', 'Deve compreender e aplicar l??gica de programa????o'),
(21, 'Algoritmo e pensamento computacional', 'Compreender o que ?? o Algoritmo e a utiliza????o dentro da l??gica do 
pensamento computacional'),
(22, 'Introdu????o a Python', 'Deve compreender o que s??o strings e tipos de dados'),
(23, 'Entrada e sa??da de dados', 'Deve saber inserir e conferir dados em Python'),
(24, 'L??gica de Programa????o', 'Deve saber utilizar l??gica de programa????o por meio de Python'),
(25, 'Versionamento de c??digo', 'Deve saber utilizar ferramentas de versionamento como Git e aplica????o em GitHub'),

(26, 'Fun????es, procedimentos e m??todos', 'Deve conseguir otimizar as habilidades de python desenvolvidas no M??dulo 1.'),
(27, 'Bibliotecas', 'Deve ter no????o das possibilidades de utiliza????o de bibliotecas em Python.'),
(28, 'Ambientes virtuais', 'Deve ser capaz de criar Ambientes virtuais em Python.'),

(29, 'Intelig??ncia Emocional', 'Deve compreender princ??pios de intelig??ncia emocional para identificar sentimentos e resolver situ????es cotidianas.'),
(30, 'Gest??o de Conflitos', 'Deve compreender t??cnicas de Gest??o de conflitos para trabalhar em equipe'),
(31, 'Relacionamento interpessoal', 'Deve saber utilizar t??cnicas apreendidas em Intelig??ncia Emocional, Gest??o de Conflitos e Comunica????o N??o Violenta para situa????es cotidianas.'),
(32, 'Trabalho em Equipe', 'Deve saber utilizar t??cnicas aprendidadas durante o curso para viabilizar situa????es em equipe.'),
(33, 'Comunica????o', 'Deve saber utilizar t??cnicas de comunica????o assertivas.');

INSERT INTO modulos (modulo_id, nome, categoria)
VALUES

(1, 'Introdu????o a Desenvolvimento Front-end', 'Tech'),
(2, 'Cria????o de h??bitos de sucesso', 'Soft'), 
(3, 'Orienta????o a objetos e utiliza????o de aplica????es HTTP', 'Tech'),
(4, 'Introdu????o a Programa????o com Python', 'Tech'),
(5, 'Estrutura de Dados com Python', 'Tech'),
(6, 'Intelig??ncia Emocional', 'Soft');


INSERT INTO modulos_cursos (curso_id, modulo_id)
VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 6),
(2, 2),
(2, 4),
(2, 5),
(2, 6);


INSERT INTO modulos_habilidades (modulo_id, habilidade_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25),
(5, 26),
(5, 27),
(5, 28),
(6, 29),
(6, 30),
(6, 31),
(6, 32),
(6, 33);

INSERT INTO modulos_turmas (turma_id, modulo_id, facilitador_id, inicio, termino)
VALUES
(1, 1, 5, '2020-01-10', '2020-02-10'),
(1, 2, 3, '2020-01-10', '2020-02-10'),

(1, 3, 5, '2020-02-10', '2020-03-10'),
(1, 6, 3, '2020-02-10', '2020-03-10'),

(2, 1, 2, '2020-08-10', '2021-09-10'),
(2, 2, 1, '2020-08-10', '2021-09-10'),

(2, 3, 2, '2020-09-10', '2021-10-10'),
(2, 6, 1, '2020-09-10', '2021-10-10'),

(3, 4, 4, '2021-01-10', '2021-02-10'),
(3, 2, 5, '2021-01-10', '2021-02-10'),

(3, 5, 4, '2021-02-10', '2021-03-10'),
(3, 6, 5, '2021-02-10', '2021-03-10');

END;