const numberLevel = {
    1: "C-",
    2: "C",
    3: "CC+",
    4: "C+",
    5: "C+b-",
    6: "C+B-",
    7: "B-",
    8: "B-B",
    9: "B",
    10: "BB+",
    11: "B+",
    12: "A-",
    13: "A",
    14: "A 30/5",
    15: "A 30/4",
    16: "A 30/3",
    17: "A 30/2",
    18: "A 30/1",
    19: "A 30",
    20: "A 15/5",
    21: "A 15/4",
    22: "A 15/3",
    23: "A 15/2",
    24: "A 15/1",
    25: "A 15"
  }

const lessonModal = function() {
  const lessons = document.querySelectorAll(".btn-lesson-modal");
  const modal = document.querySelector(".modal-content")
  if (lessons && modal) {
    for (let lesson of lessons) {
      lesson.addEventListener('click', (event) => {
        const studentsListObj = JSON.parse(lesson.dataset.lessonStudents);
        let studentList = ``;
        for (let student of studentsListObj) {
          studentList += `<li>${student.last_name} ${student.first_name} ${student.age}ans ${numberLevel[student.level]}</li>`;
        }

        const modalInjection = `<div class="d-flex justify-content-around">
        <h1>C${lesson.dataset.lessonCourt}</h1>
        <h1>${lesson.dataset.lessonTime}</h1>
        <h1>${lesson.dataset.lessonTeacher}</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <ul>${studentList}</ul>`
        modal.innerHTML = modalInjection;
      })
    }
  }
}

export { lessonModal };
