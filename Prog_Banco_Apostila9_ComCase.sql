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


