// Repositórios conhecidos
const repositories = [
  { name: "repo1", html_url: "https://github.com/RankracerBR/Learning-Python"},
  { name: "repo2", html_url: "https://github.com/RankracerBR/BMW-FAN-PAGE"},
  { name: "repo2", html_url: "https://github.com/RankracerBR/Matplotlib-Numpy"},
  { name: "repo2", html_url: "https://github.com/RankracerBR/ROADMAP-PYTHON"},
  // Adicione mais repositórios conforme necessário
];

// Função para exibir os repositórios na página.
function displayRepositories(repositories) {
  const reposListDiv = document.getElementById('repos-list');
  let repoListHtml = `<h2 style="${customStyle}">Meus Repositórios:</h2><ul>`;

  // Concatene o estilo personalizado à lista de repositórios HTML
  repositories.forEach((repo) => {
    repoListHtml += `<li style="${customStyle}"><a href="${repo.html_url}" target="_blank">${repo.name}</a></li>`;
  });

  repoListHtml += '</ul>';
  reposListDiv.innerHTML = repoListHtml;
}

// Chamando a função para exibir os repositórios ao carregar a página.
window.onload = function() {
  displayRepositories(repositories);
};