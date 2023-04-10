--Alunos: Fernando Cardoso e Kayo Kawam
--Turma: 3° Semestre - Big Data para negócios
--Matéria: Programação em Banco de Dados

--Exercícios

-- 1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.

DO $$
DECLARE
	a INTEGER := valor_aleatorio_entre(0,1000);
BEGIN

	RAISE NOTICE 'O número é %', a;
	
	IF a <> 0 THEN -- Aqui fiz diferente de 0
		
		IF a % 3 = 0 THEN
			RAISE NOTICE 'O valor acima é múltiplo de 3';
		ELSE
			RAISE NOTICE 'O valor acima não é múltiplo de 3';
		END IF;
	END IF;
END; $$





-- 1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.

DO $$
DECLARE
	a INTEGER := valor_aleatorio_entre(0,1000);
BEGIN

	RAISE NOTICE 'O número é %', a;
	
	IF a <> 0 THEN -- Aqui fiz diferente de 0
		
		IF a % 3 = 0 THEN
			RAISE NOTICE 'O valor acima é múltiplo de 3';
		ELSEIF a % 5 = 0  THEN
			RAISE NOTICE 'O valor acima é múltiplo de 5';
		ELSE
			RAISE NOTICE 'O valor acima não é múltiplo de 3, nem de 5';
		END IF;
	END IF;
END; $$





-- 3. Faça um programa que opere de acordo com o seguinte menu

DO $$
DECLARE
	num1 INT := valor_aleatorio_entre(1,50);
	num2 INT := valor_aleatorio_entre(1,50);
	
	op INT := valor_aleatorio_entre(1,4);
	soma INT;
	sub INT;
	divisao INT;
	multiplicacao INT;

BEGIN

	RAISE NOTICE 'Os valores gerados são % e %', num1, num2;
	IF op <> 0 THEN
		IF op = 1 THEN
			soma = num1 + num2;
			RAISE NOTICE 'O resultado da soma é %', soma;
		ELSEIF op = 2 THEN
			sub = num1 - num2;
			RAISE NOTICE 'O resultado da subtração é %', sub;
		ELSEIF op = 3 THEN
			divisao = num1 / num2;
			RAISE NOTICE 'O resultado da divisão é %', divisao;
		ELSEIF op = 4 THEN
			multiplicacao = num1 * num2;
			RAISE NOTICE 'O resultado da multiplicção é %', multiplicacao;
		ELSE
			RAISE NOTICE 'O valor está fora dos padrões';		
		END IF;
	
	END IF;
END;
$$





--4. Um comerciante comprou um produto e quer vendê-lo com um lucro de 45%
--se o valor da compra for menor que R$ 20. Caso contrário, ele deseja lucro de 30%. Faça
--um programa que, dado o valor do produto, calcula o valor da venda 

DO $$
DECLARE
	valor_produto INTEGER := valor_aleatorio_entre(1,40);
	valor_venda INTEGER;
BEGIN

	RAISE NOTICE 'O valor do produto é %', valor_produto;
		
	IF valor_produto < 20 THEN
		valor_venda = (valor_produto * 1.45);
		RAISE NOTICE 'O valor do produto é %, ele será vendido por %', valor_produto, valor_venda;
	ELSE
		valor_venda = (valor_produto * 1.30);
		RAISE NOTICE 'O valor do produto é %, ele será vendido por %', valor_produto, valor_venda;
	END IF;
END; $$






/* 5. The company ABC decided to give a salary increase to its employees, according to the following table:
Salary					Readjustment Rate
0 - 400.00						15%
400.01 - 800.00					12%
800.01 - 1200.00				10%
1200.01 - 2000.00				7%
Above 2000.00					4%
Print 3 messages followed by the corresponding numbers (see example) informing the new salary, 
- the among of money earned (both must be shown with 2 decimal places) 
- the percentual obtained by the employee. Note:
Novo salario:  means "New Salary"
Reajuste ganho: means "Money earned"
Em percentual: means "In percentage" 						*/ 

DO $$
DECLARE
	salario NUMERIC (10,2) := valor_aleatorio_entre(0,3500);
	novo_salario NUMERIC (10,2);
	
	reajuste_ganho NUMERIC(10,2);
	percentual NUMERIC(10,2);
BEGIN
	RAISE NOTICE 'O salário é de R$ %', salario;
	
	IF salario > 2000 THEN
		novo_salario := salario * (1 + 0.04);
		reajuste_ganho := novo_salario - salario;
		percentual := 0.04 * 100;
		RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
		novo_salario, reajuste_ganho, percentual;
	ELSE 
		 IF salario BETWEEN 1200.01 AND 2000 THEN
			novo_salario := salario * (1 + 0.07);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.07 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
			
		ELSEIF salario BETWEEN SYMMETRIC 1200 AND 800 THEN
			novo_salario := salario * (1 + 0.10);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.10 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
		ELSEIF salario BETWEEN 400 AND 800 THEN
			novo_salario := salario * (1 + 0.12);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.12 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
		ELSE 
			novo_salario := salario * (1 + 0.15);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.15 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
		END IF;
	END IF;
	

END; $$