CREATE TABLE trab1_departamento 
  ( 
     coddept          NUMBER NOT NULL, 
     nomedepartamento VARCHAR2(20), 
     CONSTRAINT trab1_departamento_pk PRIMARY KEY (coddept) ENABLE 
  ); 

CREATE TABLE trab1_empregado 
  ( 
     codemp       NUMBER NOT NULL, 
     nomeemp      VARCHAR2(20), 
     coddept      NUMBER, 
     salario      NUMBER (*, 2), 
     dataadmissao DATE, 
     CONSTRAINT trab1_empregado_pk PRIMARY KEY (codemp) ENABLE, 
     CONSTRAINT empdep_fk FOREIGN KEY (coddept) REFERENCES trab1_departamento( 
     coddept) 
  ); 

CREATE TABLE trab1_venda 
  ( 
     numeronf  NUMBER NOT NULL, 
     datavenda DATE, 
     codemp    NUMBER NOT NULL, 
     CONSTRAINT trab1_venda_pk PRIMARY KEY (numeronf) ENABLE, 
     CONSTRAINT vendaemp_fk FOREIGN KEY (codemp) REFERENCES trab1_empregado( 
     codemp) 
  ); 

CREATE TABLE trab1_tipoprod 
  ( 
     codigotipoprod    NUMBER NOT NULL, 
     descricaotipoprod VARCHAR2(20), 
     CONSTRAINT tipoprod_pk PRIMARY KEY (codigotipoprod) ENABLE 
  ); 

CREATE TABLE trab1_produto 
  ( 
     codigotipoprod    NUMBER NOT NULL, 
     numeroprod        NUMBER, 
     descricaotipoprod VARCHAR2(20), 
     CONSTRAINT prod_pk PRIMARY KEY (numeroprod) ENABLE, 
     CONSTRAINT produtotipo_fk FOREIGN KEY (codigotipoprod) REFERENCES 
     trab1_tipoprod(codigotipoprod) 
  ); 

CREATE TABLE trab1_itemvenda 
  ( 
     numeronf   NUMBER NOT NULL, 
     numeroprod NUMBER, 
     qtdeitem   NUMBER, 
     precoitem  NUMBER, 
     CONSTRAINT itemvenda_pk PRIMARY KEY (numeronf, numeroprod, qtdeitem ) 
     ENABLE, 
     CONSTRAINT itemvendaprod_fk FOREIGN KEY ( numeroprod ) REFERENCES 
     trab1_produto(numeroprod), 
     CONSTRAINT itemvendavenda_fk FOREIGN KEY ( numeronf ) REFERENCES 
     trab1_venda(numeronf ) 
  ); 