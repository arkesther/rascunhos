import re

def tabela_trans(tabela_md, caption="inserir título"):

	linhas = [
		linha.strip() for linha in tabela_md.strip().split("\n") if linha.strip() 
																		#divide em linhas e remove espaço nas pontas
	]
	
	dados_tabela = [] 													#lista
	for linha in linhas:
		linha_limpa = re.sub(r"\s+", " ", linha).strip() 				#troca espaço invisível por espaço normal
	
		if re.match(r"^\|[\s\:\-\|]+\|$", linha_limpa): 
			continue 													#se a linha for divisória do markdown | --- | --- | não vai para o latex
		
		cells =  [cell.strip() for cell in linha_limpa.split("|")[1:-1]]# corta a linha onde tem | do primeiro até o final sem incluir o último | que faz parte da tabela (por isso nao começa com 0)
	
		if any (cell != "" for cell in cells):
			dados_tabela.append(cells)  								#só add uma linha na tabela se ela tiver texto de vdd
	
	if not dados_tabela:
		return ""  														#se dados da tabela ficaram vazios não receber nenhuma linha válida
		
	
	ncolunas = len(dados_tabela[0])  									#conta quantos itens existem nos dados
	coldef = "|" + "|".join(["c"] * ncolunas) + "|"						#bem direto, um | dps colocou (|c)*n e fecha com |
	
	linhastex = []
	linhastex.append(r"\begin{table}[H]") 								#string r desativa tudo por isso nao precisa de duas barras, mas nao funciona para colocar variavel de escape
	linhastex.append(f"\\caption{{{caption}}}") 						#chave dupla pra ir chave como texto + chave de verdade que é pra substituir pela variavel definida em cima (necessario quando dentro de texto "")
	linhastex.append(r"\centering") 									#append add item no fim da lista
	linhastex.append(f"\\begin{{tabular}}{{{coldef}}}")					#\ = comando, entao precisa segunda barra para desativar na string f
	linhastex.append(r"\hline")
    
	for i, row in enumerate(dados_tabela):  							# no enumerate o primeiro valor é indice (i) e o segundo é o conteúdo
		transrow = []
		# ~ for j, cell in enumerate(row):									# penas se quiser coluna em negrito
		for cell in row:
		# ~ if j == 0:														# continuação da coluna em negrito
			if i == 0:
				transrow.append(f"\\textbf{{{cell}}}") 
				# ~ transrow.append(f"{cell}")								# o mesmo do de cima mas sem texto em negrito
			else:
				if re.match(r"^\d+([.,]\d+)?$", cell):
					transrow.append(f"${cell}$") 						#se for numero colocar entre  cifrao, precisa do f na frente senao vai ser impresso como texto
				else:
					transrow.append(cell)

		linhastex.append(" & ".join(transrow) + r" \\")
		linhastex.append(r"\hline")

	linhastex.append(r"\end{tabular}")
	linhastex.append(r"\end{table}")

	return "\n".join(linhastex) 										#pega todas as linhas e junta num único texto
		
# --- Inserir tabela abaixo ---

md_input = """

| Material | $\rho$ (g/cm$^3$)     |
| -------- | --------------------- |
| Alumínio | 2,69                  |
| Cobre    | 8,93                  |
| Latão    | 8,56                  |
| Água     | 1                     |
| Álcool   | 0,789                 |
| N$_2$    | 0,001250 @ 0ºC, 1 Atm |

"""


latex_output = tabela_trans(md_input)

print(latex_output)		
		
		
		
		
