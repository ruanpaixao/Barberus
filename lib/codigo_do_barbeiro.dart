// codigo_do_barbeiro.dart

class Service {
  String nome;
  String preco;

  Service({
    required this.nome,
    required this.preco,
  });
}

// Lista de serviços dinâmicos (simulação de banco de dados)
List<Service> servicos = [
  Service(nome: 'Serviço 1', preco: 'R\$ 100,00'),
  Service(nome: 'Serviço 2', preco: 'R\$ 200,00'),
  Service(nome: 'Serviço 3', preco: 'R\$ 300,00'),
];

// Função para adicionar um serviço
void adicionarServico(String nome, String preco) {
  servicos.add(Service(nome: nome, preco: preco));
}

// Função para remover um serviço
void removerServico(Service service) {
  servicos.remove(service);
}

