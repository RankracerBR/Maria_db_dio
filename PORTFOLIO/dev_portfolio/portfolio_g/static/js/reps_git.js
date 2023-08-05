// Replace 'YOUR_GITHUB_USERNAME' and 'YOUR_ACCESS_TOKEN' with your actual GitHub username and access token.
const username = 'RankracerBR';
const accessToken = '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';
const apiUrl = `https://api.github.com/users/${username}/repos`;

const customStyle = `
  list-style: none;
  padding: 5;
  margin: 10;
  font-family: Arial, sans-serif;
  font-size: 16px;
`;

// Função para fazer uma requisição AJAX (utilizando XMLHttpRequest) para a API do GitHub.
function getRepositories() {
  const xhr = new XMLHttpRequest();
  xhr.open('GET', apiUrl, true);
  xhr.setRequestHeader('Authorization', `Bearer ${accessToken}`);
  xhr.onload = function() {
    if (xhr.status === 200) {
      const repositories = JSON.parse(xhr.responseText);
      displayRepositories(repositories);
    } else {
      console.error('Erro ao obter os repositórios:', xhr.status, xhr.statusText);
    }
  };
  xhr.onerror = function() {
    console.error('Erro na requisição.');
  };
  xhr.send();
}

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

// Chamando a função para obter e exibir os repositórios ao carregar a página.
window.onload = getRepositories;