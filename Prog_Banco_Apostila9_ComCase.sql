-- Fernando Cardoso e Kayo Kawam
-- Exercicios Apostila 9 - CASE

-- 1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.

DO $$
DECLARE 
	valor INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor gerado é: %', valor;
	CASE 
		WHEN valor % 3 = 0 THEN
			RAISE NOTICE 'Multiplo de Três', valor;
		ELSE
			RAISE NOTICE 'Não é Multiplo de Três', valor;
		END CASE;
END;
$$

-- 1.2  Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.

DO $$
DECLARE
	valor INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor gerado é: %', valor;
	CASE 
		WHEN valor % 3 = 0 THEN
			RAISE NOTICE 'Multiplo de Três', valor;
		WHEN valor % 5 = 0 THEN
			RAISE NOTICE 'Multiplo de Cinco', valor;
		ELSE 
			RAISE NOTICE 'Não é multiplo de Três nem de Cinco', valor;
	END CASE;
END;
$$

-- 1.3 Faça um programa que opera de acordo com o seguinte menu.

-- opções:
-- SOMA, SUBTRAÇÃO, MULTIPLICAÇÃO e DIVISÃO

DO $$
DECLARE
	num1 INT = valor_aleatorio_entre(1, 20);
	num2 INT = valor_aleatorio_entre(1, 20);
	menu INT = valor_aleatorio_entre(1, 4);
	
	soma INT;
	subtraçao INT;
	multiplicaçao INT;
	divisao INT;
	
BEGIN
	RAISE NOTICE 'Os valores do calculo são %, %', num1, num2;
	CASE
		WHEN menu <> 0 THEN
			soma = num1 + num2;
			RAISE NOTICE 'O resultado do calculo é %', soma;
		WHEN  = 2 THEN
			subtraçao = num1 - num2;
			RAISE NOTICE 'O resultado do calculo é %', subtraçao;
		WHEN menu = 3 THEN
			multiplicaçao = num1 * num2;
			RAISE NOTICE 'O resultado do calculo é %', multiplicaçao;
		ELSE menu
			CASE
				WHEN menu = 4 THEN
					divisao = num1 / num2;
					RAISE NOTICE 'O resultado do calculo é %', divisao;
				WHEN divisao < 0 THEN
					RAISE NOTICE 'A divisão não é possível', divisao;
			END CASE;
	END CASE;
	CASE 
		WHEN menu = 1 THEN
			RAISE NOTICE 'A operação realiazada foi soma';
		WHEN menu = 2 THEN
			RAISE NOTICE 'A operação realizada foi Subtração';
		WHEN menu = 3 THEN
			RAISE NOTICE 'A operação realizada foi Multiplicação';
		ELSE
			RAISE NOTICE 'A operação realizada foi Divisão';		
	END CASE;
END;
$$



/* 4. Um comerciante comprou um produto e quer vendê-lo com um lucro de 45%
se o valor da compra for menor que R$ 20. Caso contrário, ele deseja lucro de 30%. Faça
um programa que, dado o valor do produto, calcula o valor da venda */


DO $$
DECLARE
	produto INTEGER := valor_aleatorio_entre(0,100);
	lucro_primario NUMERIC (5,2) := 0.45;
	lucro_secundario NUMERIC (5,2) := 0.30;
	
	venda NUMERIC (5,2);
BEGIN

	CASE produto
		WHEN 20 THEN
			venda := produto * (1 + lucro_primario);
			RAISE NOTICE 'O valor da venda será de R$ %', venda;
		ELSE 
			venda := produto * (1 + lucro_secundario);
			RAISE NOTICE 'O valor da venda será de R$ %', venda;
	END CASE;
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
-- 	mensagem VARCHAR(500);
BEGIN
	RAISE NOTICE 'O salário é de R$ %', salario;
	
	CASE salario
		WHEN 2000 THEN
			novo_salario := salario * (1 + 0.04);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.04 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
		WHEN 1200.01 THEN
			novo_salario := salario * (1 + 0.07);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.07 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
		WHEN 800 THEN
			novo_salario := salario * (1 + 0.10);
			reajuste_ganho := novo_salario - salario;
			percentual := 0.10 * 100;
			RAISE NOTICE 'O novo salário será de R$ %, com um reajuste de R$ %. Correspondendo um percentual de %', 
			novo_salario, reajuste_ganho, percentual;
			
		WHEN 400 THEN
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
	END CASE;
END; $$
