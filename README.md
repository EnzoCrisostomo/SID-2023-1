# SID-2023-1

## Integrantes

| Nome                         | Github                                                | Email                         |
| ---------------------------- | ----------------------------------------------------- | ----------------------------- |
| Enzo Crisóstomo Nogueira     | [EnzoCrisostomo](https://github.com/EnzoCrisostomo)   | enzo.crisostomo2000@gmail.com |
| Heitor Magalhaes Vieira  | [VieiraHeitor](https://github.com/VieiraHeitor) | heitor.magalhaes@aluno.unb.br   |
| Júlia Ramos Rodrigues | [juliaramos541](https://github.com/juliaramos541)     | rodrigues.ramos@aluno.unb.br |

## Quick start
### Preparar ambiente
Copiar o arquivo exmample.env e renomear para ```.env```. 

Caso necessário alterar seu conteúdo de acordo com o endereço do seu banco de dados e a porta desejada para o backend.

### Instalar pacotes
```bash
npm install
```
### Preparar banco com prisma
```bash
npm run migrate-dev
```

### Iniciar servidor
Isso também irá construir o arquivo swagger unificado
```bash
npm start
```

### Verificar swagger
O servidor hospeda uma página web contendo o swagger em [http://localhost:3333/SIGAA/api/matriculasigaa/Docs](http://localhost:3333/SIGAA/api/matriculasigaa/Docs)


## Scripts npm para dar merge de todos os arquivos em apenas um:
### Json
```bash
npm run openapi-build-json
```
ou
```bash
npx swagger-cli bundle openapi/sigaa.yaml --outfile src/openapi/sigaa-enzo-julia-heitor-2023.1.json --type json
```
### Yaml
```bash
npm run openapi-build-yaml
```
ou
```bash
npx swagger-cli bundle openapi/sigaa.yaml --outfile src/openapi/sigaa-enzo-julia-heitor-2023.1.yaml --type yaml
```