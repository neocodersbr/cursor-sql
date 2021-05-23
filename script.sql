-- Declarar variáveis 
DECLARE @codcliente int, @primeironome VARCHAR(30), @sobrenome VARCHAR(60)
 
-- Cursor para percorrer os registros
DECLARE cursor1 CURSOR FOR
	select codcliente, nome, sobrenome 
	from clientes
 
--Abrindo Cursor
OPEN cursor1
 
-- Lendo a próxima linha
FETCH NEXT FROM cursor1 INTO @codcliente, @primeironome, @sobrenome
 
-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN
	---------------------------------------------- Códigos que serão executados a cada passada - INICIO
	update clientes 
		set nomecompleto = @primeironome + ' ' + @sobrenome 
	where codcliente = @codcliente 
	---------------------------------------------- Códigos que serão executados a cada passada - FIM 

-- Lendo a próxima linha
FETCH NEXT FROM cursor1 INTO @codcliente, @primeironome, @sobrenome
END
 
-- Fechando Cursor para leitura
CLOSE cursor1
 
-- Finalizado o cursor
DEALLOCATE cursor1

