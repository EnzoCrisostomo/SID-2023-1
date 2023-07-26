# SID-2023-1

## Integrantes

| Nome                         | Github                                                | Email                         |
| ---------------------------- | ----------------------------------------------------- | ----------------------------- |
| Enzo Crisóstomo Nogueira     | [EnzoCrisostomo](https://github.com/EnzoCrisostomo)   | enzo.crisostomo2000@gmail.com |
| Heitor Magalhaes Vieira      | [VieiraHeitor](https://github.com/VieiraHeitor)       | heitor.magalhaes@aluno.unb.br |
| Júlia Ramos Rodrigues        | [juliaramos541](https://github.com/juliaramos541)     | rodrigues.ramos@aluno.unb.br  |

## Quick start
### Preparar banco de dados
Rodar scripts localizados em ```/scripts``` para iniciar e preencher o banco de dados. (postgresql)

### Preparar variáveis ambiente
Fazer uma cópia do arquivo .```exammple.env``` e a renomear para ```.env```. 

Alterar o conteúdo de acordo com o endereço do seu banco de dados e a porta desejada para o backend.

#### Exemplo:
```
DATABASE_URL=postgresql://postgres:password@localhost:5432/SIGAA?schema=public

BACKEND_PORT=3333
```

### Instalar pacotes
```bash
npm install
```
### Iniciar servidor
Isso também irá construir o arquivo swagger unificado
```bash
npm start
```

### Acessar documentação api swagger
O servidor hospeda uma página web contendo o swagger em [http://localhost:3333/SIGAA/api/matriculasigaa/Docs](http://localhost:3333/SIGAA/api/matriculasigaa/Docs)


## Scripts npm para dar merge de todos os arquivos openapi em apenas um:
### Json
```bash
npm run openapi-build-json
```
### Yaml
```bash
npm run openapi-build-yaml
```