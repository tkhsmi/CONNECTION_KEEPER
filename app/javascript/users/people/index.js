const personRows = document.getElementsByClassName('person-row');

for (let i = 0; i < personRows.length; i++) {
  personRows[i].addEventListener("click", function() {
    for (let j = 0; j < personRows.length; j++) {
      personRows[j].classList.remove('active');
    }

    const personId = this.getAttribute('data-id');

    fetch(`/users/people//${personId}`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        const formattedBirthday = data.birthday.replace(/-/g, '/');
        document.querySelector('.person-detail .person-name').textContent = data.name;
        document.querySelector('.person-detail .person-birthday').textContent = formattedBirthday + '(' + getAge(new Date(data.birthday)) + '歳)';

        // TODO メモも更新する

        updateOrAddIdParam(data.id)
        this.classList.add('active');
      })
      .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
      });
  });
}

function getAge(birthday) {
  const today = new Date();
  const thisYearsBirthday = new Date(today.getFullYear(), birthday.getMonth(), birthday.getDate())
  let age = today.getFullYear() - birthday.getFullYear()

  if(today < thisYearsBirthday) {
    age--;
  }

  return age;
}

function updateOrAddIdParam(newId) {
  const url = new URL(window.location.href);
  const params = url.searchParams;

  if (params.has('id')) {
    params.set('id', newId);
  } else {
    params.append('id', newId);
  }

  // 新しいURLをブラウザのアドレスバーに設定（ただしページはリロードしない）
  window.history.replaceState({}, '', `${url.pathname}?${params.toString()}`);
}
