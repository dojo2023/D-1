window.onload = function() {
  // 現在の日付を取得
  var today = new Date();

  // 年、月、日を取得
  var year = today.getFullYear();
  var month = today.getMonth() + 1;
  var day = today.getDate();

  // HTMLに日付を表示
  var dateElement = document.getElementById("date");
  dateElement.innerHTML = year + "年" + month + "月" + day + "日";
};

	//年月日のプルダウン
let userBirthdayYear = document.querySelector('.birthday-year');
let userBirthdayMonth = document.querySelector('.birthday-month');
let userBirthdayDay = document.querySelector('.birthday-day');

/**
 * selectのoptionタグを生成するための関数
 * @param {Element} elem 変更したいselectの要素
 * @param {Number} val 表示される文字と値の数値
 */
function createOptionForElements(elem, val) {
  let option = document.createElement('option');
  option.text = val;
  option.value = val;
  elem.appendChild(option);
}

//年の生成
for(let i = 1920; i <= 2023; i++) {
  createOptionForElements(userBirthdayYear, i);
}
//月の生成
for(let i = 1; i <= 12; i++) {
  createOptionForElements(userBirthdayMonth, i);
}
//日の生成
for(let i = 1; i <= 31; i++) {
  createOptionForElements(userBirthdayDay, i);
}

/**
 * 日付を変更する関数
 */
function changeTheDay() {
  //日付の要素を削除
  userBirthdayDay.innerHTML = '';

  //選択された年月の最終日を計算
  let lastDayOfTheMonth = new Date(userBirthdayYear.value, userBirthdayMonth.value, 0).getDate();

  //選択された年月の日付を生成
  for(let i = 1; i <= lastDayOfTheMonth; i++) {
    createOptionForElements(userBirthdayDay, i);
  }
}

userBirthdayYear.addEventListener('change', function() {
  changeTheDay();
});

userBirthdayMonth.addEventListener('change', function() {
  changeTheDay();
});

	//年月日のプルダウン
let userGoalYear = document.querySelector('.goal-year');
let userGoalMonth = document.querySelector('.goal-month');
let userGoalDay = document.querySelector('.goal-day');

/**
 * selectのoptionタグを生成するための関数
 * @param {Element} elem 変更したいselectの要素
 * @param {Number} val 表示される文字と値の数値
 */
function createOptionForElements(elem, val) {
  let option = document.createElement('option');
  option.text = val;
  option.value = val;
  elem.appendChild(option);
}

//年の生成
for(let i = 2023; i <= 2030; i++) {
  createOptionForElements(userGoalYear, i);
}
//月の生成
for(let i = 1; i <= 12; i++) {
  createOptionForElements(userGoalMonth, i);
}
//日の生成
for(let i = 1; i <= 31; i++) {
  createOptionForElements(userGoalDay, i);
}

/**
 * 日付を変更する関数
 */
function changeTheDay() {
  //日付の要素を削除
  userGoalDay.innerHTML = '';

  //選択された年月の最終日を計算
  let lastDayOfTheMonth = new Date(userGoalYear.value, userGoalMonth.value, 0).getDate();

  //選択された年月の日付を生成
  for(let i = 1; i <= lastDayOfTheMonth; i++) {
    createOptionForElements(userGoalDay, i);
  }
}

userGoalYear.addEventListener('change', function() {
  changeTheDay();
});

userGoalMonth.addEventListener('change', function() {
  changeTheDay();
});
