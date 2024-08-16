document.addEventListener('DOMContentLoaded', function() {
  loadNewPersonModal()
  loadNewMemoModal()

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
          document.querySelector('.person-detail .person-furigana').textContent = data.furigana;
          document.querySelector('.person-detail .person-name').textContent = data.name;

          document.querySelector('.edit-button').setAttribute('href', '/users/people/' + data.id + '/edit');
          document.querySelector('.delete-button').setAttribute('href', '/users/people/' + data.id);

          const birthday = document.querySelector('.person-detail .person-birthday')
          if(data.birthday) {
            const formattedBirthday = data.birthday.replace(/-/g, '/');
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
});

function loadNewPersonModal() {
  const newPersonModal = document.getElementById('newPersonModal');
  const openNewPersonModalBtn = document.getElementById('openNewPersonModalBtn');
  const closeNewPersonModalBtn = document.getElementById('closeNewPersonModalBtn');

  // モーダルを開く
  openNewPersonModalBtn.addEventListener('click', function() {
    newPersonModal.style.display = 'block';
  });

  // モーダルを閉じる
  closeNewPersonModalBtn.addEventListener('click', function() {
    newPersonModal.style.display = 'none';
    clearPersonForm();
  });

  // モーダルの外側をクリックしたときにモーダルを閉じる
  window.addEventListener('click', function(event) {
    if (event.target == newPersonModal) {
      newPersonModal.style.display = 'none';
      clearPersonForm();
    }
  });
}

function clearPersonForm() {
  document.getElementById('person_furigana').value = '';
  document.getElementById('person_name').value = '';
  document.getElementById('person_birthday').value = '';
  document.getElementById('person_phone_number').value = '';
  document.getElementById('person_mail').value = '';
  document.getElementById('person_address').value = '';
}

function loadNewMemoModal() {
  const newMemoModal = document.getElementById('newMemoModal');
  const openNewMemoModalBtn = document.getElementById('openNewMemoModalBtn');
  const closeNewMemoModalBtn = document.getElementById('closeNewMemoModalBtn');

  // モーダルを開く
  openNewMemoModalBtn.addEventListener('click', function() {
    newMemoModal.style.display = 'block';
  });

  // モーダルを閉じる
  closeNewMemoModalBtn.addEventListener('click', function() {
    newMemoModal.style.display = 'none';
    clearMemoForm();
  });

  // モーダルの外側をクリックしたときにモーダルを閉じる
  window.addEventListener('click', function(event) {
    if (event.target == newMemoModal) {
      newMemoModal.style.display = 'none';
      clearMemoForm();
    }
  });
}

function clearMemoForm() {
  document.getElementById('memo_content').value = '';
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
