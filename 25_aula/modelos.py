import os class Livro: 
""" Representa um único livro com título e autor.
 Esta classe é o "molde" para cada livro a ser cadastrado.
  """
  def __init__(self, titulo: str, autor: str):
       # Atributos de cada objeto Livro
     self.titulo = titulo 
     self.autor = autor


class Estante: 
   """ Gerencia uma coleção de objetos Livro.
      É responsável por adicionar, carregar e salvar os livros.
   """ 
  def __init__(self, arquivo_json='estante.json'): 
      self._arquivo = arquivo_json 
      self._livros = [] self.carregar_livros()  

    @property
    def livros(self):
      """Propriedade para acessar a lista de livros de forma segura."""
       return self._livros

    def adicionar_livro(self, livro: Livro): 
        """Adiciona um novo livro à estante e salva a lista no arquivo."""
        if isinstance(livro, Livro): 
            self._livros.append(livro) 
            self.salvar_livros()

   def salvar_livros(self):
        """Salva a lista atual de livros no arquivo JSON."""
         lista_para_salvar = [vars(livro) for livro in self._livros]
        try:
            with open(self._arquivo, 'w', encoding='utf-8') as f:
               json.dump(lista_para_salvar, f, ensure_ascii=False, indent=4)
        except IOError as e: 
            print(f"Erro ao salvar o arquivo: {e}")

    def carregar_livros(self): 
        """Carrega os livros do arquivo JSON ao iniciar."""
        if not os.path.exists(self._arquivo): 
             return
        try:
            with open(self._arquivo, 'r', encoding='utf-8') as f: 
                dados_json = json.load(f)
                self._livros = [Livro(dado['titulo'], dado['autor']) for dado in dados_json]
        except (json.JSONDecodeError, IOError) as e: 
            print(f"Erro ao carregar ou decodificar o arquivo: {e}") 
            self._livros = []