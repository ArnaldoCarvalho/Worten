# <<Inserir aqui o nome do sistema que está sendo testado>> Test

Projeto de testes automatizados para o sistema XXXX construído com Robot Framework. Os scripts encontram-se no diretório `tests/`. As configurações de ambientes, navegadores e outras parâmetrizações estão no diretório `configs/`.  

## Configuração

Para trabalhar com Robot Framework é necessário possuir o Python 3 ou superior instalado. As bibliotecas do Robot e do Selenium podem ser instaladas através do PIP, o gerenciador de pacotes do Python, conforme segue:

```sh
$ pip install robotframework
$ pip install robotframework-seleniumlibrary
```

## Execução

Para executar toda a bateria de testes, utilize o comando a seguir:

```sh
$ robot -d reports/ tests/
```

O parâmetro `-d` indica o diretório no qual serão guardados os logs e relatórios da execução. 

Para executar determinado grupo de tags, utilize o parâmetro `-i`: 

```sh
$ robot -d reports/ -i myTag tests/
```

## Resultados

Os resultados da exeução estarão nos relatórios e logs HTML gerados dentro do diretório `reports/` e podem ser visualizados no navegador de sua preferência.