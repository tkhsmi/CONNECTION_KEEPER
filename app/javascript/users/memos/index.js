document.addEventListener('DOMContentLoaded', function() {
  loadNewPersonModal()
  loadNewMemoModal()

  const memoRows = document.getElementsByClassName('memo-row');

  for (let i = 0; i < memoRows.length; i++) {
    memoRows[i].addEventListener("click", function() {
      for (let j = 0; j < memoRows.length; j++) {
        memoRows[j].classList.remove('active');
      }

      const memoId = this.getAttribute('data-id');

      fetch(`/users/memos/${memoId}`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
          const date = new Date(data.created_at)
          document.querySelector('.memo-detail .memo-date').textContent = date.getFullYear() + '/' + ("0"+(date.getMonth() + 1)).slice(-2) + '/' + ("0"+date.getDate()).slice(-2);
          document.querySelector('.memo-detail .memo-content').textContent = data.content;

          document.querySelector('.edit-button').setAttribute('href', '/users/memos/' + data.id + '/edit');
          document.querySelector('.delete-button').setAttribute('href', '/users/memos/' + data.id);

          // TODO ヒトも更新する

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
