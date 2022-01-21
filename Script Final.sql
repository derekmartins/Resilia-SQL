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
(1, 'Benedito Isaac Lucca Assunção', '2ª Travessa José Paulo da Silva. Nº 500. Calumbi. Feira de Santana - BA', '1982-01-16', 'beneditoisaacluccaassuncao_@consultorialk.com.br'),
(2, 'Beatriz Renata Freitas', 'Avenida Presidente Marechal Humberto de Alencar Castelo Branco. Nº213. Comercial. Santana, AP.', '1986-01-09','beatrizrenatafreitas@formigueiromaquinas.com.br'),
(3, 'Manuela Heloisa Silva', 'Quadra 04. Nº827. Jibóia Branca. Ananindeua - PA', '1999-01-16', 'manuelaheloisasilva@nonesiglio.com.br'),
(4, 'Raul João Erick Fernandes', 'Quadra QNM 15 Módulo D. Nº 561. Ceilândia Sul. Brasília - DF', '1992-05-01','rauljoaoerickfernandes@eletroaquila.net'),
(5, 'Gael Benjamin Alexandre Nascimento', 'Rua Princesa Izabel. Nº 300. Jotão. JI - RO', '1994-01-14','gaelbenjaminalexandrenascimento@bplan.com.br'),
(6, 'Sônia Teresinha Sebastiana', 'Praça D. Nº 847. Conjunto Cachoeira Dourada. Goiânia - GO', '1986-01-15','teresinhasebastianarezende_@spamgourmet.com'),
(7, 'Leandro Diego Pires', 'Rua 40. Nº202. Parque Residencial Nova Fronteira. Gurupi - TO', '1982-01-05', 'leandrodiegopires_@raninho.com.br'),
(8, 'Marina Rosângela Francisca Ferreira', 'Rua GV 1. Nº54. Residencial Goiânia Viva. Goiânia - GO', '1982-09-25', 'marinarosangelafranciscaferreira@eccofibra.com.br'),
(9, 'Luiz Gabriel da Rocha', 'Rua Motorista Severino Fernandes de Assis. Nº74. Paratibe. João Pessoa - PB', '1989-04-23','luizgabrieldarocha-85@oi15.com.br'),
(10, 'Felipe Bryan Calebe Viana', 'Rua Arterial. Nº18. Cidade Nova. Ananindeua - PA', '1988-01-26', 'felipebryancalebeviana-71@lukin4.com.br'),
(11, 'Leandro Fábio Dias', 'Rua Vitor Airosa. Nº 75. Luz. São Paulo - SP', '2000-11-20', 'leandrofabiodias_@efetivaseguros.com.br'),
(12, 'Leandro Levi Igor Melo', 'Rua Sete. Nº7. Porto Dantas. Aracaju - SE', '1968-01-12', 'leandroleviigormelo-98@facilitycom.com.br'),
(13, 'Marli Luna Barros', 'Rua Expedicionário Manuel Chagas. Nº 8. Itaúna. São Gonçalo - RJ', '1982-12-12', 'lilunabarros@agenziamarketing.com.br'),
(14, 'Vinicius Eduardo Fernandes', 'Rua São Silvestre. Nº 1. Batista Campos. Belém - PA', '1985-11-13', 'iuseduardofernandes@sorocaba.com'),
(15, 'Anthony Márcio Francisco Martins', 'Travessa Macapá. Nº 9. Águas Belas. São José dos Pinhais - PR', '1977-09-01', 'anthonymarciofranciscomartins@vhbadvogados.com.br'),
(16, 'Sebastiana Lívia Moura', 'Alameda C. Nº 9. Jardim Industriário I. Cuiabá - MT', '1980-01-08', 'sebastianaliviamoura@dddrin.com.br'),
(17, 'Igor Jorge Almada', 'Rua Paralela 1. Nº12. Loteamento Santa Helena. Rio Branco - AC', '1996-12-30', 'igorjorgealmada_@inbox.com'),
(18, 'Flávia Raquel Maya Caldeira', 'Rua Regina Lopes. Nº19. Ininga. Teresina - PI', '1997-06-27', 'flaviaraquelmayacaldeira@uol.com.bt'),
(19, 'Stella Ayla Tereza Assunção', 'Vila Miracema. Nº 85. Jurunas. Belém - PA', '1992-02-13', 'stellaaylaterezaassuncao@jammer.com.br'),
(20, 'Caleb Yago Alves', 'Rua 6. Nº 85. Arianópolis. Caucaia - CE', '1979-05-05', 'calebyagoalves-87@aliancacadeiras.com.br');

INSERT INTO cursos (curso_id, nome, duracao)
VALUES
(1, 'Desenvolvimento Web', 6),
(2, 'Data Analytics', 6);

