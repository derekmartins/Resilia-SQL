-- Alunos
select a.aluno_id, p.nome, p.endereco, p.data_nascimento
from alunos as a inner join pessoas as p
using(pessoa_id);

-- Facilitadores
select p.nome, p.endereco, p.data_nascimento
from facilitadores as f inner join pessoas as p
using(pessoa_id);


select t.nome, c.nome, a.aluno_id,  a.pessoa_id, f.pessoa_id, p.nome, p.endereco, p.data_nascimento
from alunos as a 
inner join pessoas as p
on a.pessoa_id = p.pessoa_id
inner join turmas as t
on a.turma_id = t.turma_id
inner join cursos as c
on t.curso_id = c.curso_id
inner join modulos_turmas as mt
on mt.turma_id = t.turma_id
inner join facilitadores f
on f.facilitador_id = mt.facilitador_id
order by t.nome, c.nome, p.nome;


-- Selecionar a quantidade total de estudantes cadastrados no banco;
select count(*) from alunos;

-- Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
select p.nome, t.nome, c.nome
from alunos as a 
inner join pessoas as p
on a.pessoa_id = p.pessoa_id
inner join turmas as t
on a.turma_id = t.turma_id
inner join cursos as c
on t.curso_id = c.curso_id;

-- Selecionar quais pessoas facilitadoras atuam em mais de uma turma
select mt.facilitador_id, count(distinct mt.turma_id)
from modulos_turmas as mt
group by mt.facilitador_id
having count(distinct mt.turma_id) > 1;

-- Pessoas que são Alunos e Facilitadores
select p.pessoa_id, p.nome, p.endereco from pessoas as p
where p.pessoa_id in (select f.pessoa_id from facilitadores as f) 
and p.pessoa_id in (select a.pessoa_id from alunos as a);


-- Selecionar Módulos e as suas Respectivas Habilidades e Descrições
select m.nome as "Módulo", h.nome as "Habilidade", h.descricao as "Descrição"
from modulos as m
inner join modulos_habilidades as mh
on m.modulo_id = mh.modulo_id
inner join habilidades as h
on h.habilidade_id = mh.habilidade_id;


-- Selecionar Módulos feitos por cada turma
select t.nome as "Turma", m.nome as "Módulo", m.categoria as "Categoria"
from modulos as m
inner join modulos_turmas as mt
on m.modulo_id = mt.modulo_id
inner join turmas as t
on t.turma_id = mt.turma_id
order by t.nome, mt.inicio;
