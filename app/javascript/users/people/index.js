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
        document.querySelector('.person-detail .person-furigana').textContent = data.furigana;
        document.querySelector('.person-detail .person-name').textContent = data.name;

        document.querySelector('.edit-button').setAttribute('href', '/users/people/' + data.id + '/edit');
        document.querySelector('.delete-button').setAttribute('href', '/users/people/' + data.id);

        const birthday = document.querySelector('.person-detail .person-birthday')
        if(data.birthday) {
          birthday.textContent = formattedBirthday + '(' + getAge(new Date(data.birthday)) + '歳)';
          birthday.closest('.person-detail-row').classList.remove("d-none");
        } else {
          birthday.closest('.person-detail-row').classList.add("d-none");
        }

        const phoneNumber = document.querySelector('.person-detail .person-phone-number')
        if(data.phone_number) {
          phoneNumber.textContent = data.phone_number;
          phoneNumber.closest('.person-detail-row').classList.remove("d-none");
        } else {
          phoneNumber.closest('.person-detail-row').classList.add("d-none");
        }

        const mail = document.querySelector('.person-detail .person-mail')
        if(data.mail) {
          mail.textContent = data.mail;
          mail.closest('.person-detail-row').classList.remove("d-none");
        } else {
          mail.closest('.person-detail-row').classList.add("d-none");
        }

        const address = document.querySelector('.person-detail .person-address')
        if(data.address) {
          address.textContent = data.address;
          address.closest('.person-detail-row').classList.remove("d-none");
        } else {
          address.closest('.person-detail-row').classList.add("d-none");
        }

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