INSERT INTO departamentos (departamento_id, nome)
VALUES
(1, 'Facilitação'),
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
(3, 2,'T3 - Pitão');

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
(1, 'HTML5/CSS3', 'Deve ser capaz de fazer páginas estáticas usando HTML5 e CSS3'),
(2, 'Algoritmos', 'Deve ser capaz de desenvolver algoritmos'),
(3, 'Introdução a Javascript', 'Solucionar problemas utilizando Javascript'),
(4, 'Ferramentas de Desenvolvimento', 'Saber utilizar ferramentas de desenvolvimento para escrever os códigos'),
(5, 'Versionamento de código', 'Saber versionar e compartilhar código com Git e Github'),

(6, 'Mindset de crescimento', 'Desenvolver habitos de sucesso'),
(7, 'Aprender a aprender', 'Desenvolver competências comportamentais'),
(8, 'Hábitos', 'Saber criar novos hábitos saudáveis para o seu desenvolvimento pessoal'),
(9, 'Gestão de rotina', 'Organizar tempo e utilizar ferramentas de foco'),
(10, 'Resolução de problemas', 'Deve saber aplicar técnicas para resolver problemas cotidianos e em equipes'),   

(11, 'JavaScript - ES6', 'Deve compreender comandos básico da utilização da linguagem JavaScript'),
(12, 'JavaScript Orientado a Objetos', 'Deve compreender Orientação a Objeto aplicado a linguagem de JavaScript'),
(13, 'Utilização de API’s REST e Microsserviços com HTTPs', 'Deve compreender a utilização de APIs e REST e Microsserviços com HTTPs'),
(14, 'Manipulação de Arquivos', 'Organização de arquivos para utilização em sites'),
(15, 'Modularidade de códigos e funções', 'Deve conseguir organizar o código em módulos e funções'),
(16, 'Tipos de Dados', 'Organização de entrada e saída de dados'),
(17, 'Bootstrap', 'Deve saber utilizar o framework web com código-fonte aberto para desenvolvimento de componentes de interface e front-end para sites e aplicações web usando HTML, CSS e JavaScript'),
(18, 'Padrão MVC', 'Deve conhecer padrão de arquitetura de software responsável por contribuir na otimização da velocidade entre as requisições feitas pelo comando dos usuários.'),
(19, 'JSON', 'Deve compreender a utilização do sistema de trocas de informação JavaScript Object Notation'),     

(20, 'Introdução a programação', 'Deve compreender e aplicar lógica de programação'),
(21, 'Algoritmo e pensamento computacional', 'Compreender o que é o Algoritmo e a utilização dentro da lógica do 
pensamento computacional'),
(22, 'Introdução a Python', 'Deve compreender o que são strings e tipos de dados'),
(23, 'Entrada e saída de dados', 'Deve saber inserir e conferir dados em Python'),
(24, 'Lógica de Programação', 'Deve saber utilizar lógica de programação por meio de Python'),
(25, 'Versionamento de código', 'Deve saber utilizar ferramentas de versionamento como Git e aplicação em GitHub'),

(26, 'Funções, procedimentos e métodos', 'Deve conseguir otimizar as habilidades de python desenvolvidas no Módulo 1.'),
(27, 'Bibliotecas', 'Deve ter noção das possibilidades de utilização de bibliotecas em Python.'),
(28, 'Ambientes virtuais', 'Deve ser capaz de criar Ambientes virtuais em Python.'),

(29, 'Inteligência Emocional', 'Deve compreender princípios de inteligência emocional para identificar sentimentos e resolver situções cotidianas.'),
(30, 'Gestão de Conflitos', 'Deve compreender técnicas de Gestão de conflitos para trabalhar em equipe'),
(31, 'Relacionamento interpessoal', 'Deve saber utilizar técnicas apreendidas em Inteligência Emocional, Gestão de Conflitos e Comunicação Não Violenta para situações cotidianas.'),
(32, 'Trabalho em Equipe', 'Deve saber utilizar técnicas aprendidadas durante o curso para viabilizar situações em equipe.'),
(33, 'Comunicação', 'Deve saber utilizar técnicas de comunicação assertivas.');

INSERT INTO modulos (modulo_id, nome, categoria)
VALUES

(1, 'Introdução a Desenvolvimento Front-end', 'Tech'),
(2, 'Criação de hábitos de sucesso', 'Soft'), 
(3, 'Orientação a objetos e utilização de aplicações HTTP', 'Tech'),
(4, 'Introdução a Programação com Python', 'Tech'),
(5, 'Estrutura de Dados com Python', 'Tech'),
(6, 'Inteligência Emocional', 'Soft');


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