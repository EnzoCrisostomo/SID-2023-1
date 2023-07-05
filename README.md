# SID

# Script npm para iniciar o servidor:
```bash
npm start
```

# Scripts npm para dar merge de todos os arquivos em apenas um:
## Json
```bash
npm run openapi-build-json
```
ou
```bash
npx swagger-cli bundle openapi/sigaa.yaml --outfile src/openapi/sigaa-enzo-julia-heitor-2023.1.json --type json
```
## Yaml
```bash
npm run openapi-build-yaml
```
ou
```bash
npx swagger-cli bundle openapi/sigaa.yaml --outfile src/openapi/sigaa-enzo-julia-heitor-2023.1.yaml --type yaml
```